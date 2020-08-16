<!DOCTYPE html>
<html>
<head>
  <title>Access Denied Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <style>
        a{
            text-decoration: underline;
        }
        .page-breadcrumb{
            list-style: none;
        }
    </style>
</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb row">
        <li>
            <i class="fa fa-home"></i>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/401">unauthorized</a>
        </li>
    </ul>
</div>
<div class="container-fluid">
    <div class="col-md-12">
        <div class=" number">
            <h1>${errorMap.status}!! Access Denied </h1>
        </div>
        <div class=" details">

            <h3>${errorMap.message}</h3>
            <p>
                Need permission?<br/>
                <a href="${pageContext.request.contextPath}/#contact"> Please contact admin.</a>
            </p>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>