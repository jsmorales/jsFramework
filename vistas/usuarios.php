<?php 

	include("../controller/muestra_pagina.php");

	$muestra_usuarios = new mostrar();

	//---------------------------------------------------------
	$pagina = "cont_usuarios.php";
	$scripts = array('cont_usuarios.js');
	//$perfiles_in = array('Administrador','jefe_personal');
	$perfiles_in = array('Administrador');
	//---------------------------------------------------------

	$muestra_usuarios->mostrar_pagina_scripts($pagina,$scripts,$perfiles_in);

 ?>