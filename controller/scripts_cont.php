
<?php 

    class scripts_pag {        

        public function standar(){

            echo '  <!-- jQuery -->
                    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
                    <script src="../js/plugins/autocompleta/jquery-ui.min.js"></script>

                    <!-- Bootstrap Core JavaScript -->
                    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

                    <!-- Metis Menu Plugin JavaScript -->
                    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

                    <!-- DataTables JavaScript -->
                    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
                    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
                    <script src="../bower_components/datatables/data_tabla.js"></script>                                    

                    <!-- jquery ui widget-->
                    <script src="../js/jquery.ui.widget.js"></script>

                    <!-- jquery iframe-transport-->
                    <script src="../js/jquery.iframe-transport.js"></script>

                    <!-- jquery fileupload plugin-->
                    <script src="../js/jquery.fileupload.js"></script>

                    <!-- plugin para calendario -->
                    <script src="../js/plugins/calendario/moment.min.js"></script>                
                    <script src="../js/plugins/calendario/jquery-ui-timepicker-addon.js"></script>
                    <script src="../js/plugins/calendario/calendarCotizacion.js"></script>

                    <script src="../js/plugins/mask/jquery.mask.js"></script>
                    
                    <script src="../js/plugins/sesion_plugin/timer.jquery.js"></script>
                    <script src="../js/plugins/sesion_plugin/sesion_plugin.js"></script>
                    
                    <!-- Plugins creados valida_p_v1 y jquery_controller.js -->
                    <script src="../bower_components/valida_p.js/js/valida_p_v1.js"></script>
                    <script src="../bower_components/jquery_controller.js/jquery_controller.js"></script>

                    <!-- Custom Theme JavaScript -->
                    <script src="../dist/js/sb-admin-2.js"></script>';            
        }

        /*
                    <!-- Morris Charts JavaScript -->
                    <script src="../bower_components/raphael/raphael-min.js"></script>
                    <script src="../bower_components/morrisjs/morris.min.js"></script>
                    <script src="../js/morris-data.js"></script>
        */

        public function special($arr_script){

            $this->standar();

            for ($i=0; $i < sizeof($arr_script); $i++) { 
                # code...
                echo '<script src="../js/scripts_cont/'.$arr_script[$i].'"></script>';
            }
        }
    }

 ?>
