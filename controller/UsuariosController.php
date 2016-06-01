<?php

/*
----------------------------------------------------------------------------------------
Parametros para que funcionen las cookies en un servidor
que no permita la creación de cookies, ya que el php.ini 
no permite estas directivas por seguridad.
----------------------------------------------------------------------------------------
ini_set("session.use_cookies", 0);
ini_set("session.use_only_cookies", 0);
ini_set("session.use_trans_sid", 1);
ini_set("session.cache_limiter", "");
session_start();
----------------------------------------------------------------------------------------
*/

include_once '../DAO/UsuariosDAO.php';

/**
 * La clase UsuariosController maneja toda la parte de procesamiento de datos de usuarios
 *
 */
class UsuariosController {

    //ATRIBUTOS DE LA CLASE

    public $UsuariosDAO;
    public $id_modulo;
    public $NameCookieApp;
        
    //CONSTRUCTOR DE LA CLASE

    public function __construct() {
    	
    	include('../conexion/datos.php');

        $this->UsuariosDAO = new UsuariosDAO();
        $this->id_modulo = 13;
        $this->NameCookieApp = $NomCookiesApp;
    }

    //Funciones-----------------------------------------------------------------------

    public function permisosUsuario($fkID_modulo,$fkID_tipo_usuario) {
        return $this->UsuariosDAO->permisos($fkID_modulo,$fkID_tipo_usuario);
    }
    
    public function getUsuarios() {
        return $this->UsuariosDAO->getUsuarios();
    }

    public function getTipoUsuarios() {
        
        $tipo = $this->UsuariosDAO->getTipoUsuarios();
        
        for($a=0;$a<sizeof($tipo);$a++){
        	echo "<option value='".$tipo[$a]["pkID"]."'>".$tipo[$a]["nombre"]."</option>";
        }
    }

    //---------------------------------------------------------------------------------
    public function getTablaUsuarios($tipo){

    	if ( $tipo == "Administrador") {
    		# code...

    		//get de los usuarios
	    	$usuarios = $this->UsuariosDAO->getUsuarios();

	    	//permisos-------------------------------------------------------------------------
    		$arrPermisos = $this->permisosUsuario($this->id_modulo,$_COOKIE[$this->NameCookieApp."_IDtipo"]);
    		$edita = $arrPermisos[0]["editar"];
    		$elimina = $arrPermisos[0]["eliminar"];
    		$consulta = $arrPermisos[0]["consultar"];
    		//---------------------------------------------------------------------------------    

	    	//valida si hay usuarioes
	    	if( ($usuarios) && ($consulta==1) ){

	    		for($a=0;$a<sizeof($usuarios);$a++){

	             $id = $usuarios[$a]["pkID"];
	             $alias = $usuarios[$a]["alias"];                           
	             $nombres = $usuarios[$a]["nombre"];
	             $apellidos = $usuarios[$a]["apellido"];             
	             $nom_tipo = $usuarios[$a]["nom_tipo"];
	                                             

	             echo '
	                         <tr>
	                             <td>'.$id.'</td>
	                             <td>'.$alias.'</td>                                 
	                             <td>'.$nombres.'</td>
	                             <td>'.$apellidos.'</td>                             
	                             <td>'.$nom_tipo.'</td>
		                         <td>
		                             <button id="btn_editar" name="edita_usuario" type="button" class="btn btn-warning" data-toggle="modal" data-target="#frm_modal_usuario" data-id-usuario = "'.$id.'" '; if ($edita != 1){echo 'disabled="disabled"';} echo '><span class="glyphicon glyphicon-pencil"></span></button>		                             
		                             <button id="btn_eliminar" name="elimina_usuario" type="button" class="btn btn-danger" data-id-usuario = "'.$id.'" ';  if ($elimina != 1){echo 'disabled="disabled"';} echo '><span class="glyphicon glyphicon-remove"></span></button>
		                         </td>
		                     </tr>';
	            };


	    	}elseif(($usuarios) && ($consulta==0)){

             echo "<tr>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>		                              		                                          
		           </tr>
		           <h3>En este momento no tiene permiso de consulta para Usuarios.</h3>";
            }else{

	         echo "<tr>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>
		               <td></td>		               		                                            
		           </tr>
		           <h3>En este momento no hay Usuarios creados.</h3>";
	        };

    	} else {
    		# code...
    		
    		$usuario = $this->UsuariosDAO->getUsuarioId($_COOKIE[$this->NameCookieApp."_id"]);

    		//permisos-------------------------------------------------------------------------
    		$arrPermisos = $this->permisosUsuario($this->id_modulo,$_COOKIE[$this->NameCookieApp."_IDtipo"]);
    		$edita = $arrPermisos[0]["editar"];
    		$elimina = $arrPermisos[0]["eliminar"];
    		$consulta = $arrPermisos[0]["consultar"];
    		//---------------------------------------------------------------------------------

    		for($a=0;$a<sizeof($usuario);$a++){

             $id = $usuario[$a]["pkID"];
             $alias = $usuario[$a]["alias"];                           
             $nombres = $usuario[$a]["nombre"];
             $apellidos = $usuario[$a]["apellido"];             
             $nom_tipo = $usuario[$a]["nom_tipo"];
                                             

             echo '
                         <tr>
                             <td>'.$id.'</td>
                             <td>'.$alias.'</td>                                 
                             <td>'.$nombres.'</td>
                             <td>'.$apellidos.'</td>                             
                             <td>'.$nom_tipo.'</td>
	                         <td>
	                             <button id="btn_editar" name="edita_usuario" type="button" class="btn btn-warning" data-toggle="modal" data-target="#frm_modal_usuario" data-id-usuario = "'.$id.'" '; if ($edita != 1){echo 'disabled="disabled"';} echo '><span class="glyphicon glyphicon-pencil"></span></button>		                             
	                             <button id="btn_eliminar" name="elimina_usuario" type="button" class="btn btn-danger" data-id-usuario = "'.$id.'" '; if ($elimina != 1){echo 'disabled="disabled"';} echo '><span class="glyphicon glyphicon-remove"></span></button>
	                         </td>
	                     </tr>';
            };

    	}
    	    	
    }
	
