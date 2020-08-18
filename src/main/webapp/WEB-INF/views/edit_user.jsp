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

    <style>
        #roleList{
            margin-left: auto;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<main>
<div class="container col-md-6">
    <div class="row">
        <div class="modal-content">
            <div class="card-body text-center">
                <c:if test="${subject.principal.equals(user.username)}">
                    <h4 class="card-title">Edit your Profile</h4>
                </c:if>
                <c:if test="${!subject.principal.equals(user.username)}">
                    <h4 class="card-title">Edit User's Roles</h4>
                </c:if>
            </div>
            <div class=" card col-8 offset-2 my-2 p-3">
                <form:form action="/edit-user" method="post" modelAttribute="user">
                    <c:if test="${registrationError != null}">
                        <div class="alert alert-danger">
                            <span><c:out value="${registrationError}"/></span>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label>Id</label>
                        <form:input type="number" class="form-control" path="id" readonly="true"/>
                    </div>
                    <c:if test="${currentUser.id == user.id}">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <form:label path="firstName">First Name</form:label>
                                <form:input class="form-control" placeholder="First Name" path="firstName" type="text" required="required"/>
                            </div>
                            <div class="col-sm-6">
                                <form:label path="lastName">Last Name</form:label>
                                <form:input class="form-control" placeholder="Last Name" path="lastName" type="text" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <form:input type="email" class="form-control" path="email" placeholder="Enter your email" required="required"/>
                        </div>
                        <div class="form-group">
                            <label>Username</label>
                            <form:input type="text" class="form-control" path="username" placeholder="Enter username" required="required"/>
                        </div>
                    </c:if>
                    <c:if test="${currentUser.id != user.id}">
                        <form:hidden path="firstName"/>
                        <form:hidden path="lastName"/>
                        <form:hidden path="email"/>
                        <form:hidden path="username"/>
                    </c:if>
                    <form:hidden path="password"/>

                    <shiro:lacksRole name="admin">
                        <form:hidden path="roles"/>
                        <div class="form-group form-row">
                            <label>Roles</label>
                            <ul class="list-group col-md-6">
                                <c:forEach items="${user.roles}" var="role">
                                    <li class="list-group-item">${role.roleName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </shiro:lacksRole>

                    <shiro:hasRole name="admin">
                        <div class="form-group form-row">
                            <label>Roles</label>
                            <div class="col-md-10" id="roleList">
                                <c:forEach items="${roleList}" var="role">
                                    <form:checkbox path="roles" value="${role}"/> ${role.roleName.toUpperCase()}
                                    <br/>
                                </c:forEach>
                            </div>

                        </div>
                    </shiro:hasRole>


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
</body>
</html>