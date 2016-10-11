(function(){
	/*
	este script es llamado desde el inicio
	permite la ejecucion de estas fucniones en cualquier parte
	gracias a la declaracion self-- esto permite mantenerme DRY
	*/
	self.saludo_global = function(){
		console.log('Esto es un saludo desde cualquier parte?')
	}

	self.date;
	date = new Date();
	date = date.getFullYear() + '-' +
	    ('00' + (date.getMonth()+1)).slice(-2) + '-' +
	    ('00' + date.getDate()).slice(-2);

	console.log(date);

	self.color_campo = function (selector){
		$("#"+selector).css('border', '2px solid red');
	}

})();