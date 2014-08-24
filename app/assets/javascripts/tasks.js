$(document).ready(function() {
  $('.checkmark').click(function(event) {
    $(this).closest('input').prop('checked', true);
  });
  $('.tasks-list').sortable({
      placeholder: "ui-state-highlight",
      axis: "y",
      update: function( event, ui ) {
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
      }
    });
});