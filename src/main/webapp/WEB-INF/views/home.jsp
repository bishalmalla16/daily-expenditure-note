<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/expenditureTable.js"></script>
    <script type="text/javascript" src="js/expenditure.js"></script>
    <script type="text/javascript" src="js/mustache.js"></script>
    <script type="text/javascript" src="js/myDatepicker.js"></script>

</head>

<body id="page-top">
<%@ include file="header.jsp"%>

<main>
    <div class="container my-5">
        <div class="card-body text-center">
            <h2 class="card-title">List of Expenditures</h2>
        </div>

        <div class="card-body">
            <div class="input-group form-group" style="width: 200px">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-search"></i></span>
                </div>
                <input class="form-control" id="searchId" type="text" placeholder="Quick Search">
            </div>

            <div class="form-group form-inline filter">
                <div class="form-group date col-md-4" id="startDatePicker">
                    <label>Start Date:</label>
                    <div class="input-group">
                        <input type="text" id="startDate" class="form-control" placeholder="dd/mm/yyyy"/>
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group date col-md-4" id="endDatePicker">
                    <label>End date:</label>
                    <div class="input-group">
                        <input type="text" id="endDate" class="form-control" placeholder="dd/mm/yyyy"/>
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>

                <input class="btn btn-primary" type="button" id="filter" value="Search">
            </div>
        </div>

        <div class="form-group form-inline col-md-6">
            <label for="maxRows">Show </label>
            <select class="form-control" id="maxRows">
                <option disabled selected>*</option>
                <option value="2">2</option>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="20">20</option>
            </select>
            <span>Entries</span>
        </div>
        <div class="text-right">
            <button id="add__new__expenditure" type="button" class="btn btn-success" onclick="clearExpenditureModal()" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fa fa-plus"></i> Add a new Expenditure </button>
        </div>
        <div class="card">

            <table id="spendTable" class="table">
                <thead>
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">Items</th>
                    <th scope="col" class="text-right">Price</th>
                    <th scope="col" class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody id="expenditures">


                    <template id="expenditureTemplate">
                        <tr>
                            <td>{{date}}</td>
                            <td>{{item}}</td>
                            <td class="text-right">{{price}}</td>
                            <td class="text-center">
                                <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/edit-expenditures?id={{id}}"><i class="fa fa-edit"></i> Edit</a>
                                <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/delete-expenditures?id={{id}}"><i class="fa fa-trash"></i> Delete</a>
                            </td>
                        </tr>
                    </template>
                    <tr align="right" style="font-weight: bold">
                        <td colspan="2">Total</td>
                        <td><c:out value="${sumTotal}"/></td>
                    </tr>
                </tbody>
            </table>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">

                </ul>
            </nav>
        </div>


        <!-- Large modal -->
        <div class="modal fade bd-example-modal-lg" id="myModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="card-body text-center">
                        <h4 class="card-title">Add Expenditure</h4>
                    </div>
                    <div class=" card col-8 offset-2 my-2 p-3">
                        <form:form action="/expenditures" method="post" modelAttribute="expenditure" onsubmit="return validateExpenditure()">

                            <form:hidden path="user" value="${currentUser.id}"/>
                            <div class="form-group date" id="datePicker">
                                <label>Date</label>
                                <div class="input-group">
                                    <form:input type="text" class="form-control" id="dbDate" path="date" placeholder="dd/mm/yyyy"/>
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                                <span class="text-danger" id="dateRequired">Date of purchase is required.</span>
                            </div>
                            <div class="form-group">
                                <label>Item</label>
                                <form:input  type="text" class="form-control" id="item" path="item" placeholder="Enter the Item" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <form:input type="number" class="form-control" id="price" path="price" placeholder="Enter the price"/>
                                <span class="text-danger" id="priceRequired">Price must be greater than 0.</span>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>