	public function AutenticarUsuario(){

		/*
		----------------------------------------------------------------------------------------		
		*/		
		//--------------------------------------------------------------------------------------
	
		$Usr_Mail=$_POST['username'];
		$Usr_Clave=$_POST['password'];			
				
		$matriz=UsuariosDAO::getUsuariosLogin($Usr_Mail,$Usr_Clave);		
		
		/*
		Asignacion de valores desde la base de datos segun sean los campos-------------------------
		*/
		$id=$matriz[0]['pkID'];
		$alias=$matriz[0]['alias'];
		$nombre=$matriz[0]['nombre'];
		$apellidos=$matriz[0]['apellido'];
		//$num_cc=$matriz[0]['numero_cc'];
		$tipo=$matriz[0]['t_usuario'];
		$id_tipo=$matriz[0]['fkID_tipo'];
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		if (($id!="") and ($nombre!="")){

			//El nombre de la cookie varia según el nombre de la aplicacion para no tener problemas
			//a la hora de la creacion de las mismas.
			setcookie($this->NameCookieApp."_id", $id, time() + 3600*24, "/");			
			setcookie($this->NameCookieApp."_alias", $alias, time() + 3600*24, "/");
			setcookie($this->NameCookieApp."_nombre", $nombre." ".$apellidos, time() + 3600*24, "/");			
			setcookie($this->NameCookieApp."_tipo", $tipo, time() + 3600*24, "/");
			setcookie($this->NameCookieApp."_IDtipo", $id_tipo, time() + 3600*24, "/");							

			//echo "nombre desde la cookie:".$_COOKIE[$this->NameCookieApp."_nombre"];

			echo '<script language="JavaScript">
					alert("Bienvenido '.$nombre.' '.$apellidos.'");					
			      </script>';
					
			echo "<script language=javascript> location.href='../vistas/index.php'</script>";
				
		} else {
		
			echo '<script language="JavaScript">
					alert("Usuario o password incorrecto, en otro caso por favor verifique que su usuario este activo.");
					window.location = "javascript:history.back(-1)"
				</script>';
			}
		
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
						
	}
    
}

?>
