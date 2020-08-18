<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Role</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <%@ include file="admin_header.jsp" %>
    <div class="content-wrapper">
        <section class="content">
            <div class="container col-md-4">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Add a new Role</h3>
                            </div>
                            <div class="panel-body">
                                <form:form modelAttribute="role" method="post" action="/register-role">
                                    <fieldset>
                                        <div class="form-group">
                                            <form:input cssClass="form-control" type="text" path="roleName" placeholder="Role Name"/>
                                        </div>
                                        <div style="width: 100%; height: 100px">
                                            <div style="width: 30%; float: left">
                                                <span class="input-group-text">Permission(s): </span>
                                            </div>
                                            <div style="width: 70%; float: right; text-align: left; padding-left: 20px">
                                                <form:checkbox path="permissions" value="user:view"/>user:view<br/>
                                                <form:checkbox path="permissions" value="user:*"/>user:*<br/>
                                                <form:checkbox path="permissions" value="book:read"/>book:read<br/>
                                                <form:checkbox path="permissions" value="book:*"/>book:*
                                            </div>
                                        </div>

                                        <input class="btn btn-success" type="submit" value="Save">
                                        <a href="${pageContext.request.contextPath}/admin" class="btn btn-primary">Cancel</a><br/>
                                    </fieldset>
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>