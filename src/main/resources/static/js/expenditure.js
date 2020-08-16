function clearExpenditureModal() {
    $('#item').val('');
    $('#price').val('0');
    $('#datePicker').datepicker('setDate','today');
    $('#dateRequired').hide();
    $('#priceRequired').hide();
}

function validateExpenditure() {
    $('#dateRequired').hide();
    $('#priceRequired').hide();

    var date = $('#dbDate').val();
    if(date.length < 1){
        $('#dateRequired').show();
        return false;
    }

    var price = $('#price').val();
    if(price < 1){
        $('#priceRequired').show();
        return false;
    }
    return true;

}

$(function(){
    $('#dateRequired').hide();
    $('#priceRequired').hide();

    $('#myButton').on('click', function () {
       $('#myTextField').append("<li>Hello fdggfg World</li>");
    });
});
