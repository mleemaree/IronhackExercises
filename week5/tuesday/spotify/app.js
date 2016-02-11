$(function(){

	var container = $('.artist-info');
	var manager = new Spotify.ArtistManager(container);

	var album_container =

	$('#artist-search-submit').click(function(){
		manager.fetchArtists();
	});





})//end of document.ready


