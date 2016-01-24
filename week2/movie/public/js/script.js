jQuery(window).on('load', function(){

	var $grid = $('.grid').masonry({
	  columnWidth: 350,
	  gutter: 20,
	  isAnimated: true,
	  fitWidth:true
	});
$grid.masonry('layout');

});