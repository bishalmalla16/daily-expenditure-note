<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shiro Login Page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .bg-login-image{
            background: url(img/master.jpg) center;
            background-size:cover;
        }
    </style>
</head>

<body class="bg-primary">
<%@ include file="header.jsp" %>
<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form action="" method="POST" accept-charset="UTF-8" role="form">
                                    <fieldset>
<%--                                        <c:if test="${param.error}">--%>
<%--                                            <p>Abcd</p>--%>
<%--                                        </c:if>--%>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Username" name="username" type="text">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Password" name="password" type="password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <input class="btn btn-block btn-primary" type="submit" value="Login">
                                    </fieldset>
                                </form>
                                <hr>
<%--                                <div class="text-center">--%>
<%--                                    <a class="small" href="forgot-password.html">Forgot Password?</a>--%>
<%--                                </div>--%>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/register">Create an Account!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
<%@include file="footer.jsp"%>
</body>
</html>