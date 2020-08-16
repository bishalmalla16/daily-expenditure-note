$(function () {

    var $expenditures = $('#expenditures');
    var expenditureTemplate = $('#expenditureTemplate').html();
    var $searchId = $('#searchId');
    var $startDate = $('#startDate');
    var $endDate = $('#endDate');
    var $maxRows = $('#maxRows');

    var maxRows;
    if($maxRows.val() == null)
        maxRows = 20;
    else
        maxRows = $maxRows.val();

    function addExpenditure(expenditure){
        $expenditures.append(Mustache.render(expenditureTemplate, expenditure));
    }


    function myPagination(rowNum, totalPages, myUrl){
        $('.pagination').html('');
        var trNum = 0;
        var totalPage = totalPages;
        var maxRows = rowNum;
        var url = myUrl;

        if(totalPage>1){
            $('.pagination').append("<li data-page='prev' class='page-item'><button class='page-link'><i class='fa fa-backward'></i> Previous</button></li>");
            for (var i=1;i<=totalPage;i++){
                $('.pagination').append("<li data-page='" + i + "' class='page-item'><button class='page-link'> " + i + "</button></li>");
            }
            $('.pagination').append("<li data-page='next' class='page-item'><button class='page-link'>Next <i class='fa fa-forward'></i></button></li>");
        }

        var $current = $('.pagination li:first-child+');
        $current.addClass('active');
        $('.pagination li').on('click', function () {
            $expenditures.empty();
            var pageNum = $(this).attr("data-page");
            if(pageNum == 'prev'){
                if($current.attr("data-page") == '1'){
                    pageNum = 1;
                }else{
                    $current = $current.prev();
                    pageNum = $current.attr("data-page");
                }
            }
            else if(pageNum == 'next'){
                if($current.attr("data-page")== totalPage){
                    pageNum = totalPage;
                }else{
                    $current = $current.next();
                    pageNum = $current.attr("data-page");
                }
            }
            else{
                $current = $(this);
            }
            $('.pagination li').removeClass('active');
            $current.addClass('active');


            if (url.includes('page')){
                url = url.substring(0, url.indexOf('page='));
                url = url + 'page=' + pageNum;
            }else
                url = url + '&page=' + pageNum;

            var sumTotal = 0;
            $.ajax({
                type: 'GET',
                url: url,
                success: function (data) {
                    $.each(data.content, function (i, expenditure) {
                        addExpenditure(expenditure);
                        sumTotal = sumTotal + expenditure.price;
                    });
                    $expenditures.append("<tr align=\"right\" style=\"font-weight: bold\">\n" +
                        "                        <td colspan=\"2\">Total</td>\n" +
                        "                        <td>" + sumTotal + "</td>\n" +
                        "                    </tr>");
                },
                error: function () {
                    alert('Error loading expenditures');
                }
            });
        });
    }



    $maxRows.on('change', function () {
        maxRows = $(this).val();
        var myUrl = generateUrl();
        getExpenditures(myUrl);
    });



    function getExpenditures(url){
        var sumTotal = 0;
        $expenditures.empty();
        $.ajax({
            type: 'GET',
            url: url,
            success: function (data) {
                if(data.content == "") {
                    $('.pagination').html('');
                    $expenditures.append("<tr class='alert-info'><td colspan='4'> Empty List of Expenditures </td></tr>");
                }else {
                    $.each(data.content, function (i, expenditure) {
                        addExpenditure(expenditure);
                        sumTotal = sumTotal + expenditure.price;
                    });
                    $expenditures.append("<tr align=\"right\" style=\"font-weight: bold\">\n" +
                        "                        <td colspan=\"2\">Total</td>\n" +
                        "                        <td>" + sumTotal + "</td>\n" +
                        "                    </tr>");
                    myPagination(maxRows, data.totalPages, url);
                }
            },
            error: function () {
                alert('Expenditures not found.');
            }
        });
    }

    var currentDate = new Date();
    var startDate = new Date(currentDate.getFullYear(),currentDate.getMonth(),1);
    var endDate = new Date(currentDate.getFullYear(),currentDate.getMonth()+1,0);

    //at the start of home page
    getExpenditures('/expenditures?startDate=' + startDate.toDateString() + '&endDate=' + endDate.toDateString());

    //for item search
    $searchId.keyup(function () {
        var myUrl = generateUrl();
        getExpenditures(myUrl);
    });

    function generateUrl(){
        var myUrl;

        if($startDate.val()=='' && $endDate.val()=='')
            myUrl = ('/expenditures?item=' + $searchId.val() + '&size=' + maxRows);
        else if ($startDate.val() == '')
            myUrl = ('/expenditures?item=' + $searchId.val() + '&endDate=' + $endDate.val() + '&size=' + maxRows);
        else if ($endDate.val() == '')
            myUrl = ('/expenditures?item=' + $searchId.val() + '&startDate=' + $startDate.val() + '&size=' + maxRows);
        else
            myUrl = ('/expenditures?item=' + $searchId.val() + '&startDate=' + $startDate.val() + '&endDate=' + $endDate.val() + '&size=' + maxRows);

        return myUrl;
    }

    //for filter by date
    $('#filter').on('click', function () {
        $searchId.val('');
        var myUrl = generateUrl();
        getExpenditures(myUrl);
    });


});