#!/bin/bash
#-----------------------------------------------------------------------------
#Con este bash se pretende instalar el framework en la version mas reciente
#desde git.
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------

#Variable de la ruta del apache de debian
RUTA_APACHE="/var/www/html"

#Verificar que git este instalado
#http://blog.desdelinux.net/como-saber-si-un-paquete-se-encuentra-instalado-o-no-de-manera-facil-y-rapida/
#Guardar el resultado de un comando en una variable
#http://es.ccm.net/faq/2130-como-guardar-el-resultado-de-un-comando-en-una-variable
INSTALL_GIT=$(dpkg -l | grep git)

#saber si una variable es null
#http://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty

#-----------------------------------------------------------------------------------------------------------
#Funciones
function verificarGit {

	if [ "$INSTALL_GIT" = "" ] || [ -z "$INSTALL_GIT" ]; then
		echo -e "\e[31mGit---ERROR [Instale git e intente correr la instalación de nuevo.]\e[0m"
	else
		#statements
		echo -e "\e[32mGit---OK [Continuando la instalación.]\e[0m"
		verificaRutaApache
	fi
}

function verificaRutaApache {

	if [ -d "$RUTA_APACHE" ]; then

		#ir a la ruta de apache y clonar el proyecto desde git
		cd $RUTA_APACHE
		#lista las carpetas del directorio
		echo -e "\e[32mDIR_APACHE---OK [Listando carpetas.]\e[0m"
		ls -l

		readNomApp

	else
		echo -e "\e[31mDIR_APACHE---ERROR [El path definido para APACHE como $RUTA_APACHE no existe.]\e[0m"

		readPathApache
	fi
}

function readPathApache {

	echo -e "\e[34mPara definir un path de APACHE, ingreselo y presione [ENTER]:\e[0m"
	echo -e "\e[37mPara salir presione [CTR+Z].\e[0m"
	read RUTA_APACHE
	#echo $RUTA_APACHE
	verificaRutaApache
}

function readNomApp {

	echo -e "\e[34mPor favor ingrese el nombre del proyecto y presione [ENTER]:\e[0m"
	echo -e "\e[37mPara salir presione [CTR+Z].\e[0m"
	read NOM_APP
	#echo $RUTA_APACHE

	verificaPathApp
}

function verificaPathApp {

	echo -e "\e[37mVerificando DIR $RUTA_APACHE/$NOM_APP\e[0m"

	if [ -d "$RUTA_APACHE/$NOM_APP" ];then
		echo -e "\e[31mDIR /$NOM_APP---ERROR [Ya existe un directorio llamado $NOM_APP.]\e[0m"
		readNomApp
	else
		cloneGit
	fi
}

function cloneGit {

	echo -e "\e[32mDIR /$NOM_APP---OK [Continuando la instalación.]\e[0m"
	echo -e "\e[37mClonando git, con permisos 777 -> [DIR /$NOM_APP]\e[0m"
	#------------------------------------------------------------------------------------------------
	#clonar en esta ruta el proyecto desde git
	#para clonar en diferente directorio
	#https://git-scm.com/book/es/v1/Fundamentos-de-Git-Obteniendo-un-repositorio-Git
	git clone https://github.com/jsmorales/jsFramework.git $NOM_APP && chmod -R 777 "$RUTA_APACHE/$NOM_APP"

	verificaPathAppClone

}

function verificaPathAppClone {

	if [ -d "$RUTA_APACHE/$NOM_APP" ];then
		#statements
		echo -e "\e[32mgit clone /$NOM_APP---OK [Se clonó el framework correctamente.]\e[0m"

		#lista las carpetas del directorio
		ls -l | grep $NOM_APP

		#entra al directorio de la app
		cd "$RUTA_APACHE/$NOM_APP"

		#quitar el directorio de git para poder iniciar uno nuevo
		echo -e "\e[37mRemoviendo carpeta .git -> [DIR /.git]\e[0m"
		rm -r .git

		#installBD
		#crear bd
		#
		creaBD

		#crear archivo de configuracion datos.php para el framework
	else
		echo -e "\e[31mgit clone /$NOM_APP---ERROR [Hubo un error al clonar el framework.]\e[0m"
		reCloneGit
	fi
}

function creaBD {

	echo -e "\e[37mVerificando archivo sql para instalar la BD...\e[0m"

	if [ -f "jsFrameWorkBD.sql" ]; then
		#statements
		echo -e "\e[32mFILE_SQL---OK [Se encontró el archivo en $(pwd)]\e[0m"
		ls -l | grep jsFrameWorkBD.sql

		pidePassBD

	else
		echo -e "\e[31mFILE_SQL---ERROR [No existe archivo framework.]\e[0m"
	fi
}

function pidePassBD {

	echo -e "\e[34mPor favor ingrese el usuario de mysql seguido de [ENTER]:\e[0m"
	read USER_MYSQL

	echo -e "\e[34mPor favor ingrese la contraseña de mysql seguido de [ENTER]:\e[0m"
	read PASS_MYSQL

	echo -e "\e[37mCreando la BD...\e[0m"
	#CREA_BD=$(mysqladmin -u root -p create $NOM_APP | grep error)
	#echo "el resultado de crear la bd es:"$CREA_BD
	mysqladmin -u $USER_MYSQL -p$PASS_MYSQL create $NOM_APP

	echo -e "\e[37mReestableciendo la BD...\e[0m"
	mysql -u $USER_MYSQL -p$PASS_MYSQL $NOM_APP < "jsFrameWorkBD.sql"

	echo -e "\e[32mINSTALL---END [Se ha terminado el proceso de instalación de la aplicación.]\e[0m"
}

function verInternet {
	echo -e "\e[37mVerificando conexion a internet...\e[0m"
	INTERNET=$(ping -c 1 www.google.com | grep bits)
	#echo "la variable es: "$INTERNET
	if [ -z "$INTERNET"]; then
		#statements
		echo -e "\e[31mCONEXION---ERROR [No hay conexión a internet.]\e[0m"
		#echo $INTERNET
		reCloneGit
	else
		echo -e "\e[32mCONEXION---OK [Hay conexión a internet.]\e[0m"
		#echo $INTERNET
		reCloneGit
	fi
}

function reCloneGit {

	#echo -e "\e[34mDesea intentar clonar el repositorio nuevamente? [S/n]:\e[0m"
	echo -e "\e[34mQue desea intentar?:\e[0m"
	echo -e "\e[34m1:Intentar clonar el repositorio nuevamente.\e[0m"
	echo -e "\e[34m2:Verificar mi conexión a internet.\e[0m"
	echo -e "\e[34m3:Salir.\e[0m"
	read reClone

	if [ "$reClone" = "1" ]; then
		#statements
		echo -e "\e[37mReintentando clonar el repositorio:\e[0m"
		cloneGit
	elif [ "$reClone" = "2" ]; then
		verInternet
	elif [ "$reClone" = "3" ]; then
		exit
	else
		echo -e "\e[31mgit clone---ERROR [No se logró clonar el repositorio.]\e[0m"
	fi
}

#function installBD {
	#------------------------------------------------------------------------
	#reestablecer la BD del framework
	#https://www.regoremor.com/plataformas/linux/exportacion-e-importacion-de-bases-de-datos-mysql-linux/
	#------------------------------------------------------------------------
#}
#-----------------------------------------------------------------------------------------------------------

function ejecutar {

	verificarGit
}

#-----------------------------------------------------------------------------------------------------------
#Ejecución
#negro30,azul34,verde32,cyan36,rojo31,purpura35,marron33,gris37
ejecutar
#-----------------------------------------------------------------------------------------------------------
