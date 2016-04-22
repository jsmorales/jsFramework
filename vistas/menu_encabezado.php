<?php

    /*
    ----------------------------------------------------------------------------------------
    Nombre de las cookies que viene del archivo de datos, según sea el nombre de la app.
    */
    include_once '../conexion/datos.php';
    //--------------------------------------------------------------------------------------

    $nombre = $_COOKIE[$NomCookiesApp."_nombre"];
    $alias = $_COOKIE[$NomCookiesApp."_alias"];
    $tipo = $_COOKIE[$NomCookiesApp."_tipo"];
 ?>
      <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Lunel-IE Manager</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <?php echo $nombre ?> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <!--<li><a href="#"><i class="fa fa-user fa-fw"></i> </a>
                        </li>-->
                        <li class="dropdown-header">Configuración</li>

                        <?php 

                            if ( $tipo == "Administrador" ) {
                                # code...
                                echo '<li><a href="usuarios.php"><i class="fa fa-user fa-fw"></i> <ins>Usuarios</ins></a>';
                            }else{
                                echo '<li><a href="usuarios.php"><i class="fa fa-user fa-fw"></i> <ins>Editar Perfil</ins></a>';
                            }
                         ?>                        

                        <li class="dropdown-header">Tipo de Usuario</li>
                        <li><a href="#"><i class="fa fa-tag fa-fw"></i> <?php echo $tipo ?></a></li>                        
                        <li class="divider"></li>
                        <li><a href="../controller/logout.php"><i class="fa fa-sign-out fa-fw"></i> <ins>Salir</ins></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

        </nav>