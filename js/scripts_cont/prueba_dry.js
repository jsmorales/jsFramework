//-----------------------------------------------------------------------------
//practica clase en js
function persona (nombre){
	this.nombre = nombre;
	this.saludar = function(){
		console.log('Hola me llamo '+this.nombre);
		this.saludo2();
	}
}

var johan = new persona("johan");

/*Se puede añadir metodos y llamarlos antes de ser declarados
solo si se hace sobre una instancia, se le añade a esa instancia 
en este caso el objeto johan
*/

johan.saludo2 = function(){
	console.log('saludando nuevamente...');
};

johan.saludar();

/*para añadir metodos o elementos globales se hace
asi:
*/

persona.prototype.saludo3 = function(){
	console.log('Este es el tercer saludo...*');
}

var angela = new persona("angela");

/*funciona en los dos casos porque es una funcion añadida
globalmente.
*/

angela.saludo3();

johan.saludo3();

//console.log(johan.__proto__);

/*como leer y definir propiedades getters y setters
*/
//se tiene el objeto curso

var curso = {
	titulo: "Curso 1",
	videos: 19,
	tutor_valor: "Johan",
	get tutor(){
		//controla como se muestra el valor de tutor
		return this.tutor_valor;
	},
	set tutor(tutor){
		//controla como definir el valor tutor
		if( tutor === "" || ( typeof tutor === "undefined")){
			return;
		}
		this.tutor_valor = tutor;
	}
}

//antes:
//curso.setTutor("Angela");
//despues:
curso.tutor = "Angela";
//se comporta como si se hubiese definido una funcion especial
//para este propósito.

//se esta invocando al setter de tutor que realmente está manipulado el atributo tutor_valor
console.log(curso.tutor);
//-----------------------------------------------------------------------------


(function(){

	self.var_saluda = function(){

		console.log('Estoy saludando mejor?');
	}

})();


var clase_dry = {

	nombre:'johan',
	apellido:'morales',
	saludar:function(){
		console.log('Hola soy el objeto '+this.nombre+' '+this.apellido)
	}
}

function color_campo(selector){
	$("#"+selector).css('border', '2px solid red');
}

function validarEmail( email , selector ) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(email) ){
    	$("#"+selector).css('border', '2px solid red');
    	return false;
    }else{
    	$("#"+selector).css('border', '2px solid green');
    	return true;
    }	    
}

