$(function () {
  $('#datetimepicker12').datetimepicker({
    inline: true,
    sideBySide: true
  });
  $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      var formatted_date = event.date.format('YYYY-MM-DD HH:mm');
      $('#hdp').val(formatted_date);
    });
});


$( document ).ready(function() {
  $('.datepicker-days').hide();
  $('.timepicker').hide();


  $('#date-select').on('click', function(event) {
      $('.datepicker-days').toggle();
    });
  $('#time-select').on('click', function(event) {
      $('.timepicker').toggle();
    });


  $('#datetimepicker12').on('dp.change', function(event) {
      $('#date-select').empty();
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      var formatted_date = event.date.format('YYYY-MM-DD');
      $('#date-select').append(formatted_date);
    });

 $('#datetimepicker12').on('dp.change', function(event) {
      $('#time-select').empty();
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      var formatted_date = event.date.format('HH:mm');
      $('#time-select').append(formatted_date);
    });







});

