<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        .bg-register-image{
            background: url(img/master.jpg) center;
            background-size:cover;
        }
    </style>
</head>

<body class="bg-primary">
<%@include file="header.jsp"%>
<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form:form modelAttribute="crmUser" method="post" action="/registration">
                            <c:if test="${registrationError != null}">
                                <div class="alert alert-danger">
                                    <span><c:out value="${registrationError}"/></span>
                                </div>
                            </c:if>
                            <fieldset>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:input class="form-control" placeholder="First Name" path="firstName" type="text" required="required"/>
                                    </div>
                                    <div class="col-sm-6">
                                        <form:input class="form-control" placeholder="Last Name" path="lastName" type="text" required="required"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter your email" path="email" type="email" required="required"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Username" path="username" type="text" required="required"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Password" path="password" type="password" required="required"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Re-type Password" path="confirmPassword" type="password" required="required"/>
                                </div>
                                <button class="btn btn-block btn-primary" type="submit">Register</button>
                            </fieldset>
                        </form:form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="${pageContext.request.contextPath}/login">Already have an account? Login!</a>
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