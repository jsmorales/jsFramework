<?php 

	include("../controller/muestra_pagina.php");

	$muestra_usuarios = new mostrar();

	//---------------------------------------------------------
	$pagina = "cont_usuarios.php";
	$scripts = array('cont_usuarios2.js');
	//$perfiles_in = array('Administrador','jefe_personal');
	//$perfiles_in = array('Administrador');
	$id_modulo = 13;
	//---------------------------------------------------------

	$muestra_usuarios->mostrar_pagina_scripts($pagina,$scripts,$id_modulo);

 ?>