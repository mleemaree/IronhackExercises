var Viking = require('./viking.js');
var Saxxon = require('./saxxon.js');

var Pit = function(viking1, viking2){

	for(var i=0; i <10; i++){
		if (viking1.health <= 21 || viking2.health <= 21) { break; }
		var hit =  (Math.floor(Math.random() * 11)) * viking2.strength;
		viking1.health -= hit;
		var hit =  (Math.floor(Math.random() * 11)) * viking1.strength;
		viking2.health -= hit;
		console.log("\n------------\n" + "ROUND " + (i+1));
		console.log(viking1.name + ' = ' + viking1.health);
		console.log(viking2.name + ' = ' + viking2.health);
		console.log("\n------------\n");
	}
	if(viking1.health > viking2.health){
		if(viking1.strength < 11){
			viking1.strength++
		}
		console.log(viking1.name.toUpperCase() + " WINS!!!\n His strength is now:" + viking1.strength);
	}else{
		if(viking2.strength < 11){
			viking2.strength++
		}
		console.log(viking2.name.toUpperCase() + " WINS!!!\n His strength is now:" + viking2.strength);
	}
}

var ben = new Viking("ben", 100, 2);
var tom = new Viking("tom", 100, 2);
var adam = new Saxxon();

var match = new Pit(ben, tom);
