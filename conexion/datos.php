<?php
/*
---------------------------------------------------------------------------------------------
Archivo de Instalacion 

+En este archivo deben ir todas las variables que cambian respecto al servidor donde se insta
le esta aplicacion como variables de conexion a base de datos o rutas de subidas de archivos.
---------------------------------------------------------------------------------------------
*/

/*
---------------------------------------------------------------------------------------------
Nombre del directorio raíz 
---------------------------------------------------------------------------------------------
*/
//nombre directorio raiz 
$directorio_raiz = '';
//------------------------------------------------------------------------------------------- 	

/*
Conexion Base de datos-----------------------------------------------------------------------
*/
$dbconection="";
$userconection="";
$passconection="";
$hostconection="";
//-------------------------------------------------------------------------------------------

/*
---------------------------------------------------------------------------------------------
Nombre de las cookies para la autenticación de la aplicación
---------------------------------------------------------------------------------------------
*/
//servidor apache 
$NomCookiesApp = 'log_jsFramework';
//-------------------------------------------------------------------------------------------

/*
---------------------------------------------------------------------------------------------
Ruta subida de archivos 
---------------------------------------------------------------------------------------------
*/
//servidor apache 
$ruta_server = '/var/www/html/'.$directorio_raiz.'/vistas/subidas/';
//-------------------------------------------------------------------------------------------
?>