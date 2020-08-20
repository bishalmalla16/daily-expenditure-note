<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <%@ include file="admin_header.jsp"%>
<%--    <!-- Navbar -->--%>
<%--    <nav class="main-header navbar navbar-expand navbar-white navbar-light">--%>
<%--        <!-- Left navbar links -->--%>
<%--        <ul class="navbar-nav">--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>--%>
<%--            </li>--%>
<%--            <li class="nav-item d-none d-sm-inline-block">--%>
<%--                <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item d-none d-sm-inline-block">--%>
<%--                <a href="${pageContext.request.contextPath}/#contact" class="nav-link">Contact</a>--%>
<%--            </li>--%>
<%--        </ul>--%>


<%--        <!-- Right navbar links -->--%>
<%--        <ul class="navbar-nav ml-auto">--%>
<%--            <!-- Messages Dropdown Menu -->--%>
<%--            <li class="nav-item dropdown">--%>
<%--                <a class="nav-link" data-toggle="dropdown" href="#">--%>
<%--                    <i class="far fa-comments"></i>--%>
<%--                    <span class="badge badge-danger navbar-badge">3</span>--%>
<%--                </a>--%>
<%--                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">--%>
<%--                    <a href="#" class="dropdown-item">--%>
<%--                        <!-- Message Start -->--%>
<%--                        <div class="media">--%>
<%--                            <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">--%>
<%--                            <div class="media-body">--%>
<%--                                <h3 class="dropdown-item-title">--%>
<%--                                    Brad Diesel--%>
<%--                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>--%>
<%--                                </h3>--%>
<%--                                <p class="text-sm">Nice platform...</p>--%>
<%--                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Message End -->--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item">--%>
<%--                        <!-- Message Start -->--%>
<%--                        <div class="media">--%>
<%--                            <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">--%>
<%--                            <div class="media-body">--%>
<%--                                <h3 class="dropdown-item-title">--%>
<%--                                    John Pierce--%>
<%--                                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>--%>
<%--                                </h3>--%>
<%--                                <p class="text-sm">I got your message bro</p>--%>
<%--                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Message End -->--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item">--%>
<%--                        <!-- Message Start -->--%>
<%--                        <div class="media">--%>
<%--                            <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">--%>
<%--                            <div class="media-body">--%>
<%--                                <h3 class="dropdown-item-title">--%>
<%--                                    Nora Silvester--%>
<%--                                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>--%>
<%--                                </h3>--%>
<%--                                <p class="text-sm">My expenditure note</p>--%>
<%--                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Message End -->--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <!-- Notifications Dropdown Menu -->--%>
<%--            <li class="nav-item dropdown">--%>
<%--                <a class="nav-link" data-toggle="dropdown" href="#">--%>
<%--                    <i class="far fa-bell"></i>--%>
<%--                    <span class="badge badge-warning navbar-badge">6</span>--%>
<%--                </a>--%>
<%--                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">--%>
<%--                    <span class="dropdown-item dropdown-header">6 Notifications</span>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item">--%>
<%--                        <i class="fas fa-envelope mr-2"></i> 4 new messages--%>
<%--                        <span class="float-right text-muted text-sm">3 mins</span>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item">--%>
<%--                        <i class="fas fa-users mr-2"></i> 2 new users--%>
<%--                        <span class="float-right text-muted text-sm">12 hours</span>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-divider"></div>--%>

<%--                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>--%>
<%--                </div>--%>
<%--            </li>--%>

<%--        </ul>--%>
<%--    </nav>--%>
<%--    <!-- /.navbar -->--%>

<%--    <!-- Main Sidebar Container -->--%>
<%--    <aside class="main-sidebar sidebar-dark-primary elevation-4">--%>
<%--        <!-- Brand Logo -->--%>
<%--        <a href="index3.html" class="brand-link">--%>
<%--            <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"--%>
<%--                 style="opacity: .8">--%>
<%--            <span class="brand-text font-weight-light">Admin Panel</span>--%>
<%--        </a>--%>

