<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Foppe</title>

    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="/assets/css/mdb-pro.min.css">
    <link type="text/css" rel="stylesheet" href="/assets/css/mdb.ecommerce.min.css">

</head>

<body class="skin-light">

<header>
    <div class="jumbotron color-grey-light mt-70">
        <div class="d-flex align-items-center h-100">
            <div class="container text-center py-5">
                <h3 class="mb-0">Đơn mua</h3>
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
                <div class="col-lg-8" style="flex:0 0 100%;max-width: 100%">

                    <!-- Card Product -->
                    <div class="card wish-list mb-4">
                        <div class="card-body">
                            <h5 id="countCart" class="mb-4">Invoice (<span>${count}</span> items)</h5>
                            <div id="content">
                                <c:forEach var="order" items="${invoice}">
                                    <div class="row mb-4 countItem">
                                        <div class="col-md-5 col-lg-3 col-xl-3">
                                            <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                                <img src="/assets/img/invoice-pic.jpg" class="img-fluid w-100" style="transform: scale(0.5)"
                                                     alt="Sample">
                                                <a href="#!">
                                                    <div class="mask waves-effect waves-light">
                                                        <img class="img-fluid w-100" style="transform: scale(0.6)"
                                                             src="/assets/img/invoice-pic.jpg" alt="none">
                                                        <div class="mask rgba-black-slight waves-effect waves-light"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div style="height: 174px" class="col-md-7 col-lg-9 col-xl-9">
                                            <div>
                                                <div style="height: 130px" class="d-flex justify-content-between">
                                                    <div>
                                                        <h5>Đơn hàng #${order.id}</h5>
                                                        <p class="mb-3 text-muted text-uppercase small">Ngày tạo: ${order.created_at}</p>
                                                        <p class="mb-0"><span><strong>Tổng hoá đơn: ${order.total}</strong></span></p>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <a href="invoiceDetail?oid=${order.id}">Chi tiết đơn hàng</a>
                                                    </div>
                                                    <p class="totalSingle mb-0"><span><strong></strong></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="mb-4">
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
                </div>
                <!--Column 1: Product, info shipping and pay -->

                <!--Column 2: Total price and discount -->

                <!--Column 2: Total price and discount -->
            </div>
            <!--Main row-->

        </section>
        <!--Section: Block Content-->
    </div>
</main>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // function updateCart(foodId, quantity, typeBtn){
    //     $.ajax({
    //         url: "/UpdateCartServlet",
    //         type: "get", //send it through get method
    //         data: {
    //             IdFood: foodId,
    //             FoodQuantity: quantity,
    //             typeBtn: typeBtn,
    //         },
    //         success: function(data) {
    //             var row = document.getElementById("content");
    //             row.innerHTML = data;
    //             updateTotalCart();
    //             countCart();
    //         },
    //         error: function(xhr) {
    //
    //         }
    //     });
    // }
    //
    // function updateTotalCart(){
    //     $.ajax({
    //         url: "/UpdateTotalCartServlet",
    //         type: "get", //send it through get method
    //         data: {
    //
    //         },
    //         success: function(data) {
    //             var row = document.getElementById("contentTotalCart");
    //             row.innerHTML = data;
    //         },
    //         error: function(xhr) {
    //
    //         }
    //     });
    // }
    //
    // function countCart(){
    //     $.ajax({
    //         url: "/CountCartServlet",
    //         type: "get", //send it through get method
    //         data: {
    //
    //         },
    //         success: function(data) {
    //             var row = document.getElementById("countCart");
    //             row.innerHTML = data;
    //         },
    //         error: function(xhr) {
    //
    //         }
    //     });
    // }


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