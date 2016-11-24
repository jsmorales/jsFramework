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

    <link href="../bower_components/ladda-bootstrap/dist/ladda-themeless.css" rel="stylesheet">

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Nombre App Log In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="../controller/login_autentica.php" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input id="username" name="username" class="form-control" placeholder="Usuario" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input id="password" name="password" class="form-control" placeholder="Contraseña" type="password" value="">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form --> 
                                <button id="btn_login" class="btn btn-lg btn-success btn-block ladda-button" data-style="slide-up"><span class="ladda-label">Ingresar</span></button>                               
                            </fieldset>
                            <div class="form-group text-center">
                                <br>
                                <a href="registro.php">Registrarse <span class="glyphicon glyphicon-log-in"></span> </a>
                            </div>
                        </form>
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
    
    <!-- Ladda spinner -->
    <script src="../bower_components/ladda-bootstrap/dist/spin.js"></script>
    
    <script src="../bower_components/ladda-bootstrap/dist/ladda.js"></script>
    
    <script>
    $(function(){
        //console.log('Hola login');
        var l = Ladda.bind( '#btn_login' );
        //l.start();
    });
    </script>
</body>

</html>
