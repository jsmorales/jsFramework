#!/bin/bash
#Script de manejo del framework por consola.

#Este script va a manejar parametros de la siguiente manera
#Primer parametro: Tipo -- DAO, controller, cont_js; esto va a definir a que carpeta va y como va
#a ser en parte el nombre.
#Segundo parametro: Nombre -- segun como se llame el módulo

#echo "Todos : $*"
#echo "Mostrando primer parametro : $1"
#set ov toaster punto com
#echo "todos después de set : $*"

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
	echo "		" >> ${NOMBRE_DAO}
	echo "	class $2DAO extends GenericoDAO {" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		public $""generico;" >> ${NOMBRE_DAO}
	echo "		public $""q_general;" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		function __construct(){" >> ${NOMBRE_DAO}
	echo "			$""this->generico = new GenericoDAO();" >> ${NOMBRE_DAO}
	echo "		}" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		//Funciones------------------------------------------" >> ${NOMBRE_DAO}
	echo "		//Espacio para las funciones en general de esta clase." >> ${NOMBRE_DAO}
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
	echo "	class $2Controller {" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		public $""$2DAO;" >> ${NOMBRE_CONTROLLER} #variable donde se instancia el DAO para el controlador.	
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		function __construct(){" >> ${NOMBRE_CONTROLLER} #constructor que instacia el DAO
	echo "			$""this->$2DAO = new $2DAO();" >> ${NOMBRE_CONTROLLER}
	echo "		}" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		//Funciones-------------------------------------------" >> ${NOMBRE_CONTROLLER}
	echo "		//Espacio para las funciones en general de esta clase." >> ${NOMBRE_CONTROLLER}
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
	#-----------------------------------------------------------------------

else
	echo "No es posible crear nada fata el tipo o el nombre, gracias."
fi