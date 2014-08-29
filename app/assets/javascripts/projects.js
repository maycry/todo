$(document).ready(function() {

  $(".create-project-form .field input").keyup(function(event) {
    $.ajax({
        type: post,
        url: your_url,
        data: your_data,
        success: function(data) {
          // Handle stuff after hitting the server here
        },
        error: function(data) {
        }
      });
  });

});