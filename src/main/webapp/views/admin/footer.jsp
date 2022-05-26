<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</body>
</html>

