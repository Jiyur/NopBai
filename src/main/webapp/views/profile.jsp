<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thông tin cá nhân</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/assets/css/profile2.css"/>

    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/button.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/assets/css/mdb-pro.min.css">
    <link rel="stylesheet" href="/assets/css/mdb.ecommerce.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">

    <style>
        header .logo{
            font-size: 30px !important;
        }

        header .icons{
            font-size: 200% !important;
        }

        .footer .box-container{
            margin-left: 225px !important;
            grid-template-columns: repeat(auto-fit, minmax(11rem, 1fr)) !important;

        }

        .footer .credit{
            margin-left: 223px !important;
        }
    </style>

</head>

<body>

<%@include file="/common/header.jsp"%>

<div id="colorlib-page" style="margin-bottom: 100px">
    <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
    <aside style="margin-top: 88px" id="colorlib-aside" role="complementary" class="js-fullheight text-center">
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li id="info" class="colorlib-active"><a onclick="loadInfoProfile(); changeUnderline(0)">Thông tin cá nhân</a></li>
                <li id="invoice"><a onclick="loadInvoice(); changeUnderline(1)">Thông tin đơn hàng</a></li>
                <li><a href="Login2Servlet?action=deleteCookies">Đăng xuất</a></li>
            </ul>
        </nav>
    </aside>

    <div id="container" style="margin-top: 110px">
        <div id="colorlib-main">
            <div class="hero-wrap js-fullheight">
                <!-- <div class="overlay"></div> -->
                <div class="js-fullheight d-flex justify-content-center align-items-center">
                    <div id="content" class="col-md-8 text text-center">
                        <div class="img mb-4" style="background-image:url(/assets/img/profile-ava.jpg)"></div>
                        <div class="desc">
                            <h1 class="mb-4">${user.name}</h1>

                            <h4 class="theme-color" style="margin-bottom: 28px">Email: ${user.email}</h4>
                            <input id="userId" type="hidden" value="${user.id}" name="uid">

                            <label style="padding: 20px">Số điện thoại</label>
<%--                            <input id="userPhone" type="text" name="phone" placeholder="Phone" value="${user.phone}"--%>
<%--                                   style="padding:6px;margin-left: 0px;opacity: 80%">--%>
                            <input id="userPhone" type="text" name="phone" placeholder="Phone" value="<c:out value="${user.phone}"/>"
                                   style="padding:6px;margin-left: 0px;opacity: 80%">
<%--                            <input id="userPhone" type="text" name="phone" placeholder="Phone" value="<c:out value="${fn:escapeXml(user.phone)}"/>"--%>
<%--                                   style="padding:6px;margin-left: 0px;opacity: 80%">--%>
                            <br>

                            <label style="padding: 20px">Địa chỉ</label>
<%--                            <input id="userAddress" type="text" name="address" placeholder="Address"--%>
<%--                                   value="${user.address}" style="padding: 6px;margin-left: 50px; margin-top: 12px;opacity: 80% ">--%>
                            <input id="userAddress" type="text" name="address" placeholder="Address"
                                   value="<c:out value="${user.address}"/>" style="padding: 6px;margin-left: 50px; margin-top: 12px;opacity: 80% ">
<%--                            <input id="userAddress" type="text" name="address" placeholder="Address"--%>
<%--                                   value="${fn:escapeXml(user.address)}" style="padding: 6px;margin-left: 50px; margin-top: 12px;opacity: 80% ">--%>
                            <br>

                            <button class="js-buy-ticket px-btn theme btn btn-success" style="margin-top: 26px ;margin-right: 20px; border: solid black 1px" type=""
                                    onclick="updateProfile()">Sửa thông tin
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/common/footer.jsp"%>

<div class="modal js-modal">
    <div class="modal-container js-modal-container">
        <div class="modal-close js-modal-close">
            <i class="fas fa-times"></i>
        </div>
        <div class="modal-header"><span style="color: #00c851">ĐÃ CẬP NHẬT</span></div>
        <div class="modal-body">
            <i style="padding: 5px" class="fas fa-check-circle btn-success btn-radius"></i>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    function updateProfile(){
        var id = document.getElementById("userId").value;
        var phone = document.getElementById("userPhone").value;
        var address = document.getElementById("userAddress").value;
        $.ajax({
            url: "/SaveProfileServlet",
            type: "get", //send it through get method
            data: {
                id: id,
                name: name,
                phone: phone,
                address: address
            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
                showBuyTickets();
            },
            error: function(xhr) {
            }
        });
    }

    function loadInvoice(){
        $.ajax({
            url: "/LoadInvoiceServlet",
            type: "get", //send it through get method
            data: {

            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function(xhr) {

            }
        });
    }

    function loadInfoProfile(){
        $.ajax({
            url: "/LoadInfoServlet",
            type: "get", //send it through get method
            data: {

            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function(xhr) {

            }
        });
    }



    function changeUnderline(num){
        if(num == 1){
            const info = document.querySelector('#info')
            const invoice = document.querySelector('#invoice')
            info.classList.remove('colorlib-active')
            invoice.classList.add('colorlib-active')
        }
        else{
            const info = document.querySelector('#info')
            const invoice = document.querySelector('#invoice')
            info.classList.add('colorlib-active')
            invoice.classList.remove('colorlib-active')
        }

    }
</script>
<script type="text/javascript" src="/assets/js/scriptProfile.js"></script>



</body>

</html>