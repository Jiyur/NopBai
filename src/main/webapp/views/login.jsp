<%@ page import="src.pages.foodweb.userInterface.csrf.CSRF" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String csrfToken= null;
    try {
        csrfToken = CSRF.getToken();
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    javax.servlet.http.Cookie cookie=new javax.servlet.http.Cookie("csrfToken",csrfToken);
    cookie.setHttpOnly(true);
    response.addCookie(cookie);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login2.css"></link>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet", href="/assets/css/common.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        header .logo{
            font-size: 30px !important;
        }

        header .icons{
            font-size: 200% !important;
        }
    </style>
</head>
<body>

<%@include file="/common/header.jsp"%>

<div>
    <div class="login-reg-panel" style="margin-top: 400px">
        <div class="login-info-box">
            <h2>Have an account?</h2>
            <p>To keep connected with us please login with your personal info</p>
            <label id="label-register" for="log-reg-show">Login</label>
            <input type="radio" name="active-log-panel" id="log-reg-show" checked="checked">
        </div>

        <div class="register-info-box">
            <h2>Don't have an account?</h2>
            <p>Enter your personal details and start journey with us</p>
            <label id="label-login" for="log-login-show">Register</label>
            <input type="radio" name="active-log-panel" id="log-login-show">
        </div>

        <div class="white-panel">
            <div class="login-show">
                <h2>LOGIN</h2>
                <c:if test="${not empty requestScope.message}">
                    <script>
                        Swal.fire({
                            icon: 'warning',
                            text: 'Wrong email or password'
                        })
                    </script>
                </c:if>
                <form name="checkUser" action="/Login2Servlet" method="post">
                    <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                    <input type="email" placeholder="Email" name="email" required>
                    <input type="password" placeholder="Password" name="password" required pattern="\S+.*">
                    <input type="submit" value="Login">
                    <a href="views/reset.jsp">Forgot password?</a>
                </form>
            </div>
            <div class="register-show">
                <h2>REGISTER</h2>
                <form>
                    <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                    <input id="Email" type="email" placeholder="Email" name="registerEmail" required>
                    <input type="password" placeholder="Password" name="registerPassword" required pattern="\S+.*">
                    <input type="text" placeholder="Code" name="code">
                    <div class="register_submid">
                        <div>
                            <input id="sendCodeSubmit" type="submit" name="sendCodeSubmit" value="sendCode">
                        </div>
                        <div>
                            <input id="registerSubmid" type="submit" name="registerSubmid" value="Register">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="/common/footer.jsp"%>
<script>
    $(document).ready(function () {
        // Bắt sự kiện khi người dùng click vào button
        $('#sendCodeSubmit').click(function (e) {
            // Ngăn không cho load lại trang
            e.preventDefault();
            let getEmail = $('input[name="registerEmail"]').val(),
                getPass = $('input[name="registerPassword"]').val();
            getAction = $('input[name="sendCodeSubmit"]').val();
            Swal.fire({
                html: 'Please wait...',
                allowEscapeKey: false,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading()
                }
            });
            $.ajax({
                url: '/RegisterServlet',
                type: 'POST',
                data: {
                    email: getEmail,
                    pass: getPass,
                    action: getAction
                },
                // Nếu thành công thì hiển thị kết quả ra trình duyệt
                success: function (response) {
                    swal.close();
                    if(response == "Email or password"){
                        Swal.fire({
                            icon: 'warning',
                            text: response + ' is not empty'
                        })
                    }
                    if(response == "Check email"){
                        Swal.fire({
                            icon: 'success',
                            text: 'We have sent you the code'
                        })
                    }

                    if(response == "Erro send mail"){
                        Swal.fire({
                            icon: 'error',
                            text: 'Please click send code to receive the code back'
                        })
                    }

                    if(response == "Fail"){
                        Swal.fire({
                            icon: 'error',
                            text: 'Email already exists'
                        })
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
    $(document).ready(function () {
        $('#registerSubmid').click(function (e) {
            e.preventDefault();
            let getEmail = $('input[name="registerEmail"]').val(),
                getPass = $('input[name="registerPassword"]').val(),
                getCode = $('input[name="code"]').val(),
                getAction = $('input[name="registerSubmid"]').val();
            Swal.fire({
                html: 'Please wait...',
                allowEscapeKey: false,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading()
                }
            });
            $.ajax({
                url: '/RegisterServlet',
                type: 'POST',
                data: {
                    email: getEmail,
                    pass: getPass,
                    code: getCode,
                    action: getAction
                },
                success: function (response) {
                    swal.close();
                    if(response == "Success"){
                        Swal.fire({
                            icon: 'success',
                            text: 'Register Success'
                        })
                    }
                    if(response == "Fail"){
                        Swal.fire({
                            icon: 'error',
                            text: 'Email already exists'
                        })
                    }

                    if(response == "Code" || response == "Email or password"){
                        Swal.fire({
                            icon: 'warning',
                            text: response + ' is not empty'
                        })
                    }
                    if(response == "Erro Code"){
                        Swal.fire({
                            icon: 'warning',
                            text: 'Wrong code'
                        })
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script>
<script type="text/javascript">

    $(document).ready(function(){
        $('.login-info-box').fadeOut();
        $('.login-show').addClass('show-log-panel');
    });

    $('.login-reg-panel input[type="radio"]').on('change', function() {
        if($('#log-login-show').is(':checked')) {
            $('.register-info-box').fadeOut();
            $('.login-info-box').fadeIn();

            $('.white-panel').addClass('right-log');
            $('.register-show').addClass('show-log-panel');
            $('.login-show').removeClass('show-log-panel');

        }
        else if($('#log-reg-show').is(':checked')) {
            $('.register-info-box').fadeIn();
            $('.login-info-box').fadeOut();

            $('.white-panel').removeClass('right-log');

            $('.login-show').addClass('show-log-panel');
            $('.register-show').removeClass('show-log-panel');
        }
    });

    $(".alert-dismissible").fadeTo(2000, 500).slideUp(500, function(){
        $(".alert-dismissible").alert('close');
    });
</script>
</body>
</html>