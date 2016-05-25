<?php 
	
	//-----------------
	//error_reporting(0);
	//-----------------
include("../DAO/PermisosDAO.php");

	class valida extends PermisosDAO {

		//---------------------------------------------------------
	    //variables de sesion
	    public $id;
	    public $nombre;
	    public $tipo;
	    public $id_tipo;
	    //-----------------------------------------
	  
	    //-----------------------------------------
	    //funciones
	    public function asigna_vals(){

	    	//print_r($_COOKIE);

	    	if(sizeof($_COOKIE) <= 2){ 

	    		$this->id = "";
		        $this->nombre = "";
		        $this->tipo = "";
		        $this->id_tipo = "";

	    	}else{
		        $this->id = $_COOKIE["log_lunelAdmin_id"];
		        $this->nombre = $_COOKIE["log_lunelAdmin_nombre"];
		        $this->tipo = $_COOKIE["log_lunelAdmin_tipo"];
		        $this->id_tipo = $_COOKIE["log_lunelAdmin_IDtipo"];
	        }

	    }

	    public function valida_vals(){

	    	$this->asigna_vals();

	        if($this->id == "" || $this->nombre == "" || $this->tipo == "" || $this->id_tipo == ""){
	            //echo '<script language="JavaScript"> alert("Usuario no identificado, por favor identifíquese."); window.location = "index.php"; </script>';
	            return false;
	        }else{
	            
	            //$this->mostrar_pagina($_GET["pagina"]);
	            return true;
	        }
	    }

	    //-------------------------------------------------------------------
	    //funcion para validar el perfil de usuario
	    public function valida_perfil(){

	    	return $this->tipo;
	    }

	    public function getIDtipo(){

	    	return $this->id_tipo;
	    }

	    public function valida_entrada_perfil($id_modulo,$id_perfil_actual){

	    	//Devuelve TRUE si needle se encuentra en el array, FALSE de lo contrario.

	    	$permisos = $this->getPermisosModulo_Tipo($id_modulo,$id_perfil_actual);

	    	//print_r($permisos);

	    	/*
	    	if(in_array($perfil_actual, $perfiles_in)){
	    		return "true";
	    	}else{
	    		return "false";
	    	}*/
	    	//echo sizeof($permisos[0]);
	    	/**/
	    	if (sizeof($permisos[0]) > 0 ) {
	    		# code...
	    		//echo "Se permite el ingreso.";
	    		//crea cookies con los permisos para este modulo?
	    		/*
	    		//-----------------------------------------------
	    		$crear=$permisos[0]['crear'];
	    		$editar=$permisos[0]['editar'];
	    		$eliminar=$permisos[0]['eliminar'];
	    		$consultar=$permisos[0]['consultar'];
	    		//cookies
	    		setcookie("log_lunelAdmin_crear", $crear, time() + 3600*24, "/");
	    		setcookie("log_lunelAdmin_editar", $editar, time() + 3600*24, "/");
	    		setcookie("log_lunelAdmin_eliminar", $eliminar, time() + 3600*24, "/");
	    		setcookie("log_lunelAdmin_consultar", $consultar, time() + 3600*24, "/");
	    		//-----------------------------------------------*/
	    		return true;
	    	}else{	    		
	    		//echo "No se permite el ingreso.";
	    		/*
	    		unset($_COOKIE["log_lunelAdmin_crear"]);
	    		unset($_COOKIE["log_lunelAdmin_editar"]);
	    		unset($_COOKIE["log_lunelAdmin_eliminar"]);
	    		unset($_COOKIE["log_lunelAdmin_consultar"]);

	    		setcookie("log_lunelAdmin_crear", null, -1, '/');
	    		setcookie("log_lunelAdmin_editar", null, -1, '/');
	    		setcookie("log_lunelAdmin_eliminar", null, -1, '/');
	    		setcookie("log_lunelAdmin_consultar", null, -1, '/');
				*/
	    		return false;
	    	}	    	
	    		    	 
	    }
	    //-------------------------------------------------------------------

	    public function mensaje_error(){

	    	if($this->valida_vals() == true){
	    		echo '<script language="JavaScript"> alert("No tiene permisos para acceder a esta página."); history.back(1); //window.location = "login.php"; </script>';
	    	}else{
	    		echo '<script language="JavaScript"> localStorage.removeItem("sesion_time"); alert("Usuario no identificado o su tiempo de sesion termino, por favor identifíquese."); window.location = "login.php"; </script>';
	    	}    	

	    }

	    //-----------------------------------------
	}

 ?>