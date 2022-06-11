<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="csrf.CSRF" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String csrfToken= null;
    try {
        csrfToken = CSRF.getToken();
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    javax.servlet.http.Cookie cookie=new javax.servlet.http.Cookie("csrfToken",csrfToken); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Giỏ hàng</title>

    <!-- Roboto Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <!-- Font Awesome -->
    <!-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="/assets/css/mdb-pro.min.css">
    <!-- Material Design Bootstrap Ecommerce -->
    <link rel="stylesheet" href="/assets/css/mdb.ecommerce.min.css">

    <link rel="stylesheet" href="/assets/css/common.css">

    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <link type="text/css" rel="stylesheet" href="/assets/css/button.css">

    <style>
        header .logo{
            font-size: 30px !important;
        }

        header .icons{
            font-size: 200% !important;
        }

        .image{
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .modal.open {
            display: flex;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.4);
            align-items: center;
            justify-content: center;
        }

        .modal-container {
            background-color: #e3e3e3;
            color: #565653;
            align-items: center;
            justify-content: center;
            text-align: center;
            width: 640px;
            max-width: calc(100% - 32px);
            min-height: 200px;
            position: relative;
            animation: modalFadeIn ease 0.6s;
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100px;
            /*background-color: rgb(20, 139, 139);*/
            font-size: 30px;
            border-bottom: none;
        }

        .modal-header-icon {
            color: #00d68f;
            font-size: 38px;
            padding: 15px;

        }

        .modal-body {
            padding: 16px;
            align-items: center;
            justify-content: center;
        }

        .modal-body button{
            width: 100px;
            padding: 5px;
        }

        .modal-close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 10px 15px;
            color: #d90000;
            opacity: 0.9;
        }

        .modal-close:hover {
            cursor: pointer;
            color: black;
            background-color:#ccc;
            opacity: 1;
        }

        .modal-cart{
            border: 1px solid;
            border-radius: 4px;
            color: #fffcfb;
        }

        .modal-cart:hover{
            cursor: pointer;
            background-color: black;
            opacity: 0.9;
        }

        @keyframes modalFadeIn {
            from {
                opacity: 0;
                transform: translateY(-130px);
            }
            to{
                opacity: 1;
                transform: translateY(0);
            }
        }

    </style>


</head>

<body class="skin-light">

<%@include file="/common/header.jsp"%>

<div>
    <div class="jumbotron color-grey-light mt-70">
        <div class="d-flex align-items-center h-100">
            <div class="container text-center py-5">
                <h3 class="mb-0">GIỎ HÀNG</h3>
            </div>
        </div>
    </div>

    <main>
        <div class="container">

            <!--Section: Block Content-->
            <section class="mt-5 mb-4">

                <!--Main row-->
                <div class="row">

                    <!-- Column 1: Product, info shipping and pay -->
                    <div class="col-lg-8">

                        <!-- Card Product -->
                        <div class="card wish-list mb-4">
                            <div class="card-body">
                                <h5 id="countCart" class="mb-4">Danh sách sản phẩm (<span>${cart.countItem}</span> sản phẩm)</h5>

                                <div id="content">
                                    <c:forEach var="item" items="${cart.items}">
                                        <div class="row mb-4 countItem">
                                            <div class="col-md-5 col-lg-3 col-xl-3">
                                                <div style="border: 1px solid rgba(0,0,0,0.3);" class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                                    <img class="img-fluid w-100"
                                                         src="${item.food.galleries[0].img_url}"
                                                         alt="Sample">
                                                    <a href="#!">
                                                        <div class="mask waves-effect waves-light">
                                                            <img class="img-fluid w-100"
                                                                 src="${item.food.galleries[0].img_url}">
                                                            <div class="mask rgba-black-slight waves-effect waves-light"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div style="height: 174px" class="col-md-7 col-lg-9 col-xl-9">
                                                <div>
                                                    <div style="height: 130px" class="d-flex justify-content-between">
                                                        <div>
                                                            <h5>${item.food.f_name}</h5>
                                                            <p class="mb-3 text-muted text-uppercase small">${item.food.desciprtion}</p>
                                                        </div>
                                                        <div>
                                                            <div class="def-number-input number-input safari_only mb-0 w-100">
                                                                <input type="hidden" name="foodId" value="${item.food.fid}">

                                                                <input style="font-weight: bold; padding-left: 10px; width: 2.5rem; border: none; background-color: transparent" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); updateCart(${item.food.fid}, ${item.quantity}, 'minus')"
                                                                       type="submit" value="-">

                                                                <input name="quantity" class="quantity" min="0" value="${item.quantity}"
                                                                       type="number">

                                                                <input id="btnPlus" style="font-weight: bold; padding-right: 10px; width: 2.5rem; border: none; background-color: transparent" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); updateCart(${item.food.fid}, ${item.quantity}, 'plus');"
                                                                       type="submit" value="+">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div>
                                                            <input type="hidden" name="foodId"
                                                                   value="${item.food.fid}">
                                                            <input type="hidden" name="quantity" value="0">
                                                            <input style="font-family: Roboto; padding: 5px; color: white" class="btn-danger card-link-secondary small text-uppercase mr-3 fas fa-trash-alt mr-1"
                                                                   type="submit" value="GỠ SẢN PHẨM" onclick="updateCart(${item.food.fid}, '0','minus' )">

                                                        </div>
                                                        <p class="mb-0"><span><strong>${item.food.priceCurrencyFormat}</strong></span></p>
                                                        <p class="totalSingle mb-0"><span><strong>${item.totalCurrencyFormat}</strong></span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="background: rgba(0,0,0,0.3)" class="mb-4">
                                    </c:forEach>
                                </div>
                                <%
                                    Date date = Calendar.getInstance().getTime();
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                                    String strDate = dateFormat.format(date);
                                    session.setAttribute("curDate",strDate);
                                %>
                            </div>
                        </div>
                        <!-- Card Product -->

                        <!-- Card Info Shipping-->
                        <div class="card mb-4">
                            <div class="card-body">

                                <h5 class="mb-4">Giao hàng vào</h5>

                                <p class="mb-0"> Thu., 12.03. - Mon., 16.03.</p>
                            </div>
                        </div>
                        <!-- Card Info Shipping-->

                        <!-- Card Info Paying-->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="mb-4">Chấp nhận thanh toán</h5>
                                <img class="mr-2" width="45px"
                                     src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                     alt="Visa">
                                <img class="mr-2" width="45px"
                                     src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                     alt="Mastercard">
                                <img class="mr-2" width="45px"
                                     src="/assets/img/paypal.svg"
                                     alt="PayPal acceptance mark">
                            </div>
                        </div>
                        <!-- Card Info Paying-->
                    </div>
                    <!--Column 1: Product, info shipping and pay -->

                    <!--Column 2: Total price and discount -->
                    <div id="contentTotalCart" class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="mb-3">THANH TOÁN</h5>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        Tạm tính
                                        <span id="totalCart">${cart.totalCurrencyFormat}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        Shipping
                                        <span>asd</span>
                                    </li>
                                    <li
                                            class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Tổng thanh toán</strong>
                                            <strong>
                                                <p class="mb-0">(Bao gồm VAT)</p>
                                            </strong>
                                        </div>
                                        <span><strong>${cart.totalCurrencyFormat}</strong></span>
                                    </li>
                                </ul>
                                <a onclick="openModal()" class="js-buy-ticket btn btn-primary btn-block waves-effect waves-light">Thanh toán</a>
                            </div>
                        </div>
                    </div>
                    <!--Column 2: Total price and discount -->
                </div>
                <!--Main row-->

            </section>
            <!--Section: Block Content-->
        </div>
    </main>
