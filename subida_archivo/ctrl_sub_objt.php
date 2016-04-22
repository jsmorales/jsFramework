<?php

	header('Content-type: application/json');
	

	include("php_subida_objt.php");
    include("../conexion/datos.php");	

    $va_para = $ruta_server;

	//print_r($_FILES['archivo']);
    /**/
	if( isset($_FILES['archivo']) ){

		$subida = new sube_imagen($_FILES["archivo"],$va_para);

		//$subida->asigna_val();

		//print_r($subida->subir());

		echo json_encode($respuesta = $subida->subir());
		
	}else{

		$mensaje = array('mensaje' => "No existe ningún archivo para subir.");

		echo json_encode($mensaje);
	};

 ?>