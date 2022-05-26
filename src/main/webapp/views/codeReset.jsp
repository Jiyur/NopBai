<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Code Reset</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css"></link>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<c:choose>
    <c:when test="${requestScope.message == 'Code is not correct'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'error',
                text: 'Mã không đúng'
            })
        </script>
    </c:when>

    <c:when test="${requestScope.message == 'Can not send'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'error',
                text: 'Không thể gửi mail'
            })
        </script>
    </c:when>

    <c:when test="${requestScope.message == 'sent'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'success',
                text: 'Chúng tôi đã gữi mã mới tới email của bạn.'
            })
        </script>
    </c:when>

    <c:when test="${requestScope.message == 'Can not send'}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'error',
                text: 'Lỗi gửi lại.'
            })
        </script>
    </c:when>
</c:choose>
<div class="elelment">
    <div id="elelment-ID" class="element-main">
        <h1>Vui Lòng Nhập Mã Xác Minh</h1>
        <p>Mã xác minh đã được gửi đến ${sessionScope.resetEmail}</p>
        <form action="/resetServlet"
              method="post">
            <input type="hidden" name="action" value="codeReset">
            <input type="text" name="code" placeholder="Mã Xác Minh" required>
            <input type="submit" value="Continue">
        </form>
        <br>
        <div class="a-codeReset">
            <div>
                <a class="come-back" href="${pageContext.request.contextPath}/views/reset.jsp">Trở lại</a>
            </div>

            <div>
                <a class="resendCode" href="${pageContext.request.contextPath}/resetServlet?action=resendCode">
                    Gửi lại mã
                </a>
            </div>
        </div>

    </div>
</div>
</body>
</html>