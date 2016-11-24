# jquery_controllerV2.js
Plugin controlador de CRUDs para jsFramework Versión-2.

<br>

<h3>Ajustes por defecto:</h3>

tipo:'nuevo', //tipo de instancia<br>
action:'insertar', //accion a realizar el botón<br>
tipo_load:1, //tipo de carga puede ser 1(normal) o 2(especificando el form)<br>
objt_f:'', //objeto del formulario<br>
id : '', //id del registro de BD<br>
subida : false, //si sube o no archivos<br>
recarga : true, //si recarga o no la pagina despues de cada accion (sirve para debug)<br>
//------------------------<br>
//ajustes del form/modulo<br>
nom_modulo:'', //el nombre del modulo usado<br>
titulo_label:'', //titulo de la ventana del modal<br>
nom_tabla:'', //nombre de la tabla en la BD<br>
//-----------------------------------------------------------------<br>

//-----------------------------------------------------------------<br>
//CallBacks            
functionAfter:function(data){<br>               
    console.log('Ejecutando luego de Cualquier cosa!!!');<br>                
},<br>            
functionBefore:function(ajustes){<br>                
    console.log('Ejecutando antes de cualquier cosa!!!');<br>                
}<br>
<hr>
//-----------------------------------------------------------------<br>

<br>

<p>Ejemplo set del plugin boton:</p>
<br>
$("#btn_xxx").jquery_controllerV2({<br>
  		tipo:'inserta/edita',<br> 
  		titulo_label:'Nuevo Contenido'<br> 
  		nom_modulo:'contenido',<br>
  		nom_tabla:'contenido',<br>
  		subida:true,<br>
  		recarga:true,<br>  		
  		functionAfter:function(data){<br>               
          console.log('Ejecutando luego de Cualquier cosa!!!');<br>                
      },<br>            
      functionBefore:function(ajustes){<br>                
          console.log('Ejecutando antes de cualquier cosa!!!');<br>                
      },<br>
});<br>

