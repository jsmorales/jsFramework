<?php 
    include("../conexion/datos.php");
    include("controller/scripts_cont.php");
 ?>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo $directorio_raiz; ?></title>

    <?php 

        $scripts = new scripts_pag();
        $scripts->standarCss();
     ?>

</head>

<body>

    <div id="wrapper">
        <!-- Div en el que se lleva el tiempo de la sesion para ayuda del plugin. -->
        <div id="timer-sesion" hidden="true"></div>
