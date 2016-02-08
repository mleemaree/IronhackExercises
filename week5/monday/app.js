$(function(){

	var phrases = [
		"Ohh yea, you gotta get schwifty.",
		"Yea... If you spend all day shuffling words around you can make anything sound bad... ",
		"Awww, bitch!",
		"That's planning for failure, even dumber than regular planning.",
		"Yeah, just don't do it.",
		"Don't even trip, dawg.",
		"Earth scientist Jerry Smith has made an amazing discovery!",
		"Sometimes science is more art then science. Lot of people don't get that."
	];

	var newp = [];


	var line = function(){
		var phrase_index = Math.floor(Math.random() * phrases.length);
		var indexes = [];
		indexes.push(phrase_index);
		indexes.filter(
         function(a){if (!this[a]) {this[a] = 1; return a;}},
         {}
        );
        console.log(indexes);
		$('#old').append('<li>' + phrases[indexes[0]] + '</li>');
	}

	line();

	$('button').click(function(){
		$('#old>li').remove();
		line();
	});

	$('#input').keydown(function(e) {
	    if (e.keyCode == 13) {
	    	var hey = $('#input').submit();
	    	var values = $('#input').val();
	    	newp.push(values);
	    	new_phrases();
	    	$('#input').attr('value', "");
	    	$('#writer').empty();
	    	return false;
	     }
	});

	var new_phrases = function(){
		$('#new>li').remove();
		if(newp !== []){
			for(var i = 0; i < newp.length; i++){
				$('#new').append('<li>' + newp[i] + '<span class="remove glyphicon glyphicon-remove"></span></li>');
				$('.remove').click(function(){
					$(this).parent().remove();
					newp.splice(newp.indexOf(this),1);
					console.log(newp);
					return false;
				});
			}
		}
	}

	$('#input').keypress(function(e){
		$('#writer').html($('#input').val());
	});

	

});