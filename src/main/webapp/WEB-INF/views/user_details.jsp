<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
<%@ include file="header.jsp" %>
<main>
<div class="container col-md-6">
    <div class="row">
        <div class="modal-content">
            <div class="card-body text-center">
                <h4 class="card-title">User Profile</h4>
            </div>
            <div class=" card col-8 offset-2 my-2 p-3">
                <form:form action="/edit-user" method="post" modelAttribute="user">

                    <div class="form-group">
                        <label>Id</label>
                        <form:input type="number" class="form-control" path="id" readonly="true"/>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <form:label path="firstName">First Name</form:label>
                            <form:input class="form-control" path="firstName" type="text" readonly="true"/>
                        </div>
                        <div class="col-sm-6">
                            <form:label path="lastName">Last Name</form:label>
                            <form:input class="form-control" path="lastName" type="text" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <form:input type="email" class="form-control" path="email" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <form:input type="text" class="form-control" path="username" readonly="true"/>
                    </div>

                    <div class="form-group form-row">
                        <label>Roles</label>
                        <ul class="list-group col-md-6">
                            <c:forEach items="${user.roles}" var="role">
                                <li class="list-group-item">${role.roleName}</li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="form-group text-center">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Back</a>
                        <a href="${pageContext.request.contextPath}/edit-user?username=${user.username}" class="btn btn-primary">Edit</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>