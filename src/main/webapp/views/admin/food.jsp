<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="<c:url value="/admin/plugins/fontawesome-free/css/all.min.css"/>">

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
          href="<c:url value="/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/dist/css/adminlte.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>">

    <%--    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">--%>
    <link rel="stylesheet" href="<c:url value="/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>">
    <%--    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">--%>
    <link rel="stylesheet"
          href="<c:url value="/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>">
    <%--    <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">--%>
    <link rel="stylesheet" href="<c:url value="/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/customer-upload.css"/>">


</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <%--    <!-- Preloader -->--%>
    <%--    <div class="preloader flex-column justify-content-center align-items-center">--%>
    <%--        <img class="animation__shake" src="<c:url value="/admin/dist/img/AdminLTELogo.png"/>" alt="AdminLTELogo" height="60"--%>
    <%--             width="60">--%>
    <%--    </div>--%>

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Home</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="Search"
                                   aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-comments"></i>
                    <span class="badge badge-danger navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="<c:url value="/admin/dist/img/user1-128x128.jpg"/>" alt="User Avatar"
                                 class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="<c:url value="/admin/dist/img/user8-128x128.jpg"/>" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    John Pierce
                                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">I got your message bro</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="<c:url value="/admin/dist/img/user3-128x128.jpg"/>" alt="User Avatar"
                                 class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Nora Silvester
                                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">The subject goes here</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                </div>
            </li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 4 new messages
                        <span class="float-right text-muted text-sm">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 8 friend requests
                        <span class="float-right text-muted text-sm">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 3 new reports
                        <span class="float-right text-muted text-sm">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#"
                   role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="#" class="brand-link">
            <img src="<c:url value="/admin/dist/img/AdminLTELogo.png"/>" alt="AdminLTE Logo"
                 class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="<c:url value="/admin/dist/img/user2-160x160.jpg"/>" class="img-circle elevation-2"
                         alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<c:url value="/admin/user"/>" class="nav-link">
                                    <i class="fas fa-user nav-icon"></i>
                                    <p>Quản lý khách hàng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<c:url value="/admin/cate"/>" class="nav-link">
                                    <i class="fas fa-list nav-icon"></i>
                                    <p>Quản lý danh mục</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<c:url value="/admin/food"/>" class="nav-link active">
                                    <i class="fas fa-birthday-cake nav-icon"></i>
                                    <p>Quản lý món ăn</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Đồ ăn</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Đồ ăn</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="card-header"
                                 style="display: flex;align-items: center;justify-content: space-between">
                                <h3 class="card-title">Danh sách đồ ăn</h3>
                                <button type="button" class="btn btn-success" style="margin-left: auto"
                                        data-toggle="modal" data-target="#foodAdd">Thêm món ăn
                                </button>
                                <div class="modal fade" id="foodAdd" tabindex="-1" role="dialog"
                                     aria-labelledby="foodAddLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="foodAddLabel">Thêm món ăn</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="food/add" method="post">
                                                    <div class="card-body">
                                                        <div class="form-group">
                                                            <div class="profile-images-card">
                                                                <div class="profile-images">
                                                                    <img src="<c:url value="/admin/dist/img/photo2.png"/>"
                                                                         id="upload-img">
                                                                </div>
                                                                <div class="custom-file">
                                                                    <label for="fileupload">Tải lên hình ảnh</label>
                                                                    <input type="file" id="fileupload" name="fileupload"
                                                                           multiple>
                                                                    <div style="display: flex;align-items: center;justify-content: center;margin-top: 5px">
                                                                    </div>
                                                                    <input id="urlImage" name="urlImage"
                                                                           style="display: none" value="">

                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="form-group">
                                                            <label for="cateList">Chọn danh mục:</label>
                                                            <select class="custom-select" name="cateList" id="cateList">
                                                                <c:forEach var="cate" items="${listCate}">
                                                                    <option value="<c:out value="${cate.id}" />">
                                                                        <c:out value="${cate.cate_name}" />
                                                                    </option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="foodName">Tên món ăn</label>
                                                            <input type="text" id="foodName" name="foodName"
                                                                   class="form-control" placeholder="Món mới">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="foodDes">Chi tiết</label>
                                                            <input type="text" id="foodDes" name="foodDes"
                                                                   class="form-control" placeholder="Chi tiết">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="foodPrice">Giá</label>
                                                            <input type="text" id="foodPrice" name="foodPrice"
                                                                   class="form-control" placeholder="Giá">
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Đóng
                                                        </button>
                                                        <div class=Submit>
                                                            <button type="submit" class="btn btn-danger">Lưu</button>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Chi Tiết</th>
                                        <th>Giá</th>
                                        <th>Danh mục</th>
                                        <th>Action</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="food" items="${listFood}">
                                        <tr>
                                            <td><c:out value="${food.fid}"/></td>
                                            <td><c:out value="${food.f_name}"/></td>
                                            <td><c:out value="${food.desciprtion}"/></td>
                                            <td><c:out value="${food.price}"/> đ</td>
                                            <td><c:out value="${food.catalog.cate_name}"/></td>
                                            <td>
                                                <div style="display:flex;align-items: center;justify-content: space-around;margin-top: 5px">
                                                    <a class="fas fa-pencil-alt" style="color: black;cursor: pointer"
                                                       data-toggle="modal"
                                                       data-target="#foodDetail<c:out value="${food.fid}" />"></a>
                                                    <a class="fas fa-trash-alt" style="cursor: pointer"
                                                       href="${pageContext.request.contextPath}/removeFood?fid=${food.fid}"></a>
                                                    <div class="modal fade" id="foodDetail<c:out value="${food.fid}" />"
                                                         tabindex="-1" role="dialog"
                                                         aria-labelledby="foodDetailLabel<c:out value="${food.fid}" />"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <form action="food/update" method="post">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title"
                                                                        id="foodDetailLabel<c:out value="${food.fid}" />">
                                                                        Thông tin chi tiết danh mục</h5>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">

                                                                    <div id="carouselExampleIndicators"
                                                                         class="carousel slide" data-ride="carousel">
                                                                        <ol class="carousel-indicators">
                                                                            <li data-target="#carouselExampleIndicators"
                                                                                data-slide-to="0" class="active"></li>
                                                                            <li data-target="#carouselExampleIndicators"
                                                                                data-slide-to="1"></li>
                                                                            <li data-target="#carouselExampleIndicators"
                                                                                data-slide-to="2"></li>
                                                                        </ol>
                                                                        <div class="carousel-inner">
                                                                            <div class="carousel-item active">
                                                                                <img class="d-block w-100" src="<c:url value="${food.galleries[0].img_url}"/>">
                                                                            </div>
                                                                            <c:forEach var="galleries"
                                                                                       items="${food.galleries}">
                                                                                <div class="carousel-item">

                                                                                    <img class="d-block w-100"
                                                                                         src="<c:url value="${galleries.img_url}"/>"
                                                                                         alt="First slide">

                                                                                </div>
                                                                            </c:forEach>
