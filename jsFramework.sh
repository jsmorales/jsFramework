#!/bin/bash
#Script de manejo del framework por consola.

#Este script va a manejar parametros de la siguiente manera
#Primer parametro: Tipo -- DAO, controller, cont_js; esto va a definir a que carpeta va y como va
#a ser en parte el nombre.
#Segundo parametro: Nombre -- segun como se llame el módulo

#echo "Todos : $*"
#echo "Mostrando primer parametro : $1"
#set ov toaster punto com
#echo "todos después de set : $*"

#---------------------------------------------------------------------------
#funciones 

#crear_DAO(){}

#---------------------------------------------------------------------------

#valida que lleve el tipo y el nombre
if [ $1 == "DAO" ] && [ $2 ] ; then
	#statements
	echo "Creando DAO..."
	#crea en una variable el nombre del archivo
	NOMBRE_DAO="$2DAO.php"
	#crea el archivo con el comando touch y asigna permisos 777
	touch DAO/${NOMBRE_DAO} && chmod -R 777 DAO/${NOMBRE_DAO}
	#ingresa en la carpeta correspondiente
	cd DAO/

	#inserta contenido------------------------------------------------------
	echo "<?php" >> ${NOMBRE_DAO}
	echo "	/**/" >> ${NOMBRE_DAO}
	echo "	include_once 'genericoDAO.php';" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "	class $2DAO extends GenericoDAO {" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		public $""generico;" >> ${NOMBRE_DAO}
	echo "		public $""q_general;" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		function __construct(){" >> ${NOMBRE_DAO}
	echo "			$""this->generico = new GenericoDAO();" >> ${NOMBRE_DAO}
	echo "		}" >> ${NOMBRE_DAO}
	echo "		" >> ${NOMBRE_DAO}
	echo "		//Funciones------------------------------------------" >> ${NOMBRE_DAO}
	echo "		//Espacio para las funciones en general de esta clase." >> ${NOMBRE_DAO}
	echo "	}" >> ${NOMBRE_DAO}
	echo "?>" >> ${NOMBRE_DAO}
	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_DAO} ];
	then
	echo "El archivo DAO fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

elif [ $1 == "controller" ] && [ $2 ]; then
	
	echo "Creando controller..."

	#crea en una variable el nombre del archivo
	NOMBRE_CONTROLLER="$2Controller.php"
	#crea el archivo con el comando touch y asigna permisos 777
	touch controller/${NOMBRE_CONTROLLER} && chmod -R 777 controller/${NOMBRE_CONTROLLER}
	#ingresa en la carpeta correspondiente
	cd controller/

	#inserta contenido------------------------------------------------------
	echo "<?php" >> ${NOMBRE_CONTROLLER}
	echo "	/**/" >> ${NOMBRE_CONTROLLER}
	echo "	include_once '../DAO/$2DAO.php';" >> ${NOMBRE_CONTROLLER} #nombre del DAO que debe existir previamente.
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "	class $2Controller {" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		public $""$2DAO;" >> ${NOMBRE_CONTROLLER} #variable donde se instancia el DAO para el controlador.	
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		function __construct(){" >> ${NOMBRE_CONTROLLER} #constructor que instacia el DAO
	echo "			$""this->$2DAO = new $2DAO();" >> ${NOMBRE_CONTROLLER}
	echo "		}" >> ${NOMBRE_CONTROLLER}
	echo "		" >> ${NOMBRE_CONTROLLER}
	echo "		//Funciones-------------------------------------------" >> ${NOMBRE_CONTROLLER}
	echo "		//Espacio para las funciones en general de esta clase." >> ${NOMBRE_CONTROLLER}
	echo "	}" >> ${NOMBRE_CONTROLLER}
	echo "?>" >> ${NOMBRE_CONTROLLER}
	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_CONTROLLER} ];
	then
	echo "El archivo controller fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