</div>

<%@include file="/common/footer.jsp"%>

<div onclick="closeModal()" class="modal js-modal">
    <div onclick="closeModal()" class="modal-container js-modal-container">
        <div class="modal-close js-modal-close">
            <i class="fas fa-times"></i>
        </div>
        <div class="modal-header">
            <i class="far fa-question-circle modal-header-icon btn-success" style="border-radius: 60px; padding: 6px; margin-right: 12px"></i>
            Bạn muốn thanh toán ?
        </div>
        <div class="modal-body">
            <button onclick="closeModal()" class="btn-success modal-cart">
                <i class="fas fa-times"></i>
                KHÔNG
            </button>
            <form action="/payment" style="display: inline-block">
                <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                <button style="margin-left: 25px" class="btn-success modal-cart">
                    <i class="fas fa-check"></i>
                    CÓ
                </button>
            </form>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function updateCart(foodId, quantity, typeBtn){
        $.ajax({
            url: "/UpdateCartServlet",
            type: "get", //send it through get method
            data: {
                IdFood: foodId,
                FoodQuantity: quantity,
                typeBtn: typeBtn,
            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
                updateTotalCart();
                countCart();
            },
            error: function(xhr) {

            }
        });
    }

    function updateTotalCart(){
        $.ajax({
            url: "/UpdateTotalCartServlet",
            type: "get", //send it through get method
            data: {

            },
            success: function(data) {
                var row = document.getElementById("contentTotalCart");
                row.innerHTML = data;
            },
            error: function(xhr) {

            }
        });
    }

    function countCart(){
        $.ajax({
            url: "/CountCartServlet",
            type: "get", //send it through get method
            data: {

            },
            success: function(data) {
                var row = document.getElementById("countCart");
                row.innerHTML = data;
            },
            error: function(xhr) {

            }
        });
    }

    function openModal(){
        const modal = document.querySelector('.js-modal')
        modal.classList.add('open')
    }

    function closeModal(){
        const modal = document.querySelector('.js-modal')
        modal.classList.remove('open')
    }

    // const buyBtns = document.querySelectorAll('.js-buy-ticket')
    // const modal = document.querySelector('.js-modal')
    // const modalContainer = document.querySelector('.js-modal-container')
    // const modalCLose = document.querySelector('.js-modal-close')
    //
    // function showBuyTickets(){
    //     modal.classList.add('open')
    // }
    //
    // function hideShowTickets(){
    //     modal.classList.remove('open')
    // }
    //
    // for (const buyBtn of buyBtns){
    //     buyBtn.addEventListener('click', showBuyTickets)
    // }
    //
    // modalCLose.addEventListener('click', hideShowTickets)
    // modal.addEventListener('click', hideShowTickets)
    // modalContainer.addEventListener('click', function (event){
    //     event.stopPropagation()
    // })



</script>






<!-- <script src="../../../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../../js/popper.min.js"></script>
<script type="text/javascript" src="../../../js/bootstrap.js"></script>
<script type="text/javascript" src="../../../js/mdb.min.js"></script>
<script type="text/javascript" src="../../../js/mdb.ecommerce.min.js"></script> -->
<%--<script type="text/javascript" src="<c:url value="/assets/js/scriptCart2.js"/>"></script>--%>
</body>
</html>
