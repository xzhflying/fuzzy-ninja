$(document).on('ready page:load', function() {
  if ($('#datetimepicker').length) {
    $('#datetimepicker').datetimepicker({
      format: 'YYYY-MM-DD hh:mm:ss'
    });
  }
});