elif [ $1 == "cont_js" ] && [ $2 ]; then

	echo "Creando cont_js..."

	#crea en una variable el nombre del archivo
	NOMBRE_CONT_JS="cont_$2.js"
	#crea el archivo con el comando touch y asigna permisos 777
	touch js/scripts_cont/${NOMBRE_CONT_JS} && chmod -R 777 js/scripts_cont/${NOMBRE_CONT_JS}
	#ingresa en la carpeta correspondiente
	cd js/scripts_cont/

	#inserta contenido------------------------------------------------------
	echo "$""(function(){" >> ${NOMBRE_CONT_JS}
	echo "	/*Nota: asignar el valor en nom_tabla a todas las funciones ajax que lo requieren.*/" >> ${NOMBRE_CONT_JS}
	echo "	//console.log('hola desde $2');" >> ${NOMBRE_CONT_JS} #nombre del DAO que debe existir previamente.
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	//---------------------------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "	//variable para el objeto del formulario" >> ${NOMBRE_CONT_JS}
	echo "	var objt_f_$2 = {};" >> ${NOMBRE_CONT_JS}
	echo "	//variable de accion del boton del formulario" >> ${NOMBRE_CONT_JS}
	echo "	var action = ;" >> ${NOMBRE_CONT_JS}
	echo "	//variable para el id del registro;" >> ${NOMBRE_CONT_JS}
	echo "	var id_$2 = "";" >> ${NOMBRE_CONT_JS}
	echo "	//---------------------------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	//Funciones------------------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	function valida_action(action){" >> ${NOMBRE_CONT_JS}
	echo "		if(action===""'crear'""){" >> ${NOMBRE_CONT_JS}
	echo "			crea_$2();" >> ${NOMBRE_CONT_JS}
	echo "		}else if(action===""'editar'""){" >> ${NOMBRE_CONT_JS}
	echo "			edita_$2();" >> ${NOMBRE_CONT_JS}
	echo "		};" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	function crea_$2(){" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "		//--------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "		//crea el objeto formulario serializado" >> ${NOMBRE_CONT_JS}
	echo "		objt_f_$2 = $("#form_$2").valida();" >> ${NOMBRE_CONT_JS}
	echo "		//console.log(objt_f_$2);" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "		if( objt_f_$2.estado == true ){" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "			$.ajax({" >> ${NOMBRE_CONT_JS}
	echo "				url: ""'../controller/ajaxController12.php'""," >> ${NOMBRE_CONT_JS}
	echo "				data: objt_f_$2.srlz+""'&tipo=inserta_registro&nom_tabla=--'""," >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.done(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				//---------------------" >> ${NOMBRE_CONT_JS}
	echo "				console.log(data);" >> ${NOMBRE_CONT_JS}
	echo "				alert(data[0].mensaje);" >> ${NOMBRE_CONT_JS}
	echo "				location.reload();" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.fail(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				console.log(data);" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.always(function() {" >> ${NOMBRE_CONT_JS}
	echo "				console.log(""'complete'"");" >> ${NOMBRE_CONT_JS}		
	echo "			});" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "		}else{" >> ${NOMBRE_CONT_JS}
	echo "			alert(""'El formulario no está totalmente diligenciado, revíselo e inténtelo de nuevo.'"");" >> ${NOMBRE_CONT_JS}
	echo "		};" >> ${NOMBRE_CONT_JS}
	echo "	}" >> ${NOMBRE_CONT_JS}
	echo "	//cierra_crea" >> ${NOMBRE_CONT_JS}
	echo "	" >> ${NOMBRE_CONT_JS}

	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	function edita_$2(){" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "		//--------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "		//crea el objeto formulario serializado" >> ${NOMBRE_CONT_JS}
	echo "		objt_f_$2 = $("#form_$2").valida();" >> ${NOMBRE_CONT_JS}
	echo "		//console.log(objt_f_$2);" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "		if( objt_f_$2.estado == true ){" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "			$.ajax({" >> ${NOMBRE_CONT_JS}
	echo "				url: ""'../controller/ajaxController12.php'""," >> ${NOMBRE_CONT_JS}
	echo "				data: objt_f_$2.srlz+""'&tipo=actualizar&nom_tabla=--'""," >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.done(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				//---------------------" >> ${NOMBRE_CONT_JS}
	echo "				console.log(data.mensaje.mensaje);" >> ${NOMBRE_CONT_JS}
	echo "				alert(data.mensaje.mensaje);" >> ${NOMBRE_CONT_JS}
	echo "				location.reload();" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.fail(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				console.log('error');" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.always(function() {" >> ${NOMBRE_CONT_JS}
	echo "				console.log('complete');" >> ${NOMBRE_CONT_JS}		
	echo "			});" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "		}else{" >> ${NOMBRE_CONT_JS}
	echo "			alert(""'Faltan ""'+Object.keys(objt_f_usuario.objt).length+""' campos por llenar.'"");" >> ${NOMBRE_CONT_JS}
	echo "		};" >> ${NOMBRE_CONT_JS}
	echo "	}" >> ${NOMBRE_CONT_JS}
	echo "	//cierra_edita" >> ${NOMBRE_CONT_JS}

	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	function elimina_$2(id_$2){" >> ${NOMBRE_CONT_JS}
	echo "		//console.log('Eliminar el $2: '+id_$2);" >> ${NOMBRE_CONT_JS}
	echo "		//--------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "		var confirma = confirm(""'En realidad quiere eliminar este $2?'"");" >> ${NOMBRE_CONT_JS}	
	echo "		//console.log(confirma);" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}
	echo "		if( confirma == true ){" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "			$.ajax({" >> ${NOMBRE_CONT_JS}
	echo "				url: ""'../controller/ajaxController12.php'""," >> ${NOMBRE_CONT_JS}
	echo "				data: ""'pkID=""'+id_$2+'""&tipo=eliminar&nom_tabla=--'""," >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.done(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				//---------------------" >> ${NOMBRE_CONT_JS}
	echo "				console.log(data);" >> ${NOMBRE_CONT_JS}
	echo "				alert(data.mensaje.mensaje);" >> ${NOMBRE_CONT_JS}
	echo "				location.reload();" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.fail(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "				console.log('error');" >> ${NOMBRE_CONT_JS}
	echo "			})" >> ${NOMBRE_CONT_JS}
	echo "			.always(function() {" >> ${NOMBRE_CONT_JS}
	echo "				console.log('complete');" >> ${NOMBRE_CONT_JS}		
	echo "			});" >> ${NOMBRE_CONT_JS}
	echo "			" >> ${NOMBRE_CONT_JS}
	echo "		}else{" >> ${NOMBRE_CONT_JS}
	echo "			//no hace nada" >> ${NOMBRE_CONT_JS}
	echo "		};" >> ${NOMBRE_CONT_JS}
	echo "	}" >> ${NOMBRE_CONT_JS}
	echo "	//cierra_elimina" >> ${NOMBRE_CONT_JS}

	echo "		" >> ${NOMBRE_CONT_JS}
	echo "	function carga_$2(id_$2){" >> ${NOMBRE_CONT_JS}
	echo "		//console.log('Carga el $2: '+id_$2);" >> ${NOMBRE_CONT_JS}
	echo "		//--------------------------------------" >> ${NOMBRE_CONT_JS}	
	echo "		" >> ${NOMBRE_CONT_JS}	
	echo "		$.ajax({" >> ${NOMBRE_CONT_JS}
	echo "			url: ""'../controller/ajaxController12.php'""," >> ${NOMBRE_CONT_JS}
	echo "			data: ""'pkID=""'+id_$2+""'&tipo=consultar&nom_tabla=--'""," >> ${NOMBRE_CONT_JS}
	echo "		})" >> ${NOMBRE_CONT_JS}
	echo "		.done(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "			//---------------------" >> ${NOMBRE_CONT_JS}
	echo "			$.each(data.mensaje[0], function( key, value ) {" >> ${NOMBRE_CONT_JS}
	echo "				console.log(key+'--'+value);" >> ${NOMBRE_CONT_JS}
	echo "				$('#'+key).val(value);" >> ${NOMBRE_CONT_JS}
	echo "			});" >> ${NOMBRE_CONT_JS}
	echo "		})" >> ${NOMBRE_CONT_JS}
	echo "		.fail(function(data) {" >> ${NOMBRE_CONT_JS}
	echo "			console.log('error');" >> ${NOMBRE_CONT_JS}
	echo "		})" >> ${NOMBRE_CONT_JS}
	echo "		.always(function() {" >> ${NOMBRE_CONT_JS}
	echo "			console.log('complete');" >> ${NOMBRE_CONT_JS}		
	echo "		});" >> ${NOMBRE_CONT_JS}
	echo "		" >> ${NOMBRE_CONT_JS}	
	echo "	}" >> ${NOMBRE_CONT_JS}
	echo "	//cierra_carga" >> ${NOMBRE_CONT_JS}
	echo "	//---------------------------------------------------------" >> ${NOMBRE_CONT_JS}
	echo "	//Ejecucion" >> ${NOMBRE_CONT_JS}	
	echo " 	/*" >> ${NOMBRE_CONT_JS}
	echo " 	Botón que carga el formulario para insertar" >> ${NOMBRE_CONT_JS}
	echo " 	*/" >> ${NOMBRE_CONT_JS}
	echo " 	$""('#btn_nuevo$2').click(function(){" >> ${NOMBRE_CONT_JS}
	echo " 		" >> ${NOMBRE_CONT_JS}
	echo " 		$""('#lbl_form_$2').html('Nuevo Registro $2');" >> ${NOMBRE_CONT_JS}
	echo " 		$""('#lbl_btn_action$2').html('Guardar<span class="\""glyphicon glyphicon-chevron-right"\""></span>');" >> ${NOMBRE_CONT_JS}
	echo " 		$""('#btn_action$2').attr('data-action','crear');" >> ${NOMBRE_CONT_JS}
	echo " 		$""('#form_$2')[0].reset();" >> ${NOMBRE_CONT_JS}	  		  	     	 
	echo " 	});" >> ${NOMBRE_CONT_JS}
	
	echo "	" >> ${NOMBRE_CONT_JS}
	echo " 	/*" >> ${NOMBRE_CONT_JS}
    echo " 	Botón que carga el formulario para editar" >> ${NOMBRE_CONT_JS}
    echo " 	*/" >> ${NOMBRE_CONT_JS}  
    echo " 	$""('name*=["\""edita_$2"\""]').click(function(event) {" >> ${NOMBRE_CONT_JS}
    echo "	" >> ${NOMBRE_CONT_JS}
    echo " 	 	$""('#lbl_form_$2').html('Editar Registro $2');" >> ${NOMBRE_CONT_JS}
    echo "		$""('#lbl_btn_action$2').html('Guardar Cambios<span class="\""glyphicon glyphicon-chevron-right"\""></span>');" >> ${NOMBRE_CONT_JS}
    echo "		$""('#btn_action$2').attr('data-action','editar');" >> ${NOMBRE_CONT_JS}
    echo "		$""('#form_$2')[0].reset();" >> ${NOMBRE_CONT_JS}	    
    echo "		id_$2 = $(this).attr('data-id-$2');" >> ${NOMBRE_CONT_JS}	     
    echo "		carga_$2(id_$2); " >> ${NOMBRE_CONT_JS}      
    echo " 	});" >> ${NOMBRE_CONT_JS}
	
	echo " 	/*" >> ${NOMBRE_CONT_JS}
	echo " 	Botón de accion de formulario" >> ${NOMBRE_CONT_JS}
	echo " 	*/" >> ${NOMBRE_CONT_JS}
	echo " 	$""('#btn_action$2').click(function(){" >> ${NOMBRE_CONT_JS}
    echo "		/**/" >> ${NOMBRE_CONT_JS}
	echo "		action = $""(this).attr('data-action');" >> ${NOMBRE_CONT_JS}
	echo "		valida_action(action);" >> ${NOMBRE_CONT_JS}
	echo "		console.log('accion a ejecutar: '+action);" >> ${NOMBRE_CONT_JS}     
	echo " 	});" >> ${NOMBRE_CONT_JS}

	echo " 	/*" >> ${NOMBRE_CONT_JS}
	echo " 	Botón de eliminar" >> ${NOMBRE_CONT_JS}
	echo " 	*/" >> ${NOMBRE_CONT_JS}
	echo " 	$""('[name*="\""elimina_$2"\""]').click(function(event) {" >> ${NOMBRE_CONT_JS}
	echo " 		/**/" >> ${NOMBRE_CONT_JS}
	echo " 		id_$2 = $(this).attr('data-id-$2');" >> ${NOMBRE_CONT_JS}
	echo " 		elimina_$2(id_$2);" >> ${NOMBRE_CONT_JS}
	echo " 	});" >> ${NOMBRE_CONT_JS}
	echo "	//---------------------------------------------------------" >> ${NOMBRE_CONT_JS}
	
	echo "});" >> ${NOMBRE_CONT_JS}

	#------------------------------------------------------------------------
	
	#muestra el contenido de la carpeta
	ls -l
	
	#notifica que el archivo ha sido creado // como validar que realmente se 
	#creo el archivo? -- que pasa si ya existe?
	#http://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/
	#echo "El archivo fue creado con exito."
	#Comprobacion de archivo
	if [ -f ${NOMBRE_CONT_JS} ];
	then
	echo "El archivo cont_js fue creado exitosamente."
	else
	echo "El archivo no se pudo crear."
	fi
	#-----------------------------------------------------------------------

else
	echo "No es posible crear nada fata el tipo o el nombre, gracias."
fi