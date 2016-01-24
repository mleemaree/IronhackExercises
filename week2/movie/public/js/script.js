
	$('#loader').width($('.grid').width());
	$('#loader').height($('.grid').height());
	$('#loader').addClass("loading");

jQuery(window).on('load', function(){
	$(document).ready(function(){
		var $grid = $('.grid').masonry({
		  columnWidth: 350,
		  gutter: 20,
		  isAnimated: true,
		  fitWidth:true
		});

		$grid.masonry('layout');

		
		});
		$('.poster-container').imagesLoaded().done(function(){

		$('#loader').removeClass("loading");
	});

});