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

    <link rel="stylesheet" href="<c:url value="/admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css"/>">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Preloader -->
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
                                <a href="<c:url value="/admin/cate"/>" class="nav-link active">
                                    <i class="fas fa-list nav-icon"></i>
                                    <p>Quản lý danh mục</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<c:url value="/admin/food"/>" class="nav-link">
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
                        <h1>Danh mục</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Danh mục</li>
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
                            <div class="card-header">
                                <div style="display: flex;align-items: center">
                                    <h3 class="card-title">Danh mục các món ăn</h3>
                                    <button style="margin-left: auto" type="button" class="btn btn-success"
                                            data-toggle="modal" data-target="#cateAdd">Thêm danh mục
                                    </button>

                                </div>
                                <div class="modal fade" id="cateAdd" tabindex="-1" role="dialog"
                                     aria-labelledby="cateAddLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="cateAddLabel">Thêm danh mục</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="cate/add" method="post">
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
                                                            <label for="cateName">Tên danh mục</label>
                                                            <input type="text" id="cateName" name="cateName"
                                                                   class="form-control" placeholder="Món mới">
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
                                <table id="example1" class="table table-bordered table-striped table-hover ">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Hình ảnh</th>
                                        <th>Tên</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày cập nhật</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="cate" items="${listCate}">
                                        <tr>
                                            <td><c:out value="${cate.id}"/></td>
                                            <td><c:out value="${cate.cate_image}"/></td>
                                            <td><c:out value="${cate.cate_name}"/></td>
                                            <td><c:out value="${cate.created_at}"/></td>
                                            <td><c:out value="${cate.updated_at}"/></td>
                                            <td>
                                                <div style="display:flex;align-items: center;justify-content: space-around;margin-top: 5px">
                                                    <a class="fas fa-pencil-alt" style="color: black;cursor: pointer"
                                                       data-toggle="modal"
                                                       data-target="#cateDetail<c:out value="${cate.id}" />"></a>
                                                    <a class="fas fa-trash-alt" style="cursor: pointer"
                                                       href="${pageContext.request.contextPath}/removeCate?cateID=${cate.id}"></a>
                                                </div>


                                                <!-- Modal -->
                                                <div class="modal fade" id="cateDetail<c:out value="${cate.id}" />"
                                                     tabindex="-1" role="dialog"
                                                     aria-labelledby="cateDetailLabel<c:out value="${cate.id}" />"
                                                     aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title"
                                                                    id="cateDetailLabel<c:out value="${cate.id}" />">
                                                                    Thông tin chi tiết danh mục</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="cate/update" method="post">
                                                                    <div class="card-body">
                                                                        <div class="form-group">
                                                                            <div class="profile-images-card">
                                                                                <div class="profile-images">
                                                                                <img class="img-fluid pad profile-images"
                                                                                     id="imgUpdate"
                                                                                     src="<c:url value="${cate.cate_image}"/>"
                                                                                     alt="Photo">
                                                                                </div>
                                                                            </div>
                                                                            <div class="custom-file">
                                                                                <label for="fileuploadUpdate">Tải lên
                                                                                    hình ảnh</label>
                                                                                <input type="file" id="fileuploadUpdate"
                                                                                       name="fileuploadUpdate"
                                                                                       multiple>
                                                                                <div style="display: flex;align-items: center;justify-content: center;margin-top: 5px">
                                                                                </div>
                                                                                <input id="urlImageUpdate"
                                                                                       name="urlImageUpdate"
                                                                                       style="display: none" value="">
                                                                                <input id="cateIdUpdate"
                                                                                       name="cateIdUpdate"
                                                                                       style="display: none" value="<c:out value="${cate.id}"/>">
                                                                            </div>



                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="cateNameUpdate">Tên danh
                                                                                mục</label>
                                                                            <input type="text" class="form-control"
                                                                                   id="cateNameUpdate" name="cateNameUpdate"
                                                                                   value="<c:out value="${cate.cate_name}" />">
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

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Thumbnail</th>
                                        <th>Name</th>
                                        <th>Created At</th>
                                        <th>Updated At</th>
                                        <th>Actions</th>
                                    </tr>
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
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>

<%--<script src="../../plugins/toastr/toastr.min.js"></script>--%>
<%--<script src="<c:url value="/admin/plugins/sweetalert2/sweetalert2.min.js"/>"></script>--%>


<script>
    $(function () {
        function strtrunc(str, max, add) {
            add = add || '...';
            return (typeof str === 'string' && str.length > max ? str.substring(0, max) + add : str);
        };
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
            'columnDefs': [
                {
                    'targets': 1,
                    'render': function (data, type, full, meta) {
                        if (type === 'display') {
                            data = strtrunc(data, 20);
                        }

                        return data;
                    }
                }
            ]

        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
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
        $("#fileuploadUpdate").change(async function (event) {
            var x = await URL.createObjectURL(event.target.files[0]);
            await $("#imgUpdate").attr("src", x);
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
                                    document.getElementById("urlImageUpdate").value = downloadURL;
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
    var files = [];
    document.getElementById("fileupload").addEventListener("change", function (e) {
        files = e.target.files;
        for (let i = 0; i < files.length; i++) {
            console.log(files[i]);
        }
    });

    document.getElementById("send").addEventListener("click", function () {
        //checks if files are selected
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
                                //alert(downloadURL)
                            });
                    },
                );
            }
        } else {
            alert("Vui lòng chọn hình ảnh");
        }
    });

</script>
<script>
    $(function () {
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        $('.swalDefaultSuccess').click(function () {
            setTimeout(function () {
                Toast.fire({
                    icon: 'success',
                    title: 'Tải hình ảnh lên thành công'
                })
            }, 1000);


        });
        //
        // $('#urlImage').change(function() {
        //     Toast.fire({
        //         icon: 'success',
        //         title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
        //     })
        // })

    });
</script>
</body>
</html>
