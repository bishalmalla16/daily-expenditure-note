<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update expenditure</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script>
        $(function () {
            $('#datePicker').datepicker({
                format: 'yyyy/mm/dd',
                endDate: '+0d',
                autoclose: true
            }).datepicker('setDate', new Date($('#dbDate').val()));
        });
    </script>

</head>
<body>
<%@ include file="header.jsp" %>
<main>
<div class="container col-md-6">
    <div class="row">
        <div class="modal-content">
            <div class="card-body text-center">
                <h4 class="card-title">Update Expenditure</h4>
            </div>
            <div class=" card col-8 offset-2 my-2 p-3">
                <form:form action="/expenditures" method="post" modelAttribute="expenditure" onsubmit="return validateExpenditure()">

                    <form:hidden path="user" value="${currentUser.id}"/>
                    <div class="form-group">
                        <label>Id</label>
                        <form:input type="number" class="form-control" path="id" readonly="true"/>
                    </div>
                    <div class="form-group date" id="datePicker">
                        <label>Date</label>
                        <div class="input-group">
                            <form:input type="text" id="dbDate" class="form-control" path="date" placeholder="dd/mm/yyyy"/>
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                        <span class="text-danger" id="dateRequired">Date of purchase is required.</span>
                    </div>
                    <div class="form-group">
                        <label>Item</label>
                        <form:input  type="text" id="item" class="form-control" path="item" placeholder="Enter the Item" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <form:input type="number" id="price" class="form-control" path="price" placeholder="Enter the price"/>
                        <span class="text-danger" id="priceRequired">Price must be greater than 0.</span>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="footer.jsp" %>
<script type="text/javascript" src="js/expenditure.js"></script>

</body>
</html>