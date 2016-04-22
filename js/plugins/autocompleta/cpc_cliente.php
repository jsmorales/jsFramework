<?php 

	
	include("../DAO/GenericoDAO.php");

	class autocompleta extends GenericoDAO {

		public $q_general;

		/*-----------------------------*/
		public function __construct(){
			//contruye la clase GenericoDAO
			parent::__construct();
		}
		/*-----------------------------------------*/

		public function getCliente($valor){

			$this->q_general = "select * FROM cliente where num_cc like ".$valor;			
			
			return GenericoDAO::EjecutarConsulta($this->q_general);
		}
	}

	$data = new autocompleta();
	$arr1 = $data->getCliente($_GET["term"]);

	echo json_encode($arr1);

 ?>