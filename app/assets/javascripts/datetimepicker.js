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
  var lastFieldClicked;

  $('.datepicker-days').hide();
  $('.timepicker').hide();


  $('#date-select').on('click', function(event) {
      lastFieldClicked = 'date';
      $('.datepicker-days').toggle();
    });
  $('#time-select').on('click', function(event) {
      lastFieldClicked = 'time';
      $('.timepicker').toggle();
    });


  $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('MM/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      if (lastFieldClicked == 'date') {
        var formatted_date = event.date.format('DD MMM YYYY');
        $('#date-select').empty();
        $('#date-select').append('Le: ' + "<br/>" + formatted_date);
        $('.datepicker-days').toggle(false);
      }
    });

 $('#datetimepicker12').on('dp.change', function(event) {
      // console.log(moment(event.date).format('M M/DD/YYYY h:mm a'));
      // console.log(event.date.format('MM/DD/YYYY h:mm a'));
      if (lastFieldClicked == 'time') {
        var formatted_date = event.date.format('HH:mm');
        $('#time-select').empty();
        $('#time-select').append('À: ' + "<br/>" + formatted_date);
        $('.timepicker').toggle(false);
      }
    });

});

