(function(){

	window.Spotify = window.Spotify || {};

	var Song = function(attr){
		this._attrs = attr;
	}

	Song.prototype.render = function(){
		var song_name = $('<li>').append(this._attrs.name);
		return song_name;
	}

	window.Spotify.Song = Song;

})();