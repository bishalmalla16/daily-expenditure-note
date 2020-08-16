<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Expenditure Note</title>

    <!-- Font Awesome Icons -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS - Includes Bootstrap -->
    <link href="css/creative.min.css" rel="stylesheet">


</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Expenditure Note</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto my-2 my-lg-0">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#services">Services</a>
                </li>
                <shiro:guest>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/login">SignIn</a>
                    </li>
                </shiro:guest>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                </li>
                <shiro:user>
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle js-scroll-trigger" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${subject.principal}"/>
                            <img class="img-profile rounded-circle" style="height: 25px; width: 25px" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <shiro:hasRole name="admin">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin">
                                    <i class="fas fa-tachometer-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Admin Panel
                                </a>
                            </shiro:hasRole>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/view-user?username=${subject.principal}">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/edit-user?username=${subject.principal}">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Edit Details
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </shiro:user>
            </ul>
        </div>
    </div>
</nav>

<!-- Masthead -->
<header class="masthead">
    <div class="container h-100">
        <div class="row h-100 align-items-center justify-content-center text-center">
            <div class="col-lg-10 align-self-end">
                <h1 class="text-uppercase text-white font-weight-bold">Your Favorite Place to store all your daily expenditures.</h1>
                <hr class="divider my-4">
            </div>
            <div class="col-lg-8 align-self-baseline">
                <p class="text-white-75 font-weight-light mb-5">You can store and view your expenditures here based on dates. </p>
                <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
            </div>
        </div>
    </div>
</header>

<!-- About Section -->
<section class="page-section bg-primary" id="about">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="text-white mt-0">We've got what you need!</h2>
                <hr class="divider light my-4">
                <p class="text-white-50 mb-4">This application has everything you need to store your daily expenditures, know your daily spent, and make some savings out of it.</p>
                <shiro:guest>
                    <a class="btn btn-light btn-xl js-scroll-trigger" href="${pageContext.request.contextPath}/register">Get Started!</a>
                </shiro:guest>
                <shiro:user>
                    <a class="btn btn-light btn-xl js-scroll-trigger" href="${pageContext.request.contextPath}/home">Get Started!</a>
                </shiro:user>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="page-section" id="services">
    <div class="container">
        <h2 class="text-center mt-0">At Your Service</h2>
        <hr class="divider my-4">
        <div class="row">

            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
                    <h3 class="h4 mb-2">Up to Date</h3>
                    <p class="text-muted mb-0">All expenditures that are stored are kept up-to-date to keep things fresh.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <i class="fas fa-4x fa-peace text-primary mb-4"></i>
                    <h3 class="h4 mb-2">User Friendly</h3>
                    <p class="text-muted mb-0">You can use this platform to store your own expenditures by creating an account!</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <i class="fas fa-4x fa-user-edit text-primary mb-4"></i>
                    <h3 class="h4 mb-2">Easy to Use</h3>
                    <p class="text-muted mb-0">You can easily note your daily expenditures in mean time.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="page-section" id="contact">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h2 class="mt-0">Let's Get In Touch!</h2>
                <hr class="divider my-4">
                <p class="text-muted mb-5">Ready to start your experience with us? Give us a call or send us an email and we will get back to you as soon as possible!</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                <div>(+977) 9812345678</div>
            </div>
            <div class="col-lg-4 mr-auto text-center">
                <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                <!-- Make sure to change the email address in anchor text AND the link below! -->
                <a class="d-block" href="mailto:bishalmalla16@gmail.com">bishalmalla16@gmail.com</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>


<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/creative.min.js"></script>

</body>

</html>
