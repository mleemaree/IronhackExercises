(function(){
	window.Spotify = window.Spotify || {};

	var ArtistManager = function(container){
		this.artists = [];
		this.container = container;
	}


	ArtistManager.prototype.render = function(){
		var that = this;
		this.artists.forEach(function(artist){
			var strip = artist._attrs.name.replace(/\s+/g, '-').replace(/[^a-zA-Z-]/g, '').toLowerCase();
			var band = artist.render();
			var artist_list = $('<div>', { class: strip });
			artist_list.append(band);
			this.container.append(artist_list);
		}, this);
	}

	ArtistManager.prototype.addArtists= function(artist_list){
		var artistManager = this;
		artist_list.forEach(function(art){
			var artist = new Spotify.Artist(art);
			this.artists.push(artist);
		}.bind(this));
		this.render()
	}

	ArtistManager.prototype.fetchArtists = function(){
		var that = this;
		that.artists.length = 0;
		$('#artist-search').submit(function(e){
			e.preventDefault();
			var search =  $('#search-input').val();
			var request = $.get('https://api.spotify.com/v1/search?type=artist&query=' + search);
			function success (response) {
				$('.artists').empty();
				that.addArtists(response.artists.items)
				$('#search-input').prop('value', '');
			}
			request.done(success);
		});
	}

	window.Spotify.ArtistManager = ArtistManager;

})();