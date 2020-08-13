<!DOCTYPE html>
<html>
<head>
    <title>Shiro Login Page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>

<body>

<div class="container">
<form action="" method="POST" accept-charset="UTF-8" role="form">
    <input class="form-control" placeholder="Username" name="username" type="text">
     <input class="form-control" placeholder="Password" name="password" type="password">
    <input type="checkbox" class="custom-control-input" id="customCheck">
      <input class="btn btn-block btn-primary" type="submit" value="Login">
</form>
<div class="text-center">
        <a class="small" href="${pageContext.request.contextPath}/register">Create an Account!</a>
</div>
</div>

</body>
</html>