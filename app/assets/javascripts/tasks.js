$(document).ready(function() {
  $('.checkmark').click(function(event) {
    $('this').closest('input').prop('checked', true);
  });
});