$(document).on('mouseenter', '.carousel', function() {
  $('.carousel').carousel( {
  	interval: 3000
  });
});

$(document).on('mouseover', '.carousel', function() {
  $('.carousel').carousel('pause');
});

$(document).on('mouseleave', '.carousel', function() {
  $('.carousel').carousel('cycle');
});