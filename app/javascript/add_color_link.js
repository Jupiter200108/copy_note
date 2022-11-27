$(function(){
  var link = $('.folders_link');
  var currentUrl = location.pathname;
  link.each(function() {
    if ($(this).attr("href") == currentUrl) {
      $(this).addClass("add_color_current_link");
    }
  })
});