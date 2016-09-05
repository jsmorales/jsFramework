
<?php 
    /*
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);*/

    class scripts_pag {        

        public $arr_rutas = array(
                            "carpetas" => [],
                            "archivos "=> []
                        );
                        /**/
        public $arr_folders = array();
        public $arr_files = array();


        public $arr_foldersPadre = array();
        public $arr_filesPadre = array();

        public $arr_files_def = array();

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
                    
                    <!-- plugin para validar -->
                    <script src="../js/plugins/validav1/valida_p_v1.js"></script>

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
                    <script src="../js/plugins/mask/jquery.formatCurrency.js"></script>                    
                    <script src="../js/plugins/mask/accounting.min.js"></script>
                    
                    <script src="../js/plugins/sesion_plugin/timer.jquery.js"></script>
                    <script src="../js/plugins/sesion_plugin/sesion_plugin.js"></script>
                        
                    <!-- js treeview -->
                    <script src="../bower_components/bootstrap-treeview/public/js/bootstrap-treeview.js"></script>

                    <!-- Plugins creados valida_p_v1,jquery_controller.js,validaArchivoPlugin.js -->
                    <script src="../bower_components/valida_p.js/js/valida_p_v1.js"></script>
                    <script src="../bower_components/jquery_controller.js/jquery_controller.js"></script>
                    <script src="../bower_components/jquery_controllerV2.js/jquery_controllerV2.js"></script>
                    <script src="../bower_components/validaArchivoPlugin.js/validaArchivoPlugin.js"></script>
                    <script src="../bower_components/validaFormPlugin2.js/validaFormPlugin2.1.js"></script>
                    
                    <!-- Morris Charts JavaScript -->
                    <script src="../bower_components/raphael/raphael-min.js"></script>
                    <script src="../bower_components/morrisjs/morris.min.js"></script>


                    <script src="../js/scripts_cont/prueba_global.js"></script>

                    <!-- Custom Theme JavaScript -->
                    <script src="../dist/js/sb-admin-2.js"></script>';

                    //echo "Trabajando directorios desde php!!";

                    /*
                    $bower_components = '../bower_components';
                    
                    $ficheros1  = scandir($bower_components);
                    print_r($ficheros1);

                    $arr_rutas = [];

                    foreach ($ficheros1 as $key => $value) {
                        # code...
                        echo  "Los directorios son: ".$value."<br>";

                        if ( $value != '.' && $value != '..' ) {
                            # code......................................................

                            $dir_temp1 = $bower_components."/".$value;

                            if ( is_dir($dir_temp1) ) {
                                # code...
                                echo "Se encontraron los siguientes directorios: <br>";
                                $ficheros2  = scandir($dir_temp1);
                                foreach ($ficheros2 as $key1 => $value1) {
                                    # code...
                                    echo  $dir_temp1." Contiene: ".$value1."<br>";

                                    //si es directorio busca de nuevo
                                    $dir_temp2 = $dir_temp1."/".$value1;

                                    if(is_dir($dir_temp2)){
                                        echo "Es un dir..."."<br>";
                                    }else{
                                        echo "El archivo se llama: ".$value1."<br>";
                                        //mete la ruta en el array solo si termina en .js
                                        if (ereg(".js$", $value1)) {
                                            # code...
                                            array_push($arr_rutas, $dir_temp2);
                                        }                                       
                                        
                                    }
                                    //--------------------------------------------
                                }
                            }
                            #------------------------------------------------------------
                        }
                                                
                    }
                    echo "Las rutas encontradas son: <br>";
                    print_r($arr_rutas);*/

                    

                   
                    

                    /*
                    $bower_components = '../bower_components';

                    while ( is_dir($bower_components) ) {
                         # code...
                        $scan = scandir($bower_components);
                     } */                                                                                   
                    
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

        public function rutasDef($path_ini){

            $this->arr_folders = array();
            $this->arr_files = array();


            $this->arr_foldersPadre = array();
            $this->arr_filesPadre = array();

            $this->rutas_jsPadre($path_ini);

            //print_r($this->arr_foldersPadre);
            //print_r($this->arr_filesPadre);

            $cant_carpetas = sizeof($this->arr_foldersPadre);

            //echo "la cant de carpetas es: ".$cant_carpetas;

            /**/
            
            # code...

            foreach ($this->arr_foldersPadre as $llave => $contenido) {
                # code...
                $this->rutas_js($path_ini."/".$contenido);

                //print_r($this->arr_folders);
                //print_r($this->arr_files);
            }

            //renderizar la lista
            foreach ($this->arr_files as $key => $value) {
                # code...
                echo "-->La lista de archivos es: ".$path_ini."/".str_replace($path_ini."/", '', $value)."<br>";
            }
        }

        public function rutas_js($dir_padre){
                                              
           $dir_temp2 = '';

            /**/
           $scan = scandir($dir_padre);
           //print_r($scan);
           //----------------------------------------------------------------------------------------------
           foreach ($scan as $llave_scan => $contenido_scan) {
                
                $dir_temp2 = $dir_padre."/".$contenido_scan;

                //echo "validando: ".$dir_temp2."<br>";

                if(is_dir($dir_temp2)){
                    //echo "Es un dir..."."<br>";
                    //$this->arr_folders = array();
                    array_push($this->arr_folders, $dir_temp2);
                }else{
                    //echo "El archivo se llama: ".$value1."<br>";
                    //mete la ruta en el array solo si termina en .js
                    if (ereg(".js$", $contenido_scan)) {
                        # code...
                        //$this->arr_files = array();
                        array_push($this->arr_files, $dir_temp2);
                    }                                       
                    
                }
                
           }
           //----------------------------------------------------------------------------------------------
           //return $this->arr_rutas;

           //print_r($arr_rutas);
        }

        public function rutas_jsPadre($dir_padre){
                                              
           $dir_temp2 = '';

            /**/
           $scan = scandir($dir_padre);
           //print_r($scan);
           //----------------------------------------------------------------------------------------------
           foreach ($scan as $llave_scan => $contenido_scan) {
                
                $dir_temp2 = $dir_padre."/".$contenido_scan;

                //echo "validando: ".$dir_temp2."<br>";

                if(is_dir($dir_temp2)){
                    //echo "Es un dir..."."<br>";
                    array_push($this->arr_foldersPadre, $dir_temp2);
                }else{
                    //echo "El archivo se llama: ".$value1."<br>";
                    //mete la ruta en el array solo si termina en .js
                    if (ereg(".js$", $contenido_scan)) {
                        # code...
                        array_push($this->arr_filesPadre, $dir_temp2);
                    }                                       
                    
                }
                
           }
           //----------------------------------------------------------------------------------------------
           //return $this->arr_rutas;

           //print_r($arr_rutas);
        }

    //------------------------------------------------------------------------------------------------------
    }

 ?>
