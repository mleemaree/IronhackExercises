$(function(){


var phrases = [
"",
"Ohh yea, you gotta get schwifty.",
"Yea... If you spend all day shuffling words around you can make anything sound bad... ",
"Awww, bitch!"
];

var i = 0;
$('button').click(function(e){
	i++;
	$('ul').append('<li>' + phrases[i] + '</li>');
	if(i >= phrases.length - 1){
		i=0;
	}
});





});