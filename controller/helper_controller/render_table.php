<?php 
	
	/**
	* 
	*/
	class RenderTable {
		
		/**/

		public $array_data;
		public $array_permit;
		public $array_buttons;

		function __construct($a_data,$a_permit,$a_buttons)
		{
			# code...
			$this->array_data = $a_data;
			$this->array_permit = $a_permit;
			$this->array_buttons = $a_buttons;
		}


		function render(){
		
		
			//toma el array y lo recorre
			foreach ($this->array_data as $llave => $valor) {
				
				//echo "llave: ".$llave." valor: ".$valor."<br>";

				echo '<tr>';					
				//pinta los valores de array_data en relacion a los valores de 
				//array_permit
				foreach ($this->array_permit as $ll => $val) {				
							
					echo '<td>'.$valor[$val].'</td>';						
				}

				//funcion para crear los botones de opciones
				$this->render_buttons($valor);

				echo '</tr>';

			}
			
		}

		function render_blank(){

			echo '<tr>';					
				//pinta los valores de array_data en relacion a los valores de 
				//array_permit
				foreach ($this->array_permit as $ll => $val) {				
							
					echo '<td></td>';						
				}
				//,as el de las opciones
				echo '<td></td>';				

				echo '</tr>';
		}

		function render_buttons($arr_val){

			//print_r($arr_val);
			//echo $arr_val["pkID"]."<br>";

			echo '<td>';
				foreach ($this->array_buttons as $key => $value) {
					
					//echo "llave: ".$key." valor: ".$value."<br>";
					$this->render_button($value["tipo"],$value["nombre"],$arr_val["pkID"],$value["permiso"]);
				}
			echo '</td>';

		}

		function render_button($type,$name,$id,$permiso){
			//------------------------------------------------------------------------------------------------
			/*evalua el permiso para poderlo renderizar*/
			if ($permiso=="1") {
				$permiso = "";
			} else {
				$permiso = "disabled";
			};			
			//------------------------------------------------------------------------------------------------			
			switch ($type) {
				case 'editar':
					echo '<button id="btn_editar" name="edita_'.$name.'" type="button" class="btn btn-warning" data-toggle="modal" data-target="#frm_modal_'.$name.'" data-id-'.$name.' = "'.$id.'" '.$permiso.'><span class="glyphicon glyphicon-pencil"></span></button>&nbsp';
					break;
				case 'eliminar':
					echo '<button id="btn_eliminar" name="elimina_'.$name.'" type="button" class="btn btn-danger" data-id-'.$name.' = "'.$id.'" '.$permiso.'><span class="glyphicon glyphicon-remove"></span></button>&nbsp';
					break;						
			}
			//------------------------------------------------------------------------------------------------
		}

	}

 ?>