$(function () {
    var currentDate = new Date();
    var startDate = new Date(currentDate.getFullYear(),currentDate.getMonth(),1);
    var endDate = new Date(currentDate.getFullYear(),currentDate.getMonth()+1,0);

    $('#datePicker').datepicker({
        format: 'yyyy/mm/dd',
        endDate: '+0d',
        autoclose: true
    }).datepicker('setDate','today');

    $('#startDatePicker').datepicker({
        format: 'yyyy/mm/dd',
        autoclose: true
    });
    $('#endDatePicker').datepicker({
        format: 'yyyy/mm/dd',
        autoclose: true
    });
    $('#startDatePicker').on('changeDate', function(){
        // set the "toDate" start to not be later than "fromDate" ends:
        var setStartDate = new Date($('#startDate').val());
        $('#endDatePicker').datepicker('setStartDate', new Date(setStartDate.getFullYear(), setStartDate.getMonth(), setStartDate.getDate()+1));
    }).datepicker('setDate', startDate);

    $('#endDatePicker').on('changeDate', function(){
        var setEndDate = new Date($('#endDate').val());
        // set the "fromDate" end to not be later than "toDate" starts:
        $('#startDatePicker').datepicker('setEndDate', new Date(setEndDate.getFullYear(), setEndDate.getMonth(), setEndDate.getDate()-1));
    }).datepicker('setDate', endDate);
});