<%--                                                                            <%! int fontSize; %>--%>
<%--                                                                            <%for ( fontSize = 1; fontSize <= 3; fontSize++){ %>--%>
<%--                                                                                <font color = "green" size = "<%= fontSize %>">--%>
<%--                                                                                    JSP Tutorial--%>
<%--                                                                                </font><br />--%>
<%--                                                                            <%}%>--%>
                                                                        </div>
                                                                        <a class="carousel-control-prev"
                                                                           href="#carouselExampleIndicators"
                                                                           role="button" data-slide="prev">
                                                                            <span class="carousel-control-prev-icon"
                                                                                  aria-hidden="true"></span>
                                                                            <span class="sr-only">Previous</span>
                                                                        </a>
                                                                        <a class="carousel-control-next"
                                                                           href="#carouselExampleIndicators"
                                                                           role="button" data-slide="next">
                                                                            <span class="carousel-control-next-icon"
                                                                                  aria-hidden="true"></span>
                                                                            <span class="sr-only">Next</span>
                                                                        </a>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="cateList">Chọn danh mục:</label>
                                                                        <select class="custom-select" name="cateListDetail" id="cateListDetail">
                                                                            <c:forEach var="cate" items="${listCate}">
                                                                                <option value="<c:out value="${cate.id}" />">
                                                                                    <c:out value="${cate.cate_name}" />
                                                                                </option>
                                                                            </c:forEach>

                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="foodName">Tên món ăn</label>
                                                                        <input type="text" id="foodNameDetail" name="foodNameDetail"
                                                                               value="<c:out value="${food.f_name}" />"
                                                                               class="form-control" placeholder="Món mới">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="foodDes">Chi tiết</label>
                                                                        <input type="text" id="foodDesDetail" name="foodDesDetail"
                                                                               value="<c:out value="${food.desciprtion}" />"
                                                                               class="form-control" placeholder="Chi tiết">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="foodPrice">Giá</label>
                                                                        <input type="text" id="foodPriceDetail" name="foodPriceDetail"
                                                                               value="<c:out value="${food.price}" />"
                                                                               class="form-control" placeholder="Giá">
                                                                        <input id="foodIdUpdate"
                                                                               name="foodIdUpdate"
                                                                               style="display: none" value="<c:out value="${food.fid}"/>">
                                                                    </div>

                                                                </div>
                                                                <div class="modal-footer">

                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Đóng
                                                                    </button>
                                                                    <input type="submit" value="Cập nhật"
                                                                           class="btn btn-primary">
                                                                </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#foodAddImg">Sửa ảnh</button>
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#foodAddImgUrl">Thêm ảnh</button>
                                                <div class="modal fade" id="foodAddImg" tabindex="-1" role="dialog"
                                                     aria-labelledby="foodAddLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="foodAddImgLabel">Thêm món ăn</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="food/update-img" method="post">
                                                                    <div class="card-body">
                                                                        <div class="form-group">
                                                                            <div class="profile-images-card">
                                                                                <div class="profile-images">
                                                                                    <img src="<c:url value="${food.galleries[0].img_url}"/>"
                                                                                         id="upload-update-img">
                                                                                    <input id="foodIdUpdateImg"
                                                                                           name="foodIdUpdateImg"
                                                                                           style="display: none" value="${food.galleries[0].id}"/>">
                                                                                    <input id="urlAddUpdateImage" name="urlAddUpdateImage"
                                                                                           style="display: none" value="">

                                                                                </div>
                                                                                <div class="custom-file">
                                                                                    <label for="fileuploadUpdateImg">Tải lên hình ảnh</label>
                                                                                    <input type="file" id="fileuploadUpdateImg" name="fileuploadUpdateImg"
                                                                                           multiple>
                                                                                    <div style="display: flex;align-items: center;justify-content: center;margin-top: 5px">
                                                                                    </div>

                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="galleriesListDetail">Chọn ảnh:</label>
                                                                                    <select class="custom-select" name="galleriesListDetail" id="galleriesListDetail">
                                                                                        <c:forEach var="galleriesImg" items="${food.galleries}">
                                                                                            <option value="<c:out value="${galleriesImg.img_url}" />">
                                                                                                Ảnh <c:out value="${galleriesImg.id}" />
                                                                                            </option>
                                                                                        </c:forEach>

                                                                                    </select>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Đóng
                                                                        </button>
