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

#valida que lleve el tipo y el 
if [ $1 == "DAO" ] && [ $2 ] ; then
	#statements
	echo "Vamos a crear un DAO..."
	#crea en una variable el nombre del archivo
	NOMBRE_DAO="$2DAO.php"
	#crea el archivo con el comando touch
	touch DAO/${NOMBRE_DAO}
	#ingresa en la carpeta correspondiente
	cd DAO/

	#inserta contenido------------------------------------------------------
	echo "<?php" >> ${NOMBRE_DAO}
	echo "	include_once 'GenericoDAO.php';" >> ${NOMBRE_DAO}
	echo "	class $2DAO extends GenericoDAO{" >> ${NOMBRE_DAO}
	echo "		public $""generico;" >> ${NOMBRE_DAO}
	echo "		public $""q_general;" >> ${NOMBRE_DAO}
	echo "		function __construct(){" >> ${NOMBRE_DAO}
	echo "			$""this->generico = new GenericoDAO();" >> ${NOMBRE_DAO}
	echo "		}" >> ${NOMBRE_DAO}
	echo "		//funciones" >> ${NOMBRE_DAO}
	echo "	}" >> ${NOMBRE_DAO}
	echo "?>" >> ${NOMBRE_DAO}
	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	#notifica que el archivo ha sido creado
	echo "El archivo fue creado con exito."
else
	echo "No es posible crear nada fata el tipo o el nombre, gracias."
fi