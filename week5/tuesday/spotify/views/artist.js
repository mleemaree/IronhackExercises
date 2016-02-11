(function(){
	window.Spotify = window.Spotify || {};

	var Artist = function(attr){
		this.albums = [];
		this._attrs = attr;
	}

	Artist.prototype.render = function(){
		var that = this;
		var stripped = this._attrs.name.replace(/\s+/g, '-').replace(/[^a-zA-Z-]/g, '').toLowerCase();
		var name = $('<h3>').text(this._attrs.name);
		if(this._attrs.images[1] !== undefined){
			var img = $('<img>', { src: this._attrs.images[1].url });
		}

		$(img).on('click',function(){
			that.fetchAlbums();
		});
		return [name,img]; 
	}

	Artist.prototype.renderAlbums = function(){
		var strip = this._attrs.name.replace(/\s+/g, '-').replace(/[^a-zA-Z-]/g, '').toLowerCase();
		var container = $('.'+ strip);
		var albums_list = $('<div>', { class: strip + '-albums-list albums'});
		this.albums.forEach(function(album){	
			var band = album.render();
			albums_list.append(band);
		});
		container.append(albums_list);

		this.render();
	}


	Artist.prototype.addAlbums = function(response){
		var that = this;
		response.items.forEach(function(item){
			var album = new Spotify.Album(item);
			that.albums.push(album);
		});
		this.renderAlbums();
	}


	Artist.prototype.fetchAlbums = function(){
		var that = this;	
		var request = $.get('https://api.spotify.com/v1/artists/' + this._attrs.id +'/albums');
		function success (response) {
			that.addAlbums(response);
		}
		request.done(success);
	}

	window.Spotify.Artist = Artist;

})();