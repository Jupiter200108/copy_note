$(document).on('turbolinks:load', function() {
  $('.new-form-trigger,.close-icon-area,.closed-form-btn').on('click', function(event) {
    $(this).toggleClass('active');
    $('.new-form').fadeToggle();
    event.preventDefault();
  });
});