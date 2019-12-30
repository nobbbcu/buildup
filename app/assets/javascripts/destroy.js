$(function() {
  $('#pre_destroy').on('click', function() {
    $('.destroy').fadeIn();
  });

  $('#cancel').on("click", function() {
    $('.destroy').fadeOut();
  });
});