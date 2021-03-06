$(function () {
  $('#datetimepicker12').datetimepicker({
    inline: true,
    sideBySide: true,
    useCurrent: false
  });
  $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      var formatted_date = event.date.format('YYYY-MM-DD HH:mm');
      $('#hdp').val(formatted_date);
    });
});


$( document ).ready(function() {


  var last_field_clicked = '';

  $('.datepicker-days').hide();
  $('.timepicker').hide();


  $('#date-select').on('click', function(event) {
      last_field_clicked = 'date';
      $('.datepicker-days').toggle();
    });
  $('#time-select').on('click', function(event) {
      last_field_clicked = 'time';
      $('.timepicker').toggle();
    });


  $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      if (last_field_clicked == 'date') {
        var formatted_date = event.date.format('DD MMM YYYY');
        $('#date-select').empty();
        $('#date-select').append('Le: ' + "<br/>" + formatted_date);
        $('#date-select').removeClass('color-totor-light-gray');
        $('.datepicker-days').toggle(false);

      }
    });

 $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('M M/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      if (last_field_clicked == 'time') {
        var formatted_date = event.date.format('HH:mm');
        $('#time-select').empty();
        $('#time-select').append('À: ' + "<br/>" + formatted_date);
        $('#time-select').removeClass('color-totor-light-gray');
        // $('.timepicker').toggle(false);
      }
    });

});

