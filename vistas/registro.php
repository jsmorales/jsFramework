<?php 
    include_once("../controller/UsuariosController.php");
    $inst = new UsuariosController();
 ?>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nombre App</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Nombre App Registro</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="form_registro">
                            <fieldset>
                                <div class="form-group">
                                    <input id="alias" name="alias" class="form-control" placeholder="Usuario" type="text" autofocus>
                                </div>
                                <div class="form-group" id="div_pass">
                                    <input id="pass" name="pass" class="form-control" placeholder="Contraseña" type="password" value="">
                                </div>
                                <!--<div class="form-group">
                                     crear a partir de js para que no intervenga con el form 
                                    <input id="password-conf" name="password-conf" class="form-control" placeholder="Confirmar Contraseña" type="password" value="">
                                </div>-->
                                <div class="form-group">
                                    <input id="nombre" name="nombre" class="form-control" placeholder="Nombre" type="text">
                                </div>
                                <div class="form-group">
                                    <input id="apellido" name="apellido" class="form-control" placeholder="Apellido" type="text">
                                </div>
                                <div class="form-group">
                                    <select id="fkID_tipo" name="fkID_tipo" class="form-control">
                                        <option value=""></option>
                                        <?php
                                            $tipos = $inst->getTipoUsuariosNoAdmin(); 
                                            foreach ($tipos as $key => $value) {                                                
                                                echo '<option value="'.$value["pkID"].'">'.$value["nombre"].'</option>';                                                
                                            }
                                        ?>
                                    </select>
                                </div>                                                            
                            </fieldset>                           
                        </form>
                        
                        <!-- Change this to a button or input when using this as a form --> 
                        <button id="btn_register" data-action="crear" class="btn btn-lg btn-success btn-block">Registrarme</button>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <script src="../bower_components/valida_p.js/js/valida_p_v1.js"></script>

    <script src="../js/validaFormPlugin2.js"></script>

    <script src="../js/scripts_cont/cont_registro.js"></script>

</body>

</html>
