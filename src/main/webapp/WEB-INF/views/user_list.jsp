<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of users</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        #roleList {
            list-style: none;
            padding-inline-start: 0;
        }

        #roleList li {
            display: inline;
        }

        #roleList li:after {
            content: ", ";
        }

        #roleList li:last-child:after{
            content: "";
        }

        .panel{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@ include file="admin_header.jsp" %>
    <div class="content-wrapper">
        <section class="content">
            <div class="container col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h3 class="panel-title">List of Users</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Roles</th>
                                        <th>Action</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td class="info">${user.id}</td>
                                            <td class="info">${user.username}</td>
                                            <td class="info">
                                                <ul id="roleList">
                                                    <c:forEach items="${user.roles}" var="role">
                                                        <li>${role.roleName}</li>
                                                    </c:forEach>
                                                </ul>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/view-user?username=${user.username}"><i class="fa fa-eye"></i></a>
                                                <a href="${pageContext.request.contextPath}/edit-user?username=${user.username}"><i class="fa fa-edit"></i></a>
                                                <c:if test="${!user.hasRole('admin')}">
                                                    <a href="${pageContext.request.contextPath}/delete-user?username=${user.username}"><i class="fa fa-trash"></i></a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
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