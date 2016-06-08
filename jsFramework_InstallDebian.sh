#!/bin/bash
#-----------------------------------------------------------------------------
#Con este bash se pretende instalar el framework en la version mas reciente 
#desde git.
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------

#Variable de la ruta del apache de debian
RUTA_APACHE="/var/www/html/prueba_install"

#Verificar que git este instalado
#http://blog.desdelinux.net/como-saber-si-un-paquete-se-encuentra-instalado-o-no-de-manera-facil-y-rapida/
#Guardar el resultado de un comando en una variable
#http://es.ccm.net/faq/2130-como-guardar-el-resultado-de-un-comando-en-una-variable
INSTALL_GIT=$(dpkg -l | grep git)

#saber si una variable es null
#http://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty

if [ "$INSTALL_GIT" = "" ] || [ -z "$INSTALL_GIT" ] ; then
	#statements
	echo "Git---ERROR [Instale git e intente correr la instalación de nuevo.]"
else
	echo "Git---OK [Continuando la instalación.]"

	#ir a la ruta de apache y clonar el proyecto desde git
	cd $RUTA_APACHE
	#lista las carpetas del directorio
	ls -l
	#verificar que no exista una carpeta llamada jsFramework
	if [ -d "$RUTA_APACHE/jsFramework" ];
	then
		echo "DIR /jsFramework---ERROR [Ya existe un directorio con este nombre.]"
	else
		echo "DIR /jsFramework---OK [Continuando la instalación.]"
		echo "Clonando git -> [DIR /jsFramework]"
		#------------------------------------------------------------------------------------------------
		#clonar en esta ruta el proyecto desde git
		git clone https://github.com/jsmorales/jsFramework.git && chmod -R 777 "$RUTA_APACHE/jsFramework"
		#------------------------------------------------------------------------------------------------
		#verificar de nuevo que el directorio jsFramework existe para
		#saber si se clonó correctamente
		if [ -d "$RUTA_APACHE/jsFramework" ]; then
			#statements
			echo "git clone /jsFramework---OK [Se clonó el framework correctamente.]"

			#lista las carpetas del directorio
			ls -l | grep jsFramework

			#------------------------------------------------------------------------
			#reestablecer la BD del framework
			#------------------------------------------------------------------------

		else
			echo "git clone /jsFramework---ERROR [Hubo un error al clonar el framework.]"
		fi
		#-------------------------------------------------------------
	fi
fi

#echo $INSTALL_GIT
#-----------------------------------------------------------------------------