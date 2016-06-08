(function($){

	var progreso = 0;
	var style_progreso = 0;

	$.fn.validaForm = function (min_width){

		var selector = $(this);

		console.log('ejecutando validaForm en '+this[0].id);

		function crear_progress(){

			if ($("#barra_progreso_div").length > 0) {
				console.log('la barra de progreso ya está');
			} else{				

				console.log(selector)

				$(selector).after('<div id="barra_progreso_div" class="progress">'+
		                            '<div id="barra_progreso" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 0em;">'+
		                                '0%'+
		                            '</div>'+
		                        '</div>');
			};
			
		}

		function contador(val_pro,val_style){
			// body...
			crear_progress();

			progreso = progreso + val_pro;
			style_progreso = style_progreso + val_style;

			$("#barra_progreso").attr('aria-valuenow', progreso);
			$("#barra_progreso").html(progreso+'%');
			$("#barra_progreso").attr('style', 'min-width: '+style_progreso+'em;');

			console.log('el progreso va en '+progreso);
			if (progreso == 100) {
				$("#barra_progreso").attr('class', 'progress-bar progress-bar-success');
			};
		}

		function descontador(val_pro,val_style){
			// body...
			crear_progress();

			progreso = progreso - val_pro;
			style_progreso = style_progreso - val_style;

			$("#barra_progreso").attr('aria-valuenow', progreso);
			$("#barra_progreso").html(progreso+'%');
			$("#barra_progreso").attr('style', 'min-width: '+style_progreso+'em;');

			console.log('el progreso va en '+progreso);
			if (progreso == 100) {
				$("#barra_progreso").attr('class', 'progress-bar progress-bar-warning');
			}else{
				$("#barra_progreso").attr('class', 'progress-bar progress-bar-warning');
			};
		}

		//setInterval('contador()',1000);

		/*
		var intervalo = setInterval(function(){
			//contador(10,2.8);
			contador(20,5.6);
			if (progreso == 100) {
				clearInterval(intervalo)
			}else{
				console.log('el progreso es '+progreso)
			};
		}, 3000);*/

		/*	
		$("#barra_progreso").click(function(event) {
			
			progreso = progreso + 10;
			style_progreso = style_progreso + 2.8;

			$(this).attr('aria-valuenow', progreso);
			$(this).html(progreso+'%');
			$(this).attr('style', 'min-width: '+style_progreso+'em;');
		});*/

		/*como saber cuantos elementos hay dentro del formulario?
			$(".form-control").length
			como saber cuanto es el min-width de barra progreso?
			manual
		*/
		//----------------------------------------------------------------------------

		var min_width_pro = 0;
		var pro_form = 0;

		//console.log($(selector)[0].)

		/*
		for (var i = 0; i < $(selector)[0].length; i++) {
			
		};*/

		var cant_dom_req = 0;

		$.each($(selector)[0], function(index, val) {
			 /* iterate through array or object */
			 console.log('index: '+index+' val: '+val)
			 console.log(val.required)

			 if (val.required == true) {
			 	cant_dom_req = cant_dom_req + 1;
			 };			 
		});

		console.log(cant_dom_req);

		
		function matematica_progress(min_width){

			console.log(min_width);

			min_width_pro = min_width / 100;
			pro_form = 100 / cant_dom_req;

			var val_fin = min_width_pro * pro_form;

			return val_fin;
		}

		//pone todos en 0
		$(".form-control").attr('pasoValida',0);

		$(".form-control").focus(function(event) {
			
			if ( $(this).attr('pasoValida') == 0 ) {
				//$(this).attr('pasoValida',1);
			};
		});

		

		$(".form-control").change(function(event) {
			/* Act on the event */
			pro_form_cont = 100 / cant_dom_req;

			var control_ant = '';
			var control_act = '';

			//identificar el control en el que esta
			console.log($(this))
			console.log($(this)[0]["value"])
			console.log($(this)[0]["required"])
			console.log($(this)[0]["type"])

			if(($(this)[0]["value"]=="") && ($(this)[0]["required"] == true)){
	            
	            //pone el estilo rojo	            

	            var padre = $(this).parent();

	            var abuelo = padre.parent();

	            console.log(abuelo);

	            abuelo.attr('class', 'form-group has-error has-feedback');

	            padre.children('span').remove();

	            $(this).after('<span class="glyphicon glyphicon-remove form-control-feedback validaRemove" aria-hidden="true"></span>');


	            //$(this).focus();

	            //-----------------------------------------------------------------------------------------------------

	            
	            /*
	            if ( progreso == 0 ) {
					//console.log('ejecutelo!')
					console.log('ya no hay que descontar!')
					
				} else{
					descontador(pro_form_cont,matematica_progress(min_width));
				};*/

				/*
				if ( ($(this).attr('pasoValida') == 0) && (progreso < 100) ) {
					//console.log('ejecutelo!')
					$(this).attr('pasoValida',1);
					//descontador(pro_form_cont,matematica_progress(min_width));
				} else if ( ($(this).attr('pasoValida') == 0) && (progreso > 0) ){
					
					//console.log('ya paso!')
					//descontador(pro_form_cont,matematica_progress(min_width));					
				}else if ( ($(this).attr('pasoValida') == 1) && (progreso > 0) ){
					
					console.log('ya paso!')
					descontador(pro_form_cont,matematica_progress(min_width));					
				}else if ( ($(this).attr('pasoValida') == 1) && (progreso == 100) ){
					
					//console.log('no hay nada que descontar!')
					//contador(pro_form_cont,matematica_progress(min_width));
					descontador(pro_form_cont,matematica_progress(min_width));					
				};*/

				/**/
				if (  ( (progreso > 0) || (progreso == 100) ) && ($(this).val() == "") ) {
					$(this).attr('pasoValida',0);
					descontador(pro_form_cont,matematica_progress(min_width));
				};				
				//-----------------------------------------------------------------------------------------------------


	          }else if ( ($(this)[0]["value"]!="") && ($(this)[0]["required"] == true) ){
	            
	            //pone el estilo verde
	            
	            var padre = $(this).parent();

	            var abuelo = padre.parent();

	            //console.log(abuelo);

	            abuelo.attr('class', 'form-group has-success has-feedback');

	            console.log(padre.children('span').remove());

	            $(this).after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');

	            //-----------------------------------------------------------------------------------------------------
	            /*
	            if ( ($(this).attr('pasoValida') == 0) && (progreso < 100) ) {
					//console.log('ejecutelo!')
					$(this).attr('pasoValida',1);
					contador(pro_form_cont,matematica_progress(min_width));
				} else if ( ($(this).attr('pasoValida') == 1) && (progreso == 0) ){
					
					console.log('ya paso!')
					contador(pro_form_cont,matematica_progress(min_width));					
				}else if ( ($(this).attr('pasoValida') == 1) && (progreso > 0) ){
					
					console.log('ya paso!')
					contador(pro_form_cont,matematica_progress(min_width));					
				}else if ( ($(this).attr('pasoValida') == 1) && (progreso == 100) ){
					
					console.log('no hay nada que contar!')
					//contador(pro_form_cont,matematica_progress(min_width));					
				};*/
				

				if ( ( (progreso == 0) || (progreso < 100) ) && ($(this).attr('pasoValida') == 0) ) {
					$(this).attr('pasoValida',1);
					contador(pro_form_cont,matematica_progress(min_width));
				}else if ( ( (progreso == 0) || (progreso < 100) ) && ($(this).attr('pasoValida') == 1) ) {
					
				};

				//contador(pro_form_cont,matematica_progress(min_width));	
				
				//-----------------------------------------------------------------------------------------------------

	          }

		});
	};

})(jQuery);