<?php 

	include_once 'GenericoDAO.php';

	/**
	* Esta clase esta pensada en pagina principales en la que sea necesario
	*desde la BD llamar los datos generales como el titulo, slogan, direccion
	*hasta los elementos del menu u otras necesides.
	*/
	class indexDAO extends GenericoDAO
	{
		public $generico;
		public $q_general;

		function __construct()
		{
			# code...
			//contruye la clase GenericoDAO
			//parent::__construct();
			$this->generico = new GenericoDAO();
		}

		/*-----------------------------*/
		//funciones

		public function getDatos(){
			/*
			$this->q_general = "select * from datos_generales";				
			
			return $this->generico->EjecutarConsulta($this->q_general);*/
		}
		/*-----------------------------*/

	}	

 ?>