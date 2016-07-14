<?php

include_once '../conexion/conexion.php';

class GenericoDAO extends Conexion {
   
   public $r;
        
   public function __construct() {
   		
        $this->r = array();
    }
     
    //------------------------------------------------------------------------
	    public function EjecutarConsulta($query){     	

			$db = $this->connect();

			if(!$result = $db->query($query)){
				die('Hubo un error al ejecutar el query [' . $db->error . ']');
			}else{

				if ($result->num_rows > 0){

					while ($fila = $result->fetch_assoc()){
						$retorno[] = $fila;
					}

					return $retorno;

				} else {

					return false;
				}

				$result->free();
			}
			
		}
	//------------------------------------------------------------------------
		public function EjecutaInsertar($query){
			 
			$db=$this->connect();

		       if(!$result = $db->query($query)){
					die('There was an error running the query [' . $db->error . ']');
				}

				else{
					$this->r["last_id"] = $db->insert_id;
					$this->r["estado"] = "ok";
					$this->r["mensaje"] = "Guardado correctamente.";

					return $this->r;
				}
		}
	//------------------------------------------------------------------------	
		public function EjecutaActualizar($query){
			 
			$db=$this->connect();

		       if(!$result = $db->query($query)){
					die('There was an error running the query [' . $db->error . ']');
				}

				else{
					$this->r["estado"] = "ok";
					$this->r["mensaje"] = "Actualizado correctamente.";

					return $this->r;
				}
		}
	//------------------------------------------------------------------------
	//------------------------------------------------------------------------
		public function EjecutaEliminar($query){
			 
			$db=$this->connect();

		       if(!$result = $db->query($query)){
					die('There was an error running the query [' . $db->error . ']');
				}

				else{
					$this->r["estado"] = "ok";
					$this->r["mensaje"] = "Eliminado correctamente.";

					return $this->r;
				}
		}
	//------------------------------------------------------------------------
   
}

?>
