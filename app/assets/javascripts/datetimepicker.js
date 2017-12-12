$(function () {
  $('#datetimepicker12').datetimepicker({
    inline: true,
    sideBySide: true
  });
  $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      var formatted_date = event.date.format('YYYY-MM-DD hh:mm');
      $('#hdp').val(formatted_date);
    });
});

