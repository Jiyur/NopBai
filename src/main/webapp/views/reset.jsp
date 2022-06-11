<%@ page import="csrf.CSRF" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String csrfToken= null;
    try {
        csrfToken = CSRF.getToken();
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    javax.servlet.http.Cookie cookie=new javax.servlet.http.Cookie("csrfToken",csrfToken); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="/assets/css/reset.css"></link>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<c:choose>
    <c:when test="${requestScope.message == 'Error send mail'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'error',
                text: 'Lỗi gửi mail.'
            })
        </script>
    </c:when>

    <c:when test="${requestScope.message == 'Email is does not exist'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'warning',
                text: 'Email không tồn tại.'
            })
        </script>
    </c:when>
</c:choose>
<div class="elelment">
    <div id="elelment-ID" class="element-main">
        <h1>Quên mật khẩu</h1>
        <p>Bạn có thể đặt lại mặt khẩu ở đây.</p>
        <form action="/resetServlet" method="post">
            <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
            <input type="hidden" name="action" value="emailReset">
            <input type="email" name="email" placeholder="Your e-mail address" required>
            <input type="submit" value="Continue">
        </form>
        <br>
        <a class="come-back" href="/Login2Servlet?action=checkUser">
            Trở lại
        </a>
    </div>
</div>
</body>
</html>