<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Material Design Bootstrap</title>

    <!-- Roboto Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <!-- Font Awesome -->
    <!-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="/assets/css/mdb-pro.min.css">
    <!-- Material Design Bootstrap Ecommerce -->
    <link rel="stylesheet" href="/assets/css/mdb.ecommerce.min.css">

</head>

<body class="skin-light">

<header>
    <div class="jumbotron color-grey-light mt-70">
        <div class="d-flex align-items-center h-100">
            <div class="container text-center py-5">
                <h3 class="mb-0">Shopping cart</h3>
            </div>
        </div>
    </div>
</header>

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
                            <h5 id="countCart" class="mb-4">Cart (<span>${cart.countItem}</span> items)</h5>

                            <div id="content">
                                <c:forEach var="item" items="${cart.items}">
                                    <div class="row mb-4 countItem">
                                        <div class="col-md-5 col-lg-3 col-xl-3">
                                            <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
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
<%--                                                            <form action="" method="post">--%>
                                                                <input type="hidden" name="foodId" value="${item.food.fid}">

                                                                <input style="font-weight: bold; padding-left: 10px; width: 2.5rem; border: none; background-color: transparent" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); updateCart(${item.food.fid}, ${item.quantity}, 'minus')"
                                                                       type="submit" value="-">

                                                                <input name="quantity" class="quantity" min="0" value="${item.quantity}"
                                                                       type="number">

                                                                <input id="btnPlus" style="font-weight: bold; padding-right: 10px; width: 2.5rem; border: none; background-color: transparent" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); updateCart(${item.food.fid}, ${item.quantity}, 'plus');"
                                                                       type="submit" value="+">

<%--                                                                <button class="btn btn-primary" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); updateCart(${item.food.fid}, ${item.quantity})">+</button>--%>
<%--                                                            </form>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
<%--                                                        <form action="" method="post">--%>
                                                            <input type="hidden" name="foodId"
                                                                   value="${item.food.fid}">
                                                            <input type="hidden" name="quantity" value="0">
                                                            <input class="card-link-secondary small text-uppercase mr-3 fas fa-trash-alt mr-1"
                                                                   type="submit" value="Remove Item" onclick="updateCart(${item.food.fid}, '0','minus' )">
<%--                                                        </form>--%>
                                                    </div>
                                                    <p class="mb-0"><span><strong>${item.food.priceCurrencyFormat}</strong></span></p>
                                                    <p class="totalSingle mb-0"><span><strong>${item.totalCurrencyFormat}</strong></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="mb-4">
                                </c:forEach>
                            </div>

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
                    <!-- Card total price -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-3">The total amount of</h5>
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
                            <button type="button" class="btn btn-primary btn-block waves-effect waves-light">Thanh toán</button>
                        </div>
                    </div>
                    <!-- Card total price -->
                </div>
                <!--Column 2: Total price and discount -->
            </div>
            <!--Main row-->

        </section>
        <!--Section: Block Content-->
    </div>
</main>


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


</script>






<!-- <script src="../../../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../../js/popper.min.js"></script>
<script type="text/javascript" src="../../../js/bootstrap.js"></script>
<script type="text/javascript" src="../../../js/mdb.min.js"></script>
<script type="text/javascript" src="../../../js/mdb.ecommerce.min.js"></script> -->
<script type="text/javascript" src="/assets/js/scriptCart.js"></script>
</body>
</html>


<!-- Card discount code -->
<%--                    <div class="card mb-4">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="" id="collapseExample">--%>
<%--                                <div class="mt-3">--%>
<%--                                    <div class="md-form md-outline mb-0">--%>
<%--                                        <input type="text" id="discount-code" class="form-control font-weight-light"--%>
<%--                                               placeholder="Enter discount code">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<!-- Card discount code -->