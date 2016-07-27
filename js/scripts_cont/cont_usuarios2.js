$(function(){
	console.log('hola usuarios2')

	$("#btn_nuevoUsuario").jquery_controllerV2({
  		nom_modulo:'usuario',
  		titulo_label:'Nuevo Usuario'
  	});

  	$("#btn_nuevoUsuario").click(function(event) {
  		/* Act on the event */
  		destruye_cambia_pass();	
  	});

  	$("#btn_actionusuario").jquery_controllerV2({
  		tipo:'inserta/edita',
  		nom_modulo:'usuario',
  		nom_tabla:'usuarios',
  		recarga:false  		 		  
  	});

  	$("[name*='edita_usuario']").jquery_controllerV2({
		tipo:'carga_editar',
  		nom_modulo:'usuario',
  		nom_tabla:'usuarios',
  		titulo_label:'Editar Usuario',
  		tipo_load:1
	});

	$("[name*='edita_usuario']").click(function(event) {
		/* Act on the event */
		crea_cambia_pass();
	});

  	$("[name*='elimina_usuario']").jquery_controllerV2({
  		tipo:'eliminar',
  		nom_modulo:'usuario',
  		nom_tabla:'usuarios'
  	}); 

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

    //-------------------------------------------------------------------------
})