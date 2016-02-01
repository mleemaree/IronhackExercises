function cc(message){
	toArray= message.split("");
	var decodedMessage = ""
	var letter = toArray.forEach(function(letter){
		if !/^[a-zA-Z]*$/g.test(letter){
			var	decodedLetter = (letter.charCodeAt(0) - 3);
			var complete = String.fromCharCode(decodedLetter);
		}else{
			return letter
		}



		// if (decodedLetter >= 65 && decodedLetter <= 90){
		// 	var complete = String.fromCharCode(decodedLetter);
		// }else{
		// 	return decodedLetter
		// }

	});

}

now = cc("dalksdf");