<%--                                                                        <a href="${pageContext.request.contextPath}/removeImgFood?fid=${food.galleries[0].id}" type="button" class="btn btn-danger"--%>
<%--                                                                                >Xóa--%>
<%--                                                                        </a>--%>
                                                                        <div class=Submit>
                                                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                                                        </div>

                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="foodAddImgUrl" tabindex="-1" role="dialog"
                                                     aria-labelledby="foodAddLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="foodAddImgUrlLabel">Thêm món ăn</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="food/add-img" method="post">
                                                                    <div class="card-body">
                                                                        <div class="form-group">
                                                                            <div class="profile-images-card">
                                                                                <div class="profile-images">
                                                                                    <img src="<c:url value="/admin/dist/img/photo2.png"/>"
                                                                                         id="upload-img-add">
                                                                                </div>
                                                                                <div class="custom-file">
                                                                                    <label for="fileuploadaddimg">Tải lên hình ảnh</label>
                                                                                    <input type="file" id="fileuploadaddimg" name="fileuploadaddimg"
                                                                                           multiple>
                                                                                    <div style="display: flex;align-items: center;justify-content: center;margin-top: 5px">
                                                                                    </div>
                                                                                    <input id="urlImageadd" name="urlImageadd"
                                                                                           style="display: none" value="">

                                                                                    <input id="foodImageadd" name="foodImageadd"
                                                                                           style="display: none" value="<c:out value="${food.fid}"/>">

                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Đóng
                                                                        </button>
                                                                        <div class=Submit>
                                                                            <button type="submit" class="btn btn-primary">Thêm ảnh</button>
                                                                        </div>

                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>


    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.2.0-rc
        </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>


<!-- jQuery -->
<script src="<c:url value="/admin/plugins/jquery/jquery.min.js"/>"></script>

<!-- jQuery UI 1.11.4 -->
<script src="<c:url value="/admin/plugins/jquery-ui/jquery-ui.min.js"/>"></script>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>

<!-- Bootstrap 4 -->
<script src="<c:url value="/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<script src="<c:url value="/admin/dist/js/adminlte.js"/>"></script>

<script src="<c:url value="/admin/dist/js/pages/dashboard.js"/>"></script>

