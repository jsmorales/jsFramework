<?php

include_once 'genericoDAO.php';


class UsuariosDAO extends GenericoDAO{


    public function getUsuarios(){        
       
      $query = "select usuarios.*, tipo_usuario.nombre as nom_tipo

                FROM `usuarios` 

                INNER JOIN tipo_usuario ON tipo_usuario.pkID=usuarios.fkID_tipo";

      return $this->EjecutarConsulta($query);
    }

    public function getUsuarioId($pkID){        
       
      $query = "select usuarios.*, tipo_usuario.nombre as nom_tipo

                FROM `usuarios` 

                INNER JOIN tipo_usuario ON tipo_usuario.pkID=usuarios.fkID_tipo

                WHERE usuarios.pkID = ".$pkID;

      return $this->EjecutarConsulta($query);
    }

    public function getUsuariosReporte(){        
       
      $query = "select usuarios.pkID, usuarios.alias, usuarios.nombres, usuarios.apellidos, usuarios.numero_cc, tipo_usuario.nombre as nom_tipo

                FROM `usuarios` 

                INNER JOIN tipo_usuario ON tipo_usuario.pkID=usuarios.fkID_tipo 

                ORDER BY `usuarios`.`pkID` ASC";

      return $this->EjecutarConsulta($query);
    }

    public function getTipoUsuarios(){        
       
      $query = "select * FROM `tipo_usuario`";

      return $this->EjecutarConsulta($query);
    }

    //SELECT * FROM `tipo_usuario` WHERE nombre != 'Administrador'

    public function getTipoUsuariosNoAdmin(){        
       
      $query = "select * FROM `tipo_usuario` WHERE nombre != 'Administrador'";

      return $this->EjecutarConsulta($query);
    }
	
	 public function getUsuariosLogin($p_usuario,$p_password){           	

      $query = "select usuarios.*, tipo_usuario.nombre as t_usuario

                FROM `usuarios`

                inner join tipo_usuario on tipo_usuario.pkID = usuarios.fkID_tipo

                where usuarios.alias='".$p_usuario."' and usuarios.pass=SHA1('".$p_password."')";   					
		
		return $this->EjecutarConsulta($query);
		
    }
	
}
/*
$Usr_Mail="jsmorales";
$Usr_Clave="12345";    
$matriz=UsuariosDAO::getUsuariosLogin($Usr_Mail,$Usr_Clave);
print_r($matriz);
*/
?>
