<?php 

include_once '../DAO/PermisosDAO.php';

class permisosController extends PermisosDAO{

	public $arrayPermisos;

	//--------------------------------------------------------

	public function permisos($fkID_modulo,$fkID_tipo_usuario){

      $this->arrayPermisos = $this->getPermisosModulo_Tipo($fkID_modulo,$fkID_tipo_usuario);

      return $this->arrayPermisos;

    }
}

 ?>