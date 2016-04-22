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
        
    //CONSTRUCTOR DE LA CLASE

    public function __construct() {
        $this->UsuariosDAO = new UsuariosDAO();
    }

    //Funciones-----------------------------------------------------------------------

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

	    	//valida si hay usuarioes
	    	if($usuarios){

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
		                             <button id="btn_editar" name="edita_usuario" type="button" class="btn btn-warning" data-toggle="modal" data-target="#frm_modal_usuario" data-id-usuario = "'.$id.'" ><span class="glyphicon glyphicon-pencil"></span></button>		                             
		                             <button id="btn_eliminar" name="elimina_usuario" type="button" class="btn btn-danger" data-id-usuario = "'.$id.'" ><span class="glyphicon glyphicon-remove"></span></button>
		                         </td>
		                     </tr>';
	            };


	    	}else{

	         echo "<tr>
		               <td></td>
		               <td></td>
		               <td></td>		               		                                            
		           </tr>
		           <h3>En este momento no hay usuarios creados.</h3>";
	        };

    	} else {
    		# code...
    		$usuario = $this->UsuariosDAO->getUsuarioId($_COOKIE["log_lunelAdmin_id"]);

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
	                             <button id="btn_editar" name="edita_usuario" type="button" class="btn btn-warning" data-toggle="modal" data-target="#frm_modal_usuario" data-id-usuario = "'.$id.'" ><span class="glyphicon glyphicon-pencil"></span></button>		                             
	                             <button id="btn_eliminar" name="elimina_usuario" type="button" class="btn btn-danger" data-id-usuario = "'.$id.'" ><span class="glyphicon glyphicon-remove"></span></button>
	                         </td>
	                     </tr>';
            };

    	}
    	    	
    }
	
	public static function AutenticarUsuario(){

		/*
		----------------------------------------------------------------------------------------
		Nombre de las cookies que viene del archivo de datos, según sea el nombre de la app.
		*/
		include_once '../conexion/datos.php';
		//--------------------------------------------------------------------------------------
	
		$Usr_Mail=$_POST['username'];
		$Usr_Clave=$_POST['password'];
		
				
		$matriz=UsuariosDAO::getUsuariosLogin($Usr_Mail,$Usr_Clave);
		
		//print_r($matriz);
		
		/*
		Asignacion de valores desde la base de datos segun sean los campos-------------------------
		*/
		$id=$matriz[0]['pkID'];
		$alias=$matriz[0]['alias'];
		$nombre=$matriz[0]['nombres'];
		$apellidos=$matriz[0]['apellidos'];
		//$num_cc=$matriz[0]['numero_cc'];
		$tipo=$matriz[0]['t_usuario'];
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		if (($id!="") and ($nombre!="")){

			//El nombre de la cookie varia según el nombre de la aplicacion para no tener problemas
			//a la hora de la creacion de las mismas.
			setcookie($NomCookiesApp."_id", $id, time() + 3600, "/");			
			setcookie($NomCookiesApp."_alias", $alias, time() + 3600, "/");
			setcookie($NomCookiesApp."_nombre", $nombre." ".$apellidos, time() + 3600, "/");			
			setcookie($NomCookiesApp."_tipo", $tipo, time() + 3600, "/");				

			//echo "nombre desde la cookie:".$_COOKIE["log_usuario_nombre"];

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
