<?php
	/**/
	include_once 'genericoDAO.php';
		
	class PermisosDAO extends GenericoDAO {
			
		public $q_general;				

		public function getPermisos(){

			$this->q_general = "select permisos.*, tipo_usuario.nombre as nom_tipo, modulos.Nombre as nom_modulo 

								FROM `permisos`

								INNER JOIN tipo_usuario ON tipo_usuario.pkID = permisos.fkID_tipo_usuario

								INNER JOIN modulos ON modulos.pkID = permisos.fkID_modulo";		
			
			return $this->EjecutarConsulta($this->q_general);
		}

		public function getPermisosModulo_Tipo($fkID_modulo,$fkID_tipo_usuario){

			$this->q_general = "select permisos.*, tipo_usuario.nombre as nom_tipo, modulos.Nombre as nom_modulo 

								FROM `permisos`

								INNER JOIN tipo_usuario ON tipo_usuario.pkID = permisos.fkID_tipo_usuario

								INNER JOIN modulos ON modulos.pkID = permisos.fkID_modulo

								WHERE permisos.fkID_modulo = ".$fkID_modulo." AND permisos.fkID_tipo_usuario = ".$fkID_tipo_usuario;		
			
			return $this->EjecutarConsulta($this->q_general);
		}
	}
?>
