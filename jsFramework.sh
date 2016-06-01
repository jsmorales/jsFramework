#!/bin/bash
#Script de manejo del framework por consola.

#Este script va a manejar parametros de la siguiente manera
#Primer parametro: Tipo -- DAO, controller, cont_js; esto va a definir a que carpeta va y como va
#a ser en parte el nombre.
#Segundo parametro: Nombre -- segun como se llame el módulo

#---------------------------------------------------------------------------
#Funciones 
#---------------------------------------------------------------------------

#valida que lleve el tipo y el nombre
if [ $1 == "DAO" ] && [ $2 ] ; then
	#statements
	echo "Creando DAO..."
	#crea en una variable el nombre del archivo
	NOMBRE_DAO="$2DAO.php"
	#crea el archivo con el comando touch y asigna permisos 777
	touch DAO/${NOMBRE_DAO} && chmod -R 777 DAO/${NOMBRE_DAO}
	#ingresa en la carpeta correspondiente
	cd DAO/

	#inserta contenido------------------------------------------------------
	echo "<?php" >> ${NOMBRE_DAO}
	echo "	/**/" >> ${NOMBRE_DAO}
	echo "	include_once 'genericoDAO.php';" >> ${NOMBRE_DAO}
	echo "	include_once 'Permisos_DAO.php';" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "	class $2DAO extends GenericoDAO {" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		public $""permisos;" >> ${NOMBRE_DAO}
	echo "		public $""q_general;" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		function __construct(){" >> ${NOMBRE_DAO}
	echo "			parent::__construct();" >> ${NOMBRE_DAO}
	echo "		}" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		//Funciones------------------------------------------" >> ${NOMBRE_DAO}
	echo "		//Espacio para las funciones en general de esta clase." >> ${NOMBRE_DAO}
	echo "   	public function permisos($""fkID_modulo,$""fkID_tipo_usuario){" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "			$""this->permisos = new PermisosDAO();" >> ${NOMBRE_DAO}
	echo "			$""arrayPermisos = $""this->permisos->getPermisosModulo_Tipo($""fkID_modulo,$""fkID_tipo_usuario);" >> ${NOMBRE_DAO}
	echo "			return $""arrayPermisos;" >> ${NOMBRE_DAO}
	echo "		}" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "	}" >> ${NOMBRE_DAO}
	echo "?>" >> ${NOMBRE_DAO}
	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_DAO} ];
	then
	echo "El archivo DAO fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

elif [ $1 == "controller" ] && [ $2 ]; then
	
	echo "Creando controller..."

	#crea en una variable el nombre del archivo
	NOMBRE_CONTROLLER="$2Controller.php"
	#crea el archivo con el comando touch y asigna permisos 777
	touch controller/${NOMBRE_CONTROLLER} && chmod -R 777 controller/${NOMBRE_CONTROLLER}
	#ingresa en la carpeta correspondiente
	cd controller/

	#inserta contenido------------------------------------------------------
	echo "<?php" >> ${NOMBRE_CONTROLLER}
	echo "	/**/" >> ${NOMBRE_CONTROLLER}
	echo "	include_once '../DAO/$2DAO.php';" >> ${NOMBRE_CONTROLLER} #nombre del DAO que debe existir previamente.
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "	class $2Controller extends $2DAO{" >> ${NOMBRE_CONTROLLER} #extiende del DAO.
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		public $""NameCookieApp;" >> ${NOMBRE_CONTROLLER}
	echo "		public $""id_modulo;" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		public function __construct() {" >> ${NOMBRE_CONTROLLER}
	echo "			" >> ${NOMBRE_CONTROLLER}
	echo "			include('../conexion/datos.php');" >> ${NOMBRE_CONTROLLER}
	echo "			" >> ${NOMBRE_CONTROLLER}
	echo "			//$""this->id_modulo = --; id de la tabla modulos" >> ${NOMBRE_CONTROLLER}
	echo "			$""this->NameCookieApp = $""NomCookiesApp;" >> ${NOMBRE_CONTROLLER}
	echo "			" >> ${NOMBRE_CONTROLLER}
	echo "		}" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		//Funciones-------------------------------------------" >> ${NOMBRE_CONTROLLER}
	echo "		//Espacio para las funciones de esta clase." >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "	}" >> ${NOMBRE_CONTROLLER}
	echo "?>" >> ${NOMBRE_CONTROLLER}
	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_CONTROLLER} ];
	then
	echo "El archivo controller fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

elif [ $1 == "cont_js" ] && [ $2 ]; then

	echo "Creando cont_js..."

	#crea en una variable el nombre del archivo
	NOMBRE_CONT_JS="cont_$2.js"
	#crea el archivo con el comando touch y asigna permisos 777
	touch js/scripts_cont/${NOMBRE_CONT_JS} && chmod -R 777 js/scripts_cont/${NOMBRE_CONT_JS}
	#ingresa en la carpeta correspondiente
	cd js/scripts_cont/

	#inserta contenido------------------------------------------------------
	echo "$""(function(){" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	 //.jquery_controller('nombre_del_modulo','tipo','nombre de la tabla en BD','upload true/false','tipo de carga 1,2','reload true/false')" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	 $("#btn_nuevo_").jquery_controller('_','nuevo','',false,'',false);" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	 $("#btn_action_").jquery_controller('_','inserta/edita','_',false,'',true);" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	 $("[name*='edita__']").jquery_controller('_','carga_editar','_',false,1,false);" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	 $("[name*='elimina__']").jquery_controller('_','eliminar','_',false,'',true);" >> ${NOMBRE_CONT_JS}
	echo "	 " >> ${NOMBRE_CONT_JS}
	echo "	//---------------------------------------------------------" >> ${NOMBRE_CONT_JS}	
	echo "});" >> ${NOMBRE_CONT_JS}

	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_CONT_JS} ];
	then
	echo "El archivo cont_js fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

else
	echo "No es posible crear el archivo, falta el TIPO o el NOMBRE."
fi