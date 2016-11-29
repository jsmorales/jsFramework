<?php

	/**
	ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);	
	* 
	*/
	class Scripts {

				
		public function getJSON(){

			//$ficheros1  = scandir($directorio);

			$salida = shell_exec('cd .. && bower list --paths > paths.json');
			$ini = shell_exec('cd .. && sed -i "1i {" paths.json');
			$fin = shell_exec('cd .. && echo "}" >> paths.json');
			//sed -i '$a Aqui el texto que ira en la ultima linea' archivo.txt
			//echo "get json ok.";

			
		}

		public function getDataJson(){
			
			$data = file_get_contents("../paths.json");		
			$paths = json_decode($data);
			//echo json_last_error();

			//echo $data;

			$replace = str_replace("'", "\"", $data);

			//echo $replace;

			$pregReplace = preg_replace("/[^,]+(\s)+\w+/i", "\"\&\"", $replace);

			echo $pregReplace;
			/*
			//---------------------------------------
			if (is_writable("../paths.json")) {
				$archivo = fopen("../paths.json", 'w');
				$fwrite = fwrite($archivo, $replace);
				fclose($archivo);
				//-------------------------------------
					
					$data = file_get_contents("../paths.json");
					$paths = json_decode($data);
					//echo $paths;

					foreach ($paths as $key => $value){ 

						if(sizeof($value)>1){

							foreach ($value as $ll => $val) {
								echo "llave: ".$ll." valor: ".$val."<br>";
							};

						}else{
							echo "llave: ".$key." valor: ".$value."<br>";
						};

					}

					//echo json_last_error();
				//-------------------------------------
			}else{
				echo "El archivo paths no es escribible";
			}*/

			//$data = file_get_contents("../paths.json");
			//$paths = json_decode($data);
			//echo json_encode($paths);

			//$fwrite = fwrite($archivo, $replace));

			//fclose($archivo);
		}

		
	}


	$script = new Scripts();

	$script->getJSON();

	$script->getDataJson();

 ?>