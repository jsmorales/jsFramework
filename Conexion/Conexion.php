<?php

class Conexion{
    
    private $dbconection;
    private $userconection;
    private $passconection;
    private $stringconection;
    private $hostconection;
      
    
    public function __construct() {

        include "datos.php";
    
        $this->dbconection=$dbconection;
        $this->userconection=$userconection;
        $this->passconection=$passconection;
        $this->hostconection=$hostconection;
        
    }

     /**
     * Conexión a la base de datos
     * @return Retorna la cadena de conexión, o puede retornar un mensaje de error en caso de que lo haya
     */

    public function connect(){
              
		$this->stringconection= new mysqli($this->hostconection, $this->userconection,  $this->passconection,$this->dbconection);
		
        $conn = $this->stringconection;

        /*Exepcion*/
        if($conn->connect_errno > 0){
            die('Error en la conexion con la base de datos [' . $conn->connect_error . ']');
        }
        /*-------*/
        $conn->set_charset("utf8");
		return $conn;            
    }   
}
//$con = new Conexion();
//$con->connect();
?>	