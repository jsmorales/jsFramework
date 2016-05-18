$(function(){
	//console.log('hola desde usuarios');

	//---------------------------------------------------------
	//variable para el objeto del formulario
	var objt_f_usuario = {};
	//variable de accion del boton del formulario
	var action = "";
	//variable para el id del registro
	var id_usuario = "";

	var pass = "";
	//---------------------------------------------------------

    //funciones cambiar de pass---------------------------------------------------------------------

    function crea_cambia_pass(){

    	destruye_cambia_pass();

    	$("#pass").attr("readonly","true");

    	$(".modal-footer").append('<button id="btn_passUsuario" type="button" class="btn btn-warning" data-action="-">'+
            '<span id="lbl_btn_passUsuario"></span>'+
        '</button>');

        
        $("#btn_passUsuario").html("Cambiar Contraseña");

        $("#btn_passUsuario").attr('data-action', 'cambia_pass');

        $("#btn_passUsuario").click(function(event) {
	  		/* Act on the event */
	  		$("#btn_actionUsuario").attr('class', 'hidden');
	  		pass = $("#pass").val();
	  		id_usuario = $("#pkID").val();

	  		var action_pass = $(this).attr('data-action');
	  		valida_action_pass(action_pass);
	  	});

	  	function valida_action_pass(action_pass){

	  		if(action_pass == "cambia_pass"){
	  			cambia_pass();
	  		}else if(action_pass == "edita_pass"){
	  			
	  			edita_pass(pass);
	  		}
	  	}

	  	function cambia_pass(){

	  		$("#btn_passUsuario").attr('data-action', 'edita_pass');
	  		$("#btn_passUsuario").html("Guardar Contraseña");

	  		$("#pass").removeAttr('readonly');

	  		$("#pass").val("");

	  		$("#pass").focus();
	  	}

	  	function edita_pass(pass){

	    	console.log("Carga pass "+pass);

		    $.ajax({
		        url: '../controller/ajaxController12.php',
		        data: "pkID="+id_usuario+"&pass="+pass+"&tipo=actualiza_usuario&nom_tabla=usuarios",
		    })
		    .done(function(data) {
		    	console.log(data);
		    	alert(data.mensaje);
		    	location.reload();
		    })
		    .fail(function() {
		        console.log("error");
		    })
		    .always(function() {
		        console.log("complete");
		    });
	    }
    };    
    

    function destruye_cambia_pass(){

    	$("#pass").removeAttr('readonly');

    	$("#btn_passUsuario").remove();
    }

	//---------------------------------------------------------
	//ejecución
	//-------------------------------------------------------------------------------
	/*
	Botón que carga el formulario para insertar
	*/
	$("#btn_nuevoUsuario").click(function(){	  	
	  	destruye_cambia_pass();	      	   
	});

	/*
    Botón que carga el formulario para editar
    */  
    $("[name*='edita_usuario']").click(function(event) {    	
        crea_cambia_pass();       
    });
    

  	//---------------------------------------------------------
  	//ejecucion cambiar de pass

  	//---------------------------------------------------------
  	//pruebas de jquery_controller.js / aca se llama inserta_p.js
  	//jquery_controller('nombre_del_modulo','tipo','nombre de la tabla en BD','tipo de carga 1,2')

  	$("#btn_nuevoUsuario").jquery_controller('usuario','nuevo','','');

  	$("#btn_actionusuario").jquery_controller('usuario','inserta/edita','usuarios','');

  	$("[name*='edita_usuario']").jquery_controller('usuario','carga_editar','usuarios',1);

  	$("[name*='elimina_usuario']").jquery_controller('usuario','eliminar','usuarios','');
});