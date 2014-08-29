$(document).ready(function() {
  $('.checkmark').click(function(event) {
    $(this).closest('input').prop('checked', true);
  });
  $('.tasks-list').sortable({
      placeholder: "ui-state-highlight",
      axis: "y",
      handle: ".drag",
      update: function( event, ui ) {
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
        $(this).find("li").each(function(index, el) {
          $(this).attr("data-position", index+1)
        });
      }
    });
});