<%--        <!-- Sidebar -->--%>
<%--        <div class="sidebar">--%>
<%--            <!-- Sidebar user panel (optional) -->--%>
<%--            <div class="user-panel mt-3 pb-3 mb-3 d-flex">--%>
<%--                <div class="image">--%>
<%--                    <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <a href="#" class="d-block"><c:out value="${subject.principal}"/></a>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Sidebar Menu -->--%>
<%--            <nav class="mt-2">--%>
<%--                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">--%>
<%--                    <!-- Add icons to the links using the .nav-icon class--%>
<%--                         with font-awesome or any other icon font library -->--%>
<%--                    <li class="nav-item">--%>
<%--                        <a href="${pageContext.request.contextPath}/admin" class="nav-link active">--%>
<%--                            <i class="nav-icon fas fa-tachometer-alt"></i>--%>
<%--                            <p>--%>
<%--                                Dashboard--%>
<%--                            </p>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a href="${pageContext.request.contextPath}/roles" class="nav-link">--%>
<%--                            <i class="nav-icon fas fa-tasks"></i>--%>
<%--                            <p>--%>
<%--                                Add Roles--%>
<%--                                <span class="right badge badge-danger">New</span>--%>
<%--                            </p>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item has-treeview">--%>
<%--                        <a href="#" class="nav-link">--%>
<%--                            <i class="nav-icon fas fa-copy"></i>--%>
<%--                            <p>--%>
<%--                                Layout Options--%>
<%--                                <i class="fas fa-angle-left right"></i>--%>
<%--                                <span class="badge badge-info right">2</span>--%>
<%--                            </p>--%>
<%--                        </a>--%>
<%--                        <ul class="nav nav-treeview">--%>
<%--                            <li class="nav-item">--%>
<%--                                <a href="#" class="nav-link">--%>
<%--                                    <i class="far fa-circle nav-icon"></i>--%>
<%--                                    <p>Top Navigation</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>

<%--                            <li class="nav-item">--%>
<%--                                <a href="#" class="nav-link">--%>
<%--                                    <i class="far fa-circle nav-icon"></i>--%>
<%--                                    <p>Collapsed Sidebar</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a href="${pageContext.request.contextPath}/users" class="nav-link">--%>
<%--                            <i class="nav-icon fas fa-user"></i>--%>
<%--                            <p>--%>
<%--                                User Details--%>
<%--                            </p>--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </nav>--%>
<%--            <!-- /.sidebar-menu -->--%>
<%--        </div>--%>
<%--        <!-- /.sidebar -->--%>
<%--    </aside>--%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Admin Dashboard</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li class="breadcrumb-item active">Admin Dashboard</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>${totalRoles}</h3>
                                <p>Roles</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-tasks"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>${averageExpenditures}</h3>

                                <p>Average Data</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>${totalUsers}</h3>

                                <p>Active Users</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>${usersTillDate}</h3>

                                <p>Users Registration</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->


                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-7 connectedSortable">

                        <!-- TO DO List -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="ion ion-clipboard mr-1"></i>
                                    To Do List
                                </h3>

                                <div class="card-tools">
                                    <ul class="pagination pagination-sm">
                                        <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <ul class="todo-list" data-widget="todo-list">
                                    <li>
                                        <!-- drag handle -->
                                        <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <!-- checkbox -->
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo1" id="todoCheck1">
                                            <label for="todoCheck1"></label>
                                        </div>
                                        <!-- todo text -->
                                        <span class="text">Design a nice theme</span>
                                        <!-- Emphasis label -->
                                        <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
                                        <!-- General tools such as edit or delete-->
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                    <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo2" id="todoCheck2" checked>
                                            <label for="todoCheck2"></label>
                                        </div>
                                        <span class="text">Make the theme responsive</span>
                                        <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                    <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo3" id="todoCheck3">
                                            <label for="todoCheck3"></label>
                                        </div>
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="badge badge-warning"><i class="far fa-clock"></i> 1 day</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                    <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo4" id="todoCheck4">
                                            <label for="todoCheck4"></label>
                                        </div>
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="badge badge-success"><i class="far fa-clock"></i> 3 days</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                    <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo5" id="todoCheck5">
                                            <label for="todoCheck5"></label>
                                        </div>
                                        <span class="text">Check your messages and notifications</span>
                                        <small class="badge badge-primary"><i class="far fa-clock"></i> 1 week</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                    <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                                        <div  class="icheck-primary d-inline ml-2">
                                            <input type="checkbox" value="" name="todo6" id="todoCheck6">
                                            <label for="todoCheck6"></label>
                                        </div>
                                        <span class="text">Let theme shine like a star</span>
                                        <small class="badge badge-secondary"><i class="far fa-clock"></i> 1 month</small>
                                        <div class="tools">
                                            <i class="fas fa-edit"></i>
                                            <i class="fas fa-trash"></i>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <button type="button" class="btn btn-info float-right"><i class="fas fa-plus"></i> Add item</button>
                            </div>
                        </div>
                        <!-- /.card -->
                    </section>
                    <!-- /.Left col -->

                </div>
                <!-- /.row (main row) -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    
    <%@ include file="footer.jsp"%>

</div>
<!-- ./wrapper -->


</body>
</html>
