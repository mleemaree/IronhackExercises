(function(){
	window.Spotify = window.Spotify || {};

	var Album = function(attr){
		this.songs = []
		this._attrs = attr;
	}

	Album.prototype.render = function(cont){
		var that = this;
		var stripped = this._attrs.name.replace(/\s+/g, '-').replace(/[^a-zA-Z-]/g, '').toLowerCase();
		var container = $('<div>').attr({ id: stripped + '-artist-info'});
		var album_name = $('<div>', { id: stripped }).text(this._attrs.name);
		var album_image = $('<img />', { src: this._attrs.images[1].url, class: "single-album-info" });
		var song_list = $('<ul>').attr({ id: stripped + '-songs' });
		container.append([album_name, album_image, song_list]);
		$(album_image).on('click',function(){
			that.fetchSongs();
		});
		var artist_list = $('<div>', { class: stripped });
		artist_list.append(container);
		return [album_name, album_image,song_list];
	}


	Album.prototype.renderSongs = function(){
		var strip = this._attrs.name.replace(/\s+/g, '-').replace(/[^a-zA-Z-]/g, '').toLowerCase();
		var song_list = $('#' + strip + '-songs' );
		this.songs.forEach(function(song){
			var s = song.render();
			song_list.append(s);
		});
	}


	Album.prototype.addSongs = function(response){
		var that = this;
		response.items.forEach(function(item){
			var new_song = new Spotify.Song(item);
			that.songs.push(new_song);
		});
		this.renderSongs();
	}



	Album.prototype.fetchSongs = function(){
		var that = this;	
		var request = $.get('https://api.spotify.com/v1/albums/' + this._attrs.id +'/tracks');
		function success (response) {
			that.addSongs(response);
		}
		request.done(success);
	}

	window.Spotify.Album = Album;

})();