<!-- DataTables  & Plugins -->
<%--<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables/jquery.dataTables.min.js"/>"></script>
<%--<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
<%--<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"/>"></script>
<%--<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>"></script>
<%--<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"/>"></script>
<%--<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>"></script>
<%--<script src="../../plugins/jszip/jszip.min.js"></script>--%>
<%--<script src="<c:url value="/admin/plugins/jszip/jszip.min.js"/>"></script>--%>
<%--<script src="../../plugins/pdfmake/pdfmake.min.js"></script>--%>
<%--<script src="<c:url value="/admin/plugins/pdfmake/pdfmake.min.js"/>"></script>--%>
<%--<script src="../../plugins/pdfmake/vfs_fonts.js"></script>--%>
<%--<script src="<c:url value="/admin/plugins/pdfmake/vfs_fonts.js"/>"></script>--%>
<%--<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-buttons/js/buttons.html5.min.js"/>"></script>
<%--<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-buttons/js/buttons.print.min.js"/>"></script>
<%--<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>--%>
<script src="<c:url value="/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"/>"></script>

<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
<script>
    $(function () {
        $("#fileuploadUpdateImg").change(async function (event) {
            var x = await URL.createObjectURL(event.target.files[0]);
            await $("#upload-update-img").attr("src", x);
            console.log(event);

            var files = [];
            files[0] = event.target.files[0]

            if (files.length != 0) {
                //Loops through all the selected files
                for (let i = 0; i < files.length; i++) {
                    //create a storage reference
                    var storage = firebase.storage().ref(files[i].name);

                    //upload file
                    var upload = storage.put(files[i]);

                    //var storageRef = firebase.storage().ref(imageName);
                    var uploadTask = storage.put(files[i]);
                    //update progress bar
                    upload.on(
                        "state_changed",
                        function progress(snapshot) {

                        },

                        function error(e) {
                            alert(e);
                        },

                        function () {
                            uploadTask.snapshot.ref
                                .getDownloadURL()
                                .then(async function (downloadURL) {
                                    document.getElementById("urlAddUpdateImage").value = downloadURL;
                                    alert(downloadURL)
                                });
                        },
                    );
                }
            } else {
                alert("Vui lòng chọn hình ảnh");
            }

        });
    })
</script>
<script>
    $(function () {
        $("#fileupload").change(async function (event) {
            var x = await URL.createObjectURL(event.target.files[0]);
            await $("#upload-img").attr("src", x);
            console.log(event);

            var files = [];
            files[0] = event.target.files[0]

            if (files.length != 0) {
                //Loops through all the selected files
                for (let i = 0; i < files.length; i++) {
                    //create a storage reference
                    var storage = firebase.storage().ref(files[i].name);

                    //upload file
                    var upload = storage.put(files[i]);

                    //var storageRef = firebase.storage().ref(imageName);
                    var uploadTask = storage.put(files[i]);
                    //update progress bar
                    upload.on(
                        "state_changed",
                        function progress(snapshot) {

                        },

                        function error(e) {
                            alert(e);
                        },

                        function () {
                            uploadTask.snapshot.ref
                                .getDownloadURL()
                                .then(async function (downloadURL) {
                                    document.getElementById("urlImage").value = downloadURL;
                                    alert(downloadURL)
                                });
                        },
                    );
                }
            } else {
                alert("Vui lòng chọn hình ảnh");
            }

        });
    })
</script>
<script>
    $(function () {
        $("#fileuploadaddimg").change(async function (event) {
            var x = await URL.createObjectURL(event.target.files[0]);
            await $("#upload-img-add").attr("src", x);
            console.log(event);

            var files = [];
            files[0] = event.target.files[0]

            if (files.length != 0) {
                //Loops through all the selected files
                for (let i = 0; i < files.length; i++) {
                    //create a storage reference
                    var storage = firebase.storage().ref(files[i].name);

                    //upload file
                    var upload = storage.put(files[i]);

                    //var storageRef = firebase.storage().ref(imageName);
                    var uploadTask = storage.put(files[i]);
                    //update progress bar
                    upload.on(
                        "state_changed",
                        function progress(snapshot) {

                        },

                        function error(e) {
                            alert(e);
                        },

                        function () {
                            uploadTask.snapshot.ref
                                .getDownloadURL()
                                .then(async function (downloadURL) {
                                    document.getElementById("urlImageadd").value = downloadURL;
                                    alert(downloadURL)
                                });
                        },
                    );
                }
            } else {
                alert("Vui lòng chọn hình ảnh");
            }

        });
    })
</script>
<script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
        apiKey: "AIzaSyDkJrspnQGnqQr3qDpKXvYzc2tcZhlMJJk",
        authDomain: "quickstart-1614695450393.firebaseapp.com",
        projectId: "quickstart-1614695450393",
        storageBucket: "quickstart-1614695450393.appspot.com",
        messagingSenderId: "417302437279",
        appId: "1:417302437279:web:6c5a909e7cd4573dc471aa"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
</script>
<script>
    $("select").change(function() {
        //alert( this.value );
        //console.log(this.value)
        $("#upload-update-img").attr("src", this.value)
        $("#foodIdUpdateImg").value = this.text()
    });

</script>
</body>
</html>
