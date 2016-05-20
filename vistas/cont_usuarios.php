<?php 

  include("../controller/UsuariosController.php");
  include("../conexion/datos.php");
  $usuariosInst = new usuariosController();
 ?>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
<!-- Form usuarios -->
<div class="modal fade bs-example-modal-lg" id="frm_modal_usuario" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lbl_form_usuario">-</h4>
      </div>
      <div class="modal-body">
        <!-- form modal contenido -->

                <form id="form_usuario" class="form-horizontal" method="POST">
                <br>
                    <div class="form-group" hidden>                     
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="pkID" name="pkID">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="alias" class="col-sm-2 control-label">Alias</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="alias" name="alias" placeholder="Nombre de usuario en el sistema" required = "true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pass" class="col-sm-2 control-label">Contraseña</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña de usuario en el sistema" required = "true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nombres" class="col-sm-2 control-label">Nombres</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del usuario" required = "true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellidos del usuario" required = "true">
                        </div>
                    </div>                

                    <div class="form-group">
                        <label for="fkID_tipo" class="col-sm-2 control-label">Tipo de Usuario</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="fkID_tipo" name="fkID_tipo" required = "true">
                              <option></option>
                              <?php 
                                $usuariosInst->getTipoUsuarios();
                               ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Archivo</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="archivo" name="archivo">
                        </div>
                    </div> 
                  <input type="text" name="url_archivo" id="url_archivo" value="nombre archivo">

                </form>


        <!-- /form modal contenido-->
      </div>
      <div class="modal-footer">        
        <button id="btn_actionusuario" type="button" class="btn btn-primary" data-action="-">
            <span id="lbl_btn_actionusuario"></span>
        </button>
      </div>
    </div>
  </div>
</div>
<!-- /form modal -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

<div id="page-wrapper">

  <div class="row">

      <div class="col-lg-12">
          <h1 class="page-header">Usuarios</h1> 
      </div>        
      <!-- /.col-lg-12 -->
      
  </div>
  <!-- /.row -->

  <div class="row">

  <?php //echo 'el perfil es '.$_COOKIE["log_lunelAdmin_tipo"];; ?>

    <div class="dataTable_wrapper">
        <table class="table table-striped table-bordered table-hover" id="tbl_proceso">
            <thead>
                <tr>
                    <th>ID usuario</th>
                    <th>Alias</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>                                                            
                    <th>Tipo</th>
                    <th>Opciones</th>                                               
                </tr>
            </thead>

            <tbody>
                <?php
                    //print_r($_COOKIE); 
                    $usuariosInst->getTablaUsuarios($_COOKIE[$NomCookiesApp."_tipo"]);                           
                 ?>
            </tbody>
        </table>
    </div>
    <!-- /.table-responsive -->

    <button id="btn_nuevoUsuario" type="button" class="btn btn-primary" data-toggle="modal" data-target="#frm_modal_usuario"><span class="glyphicon glyphicon-plus"></span> Nuevo usuario</button>            
     
  </div>
  <!-- /.row -->
                
</div>
<!-- /#page-wrapper -->