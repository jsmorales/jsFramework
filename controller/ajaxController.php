<?php 
	
	header('content-type: aplication/json; charset=utf-8');//header para json	
	
	include('../DAO/genericoDAO.php');

	include('creaSql.php');

 	$accion= isset($_GET['tipo'])?$_GET['tipo']:"x";

 	$r = array();

 	switch ($accion) { 		
 		
		//----------------------------------------------------------------------------------------------------
	 	case 'inserta':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();

	 		$q_inserta = $crea_sql->crea_insert($_GET);
	 		$r["query"] = $q_inserta;	 		

	 		$resultado = $generico->EjecutaInsertar($q_inserta);
	 		/**/
	 		if($resultado){
	 			
	 			$r[] = $resultado; 			

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No se inserto.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------

	 	


		//----------------------------------------------------------------------------------------------------
	 	case 'consultar':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();

	 		$q_carga = $crea_sql->crea_select($_GET);	 		

	 		$resultado = $generico->EjecutarConsulta($q_carga);
	 		/**/
	 		if($resultado){

	 			$r["estado"] = "ok";
	 			$r["mensaje"] = $resultado;

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No hay registros.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------

		//----------------------------------------------------------------------------------------------------
	 	case 'actualizar':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();

	 		$q_actualiza = $crea_sql->crea_update($_GET);	 		

	 		$resultado = $generico->EjecutaActualizar($q_actualiza);
	 		/**/
	 		if($resultado){
	 			
	 			$r["estado"] = "ok";
	 			$r["mensaje"] = $resultado;

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No se actualizó.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------

		//----------------------------------------------------------------------------------------------------
	 	case 'eliminar':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();

	 		$q_elimina = $crea_sql->crea_delete($_GET);

	 		$r["query"] = $q_elimina;	 		

	 		$resultado = $generico->EjecutaEliminar($q_elimina);
	 		/**/
	 		if($resultado){
	 			
	 			$r["estado"] = "ok";
	 			$r["mensaje"] = $resultado;

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No se eliminó.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------

		//-------------------------funciones de usuario-------------------------------------------------------
	 	case 'inserta_usuario':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();


	 		$_GET["pass"] = sha1($_GET["pass"]);

	 		$q_inserta = $crea_sql->crea_insert($_GET);

	 		$r["query"] = $q_inserta;	 		

	 		/**/
	 		$resultado = $generico->EjecutaInsertar($q_inserta);
	 		
	 		if($resultado){
	 			
	 			$r[] = $resultado; 			

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No se inserto.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------

	 	//----------------------------------------------------------------------------------------------------
	 	case 'actualiza_usuario':

	 		$generico = new GenericoDAO();
	 		$crea_sql = new crea_sql();


	 		$_GET["pass"] = sha1($_GET["pass"]);

	 		$q_actualiza = $crea_sql->crea_update($_GET);

	 		$r["query"] = $q_actualiza;	 		

	 		/**/
	 		$resultado = $generico->EjecutaActualizar($q_actualiza);
	 		
	 		if($resultado){
	 			
	 			$r["estado"] = "ok";
	 			$r["mensaje"] = "Contraseña Actualizada!"; 			

	 		}else{

	 			$r["estado"] = "Error";
	 			$r["mensaje"] = "No se actualizo.";
	 		}

	 	break;
		//----------------------------------------------------------------------------------------------------
 	}
 	//--------------------------------------------------------------------------------------------------------

	echo json_encode($r); //imprime el json

 ?>