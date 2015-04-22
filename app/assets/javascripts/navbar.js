$(document).ready(function() {
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 220) {
      $(".navbar-wagon").css({
        "background": "rgba(200, 200, 200, 0.9)",
      });
    }
    else {
      $(".navbar-wagon").css({
        "background": "transparent",
      });
    }
  });
});