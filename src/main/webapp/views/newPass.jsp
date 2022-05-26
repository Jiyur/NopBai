<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Password</title>
    <link rel="stylesheet"href="/assets/css/reset.css"></link>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        var time = 5;
        var page = "/views/login.jsp";
        function countDown() {
            time--;
            gett("timecount").innerHTML = time;
            if (time == 1) {
                window.location.pathname = page;
            }
        }
        function gett(id) {
            if (document.getElementById)
                return document.getElementById(id);
            if (document.all)
                return document.all.id;
            if (document.layers)
                return document.layers.id;
            if (window.opera)
                return window.opera.id;
        }
        function init() {
            if (gett('timecount')) {
                setInterval(countDown, 1000);
                gett("timecount").innerHTML = time;
            } else {
                setTimeout(init, 50);
            }
        }
        document.onload = init();
    </script>
</head>
<body>
<c:if test="${requestScope.message == 'unduplicated'}">
    <script type="text/javascript">
        Swal.fire({
            icon: 'error',
            text: 'Mật khẩu không giống nhau.'
        })
    </script>
</c:if>
<div class="elelment">
    <div id="elelment-ID" class="element-main">
        <h1>Đặt lại mật khẩu mới</h1>
        <p>Đặt lại mật khẩu mới để tiếp tục đăng nhập</p>
        <form action="/resetServlet" method="post">
            <input type="hidden" name="action" value="newPass">
            <input type="text" name="password" placeholder="Mật khẩu" required>
            <input type="text" name="confirmPass" placeholder="Nhập lại mật khẩu" required>
            <input type="submit" value="Thay đổi">
        </form>
        <br>
        <a class="come-back" href="/views/reset.jsp">Trở lại</a>
        <c:if test="${requestScope.message == 'success'}">
            <p>
                <a href="/views/login.jsp">
                    Bấm vào đây
                </a>
                để chuyển đến trang đăng nhập hoặc trang sẽ tự chuyển sau <span id="timecount"></span> giây!
            </p>
        </c:if>
    </div>
</div>
</body>
</html>