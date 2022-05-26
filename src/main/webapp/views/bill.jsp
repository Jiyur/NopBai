<%@ page import="src.pages.foodweb.userInterface.controller.cart.Cart" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>FoppeShop</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/bill.css" />">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">

    <link rel="stylesheet" href="/assets/css/common.css">

    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

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

<div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1" style="margin-top: 115px">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Cảm ơn đã sử dụng dịch vụ của chúng tôi, <span class="change-color">${user.name}</span> !</h4>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                <div class="col-auto "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
            </div>
            <c:forEach var="item" items="${cart.items}">
                <div class="row mt-4">
                    <div class="col">
                        <div class="card card-2">
                            <div class="card-body">
                                <div class="media">
                                    <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="${item.food.galleries[0].img_url}" width="135" height="135" /> </div>
                                    <div class="media-body my-auto text-right">
                                        <div class="row my-auto flex-column flex-md-row">
                                            <div class="col-auto my-auto ">
                                                <h6 class="mb-0"> ${item.food.f_name}</h6>
                                            </div>
                                            <div class="col my-auto "> <small>Black Rim </small></div>
                                            <div class="col my-auto "> <small>Size : L</small></div>
                                            <div class="col my-auto "> <small>Qty : ${item.quantity} </small></div>
                                            <div class="col my-auto ">
                                                <h6 class="mb-0">${item.totalCurrencyFormat}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-3 ">
                                <div class="row ">
                                    <div class="col-md-3 mb-3"> <small> Track Order <span><i class=" ml-2 fa fa-refresh" aria-hidden="true"></i></span></small> </div>
                                    <div class="col mt-auto">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar rounded" style="width: 18%" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="media row justify-content-between ">
                                            <div class="col-auto text-right"><span> <small class="text-right mr-sm-2"></small> <i class="fa fa-circle active"></i> </span></div>
                                            <div class="flex-col"> <span> <small class="text-right mr-sm-2">Out for delivary</small><i class="fa fa-circle"></i></span></div>
                                            <div class="col-auto flex-col-auto">
                                                <small class="text-right mr-sm-2">Delivered</small><span> <i class="fa fa-circle"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <% Cart cart=(Cart)session.getAttribute("cart");
                String total=cart.getTotalCurrencyFormat();
            %>
            <div class="row mt-4">
                <div class="col">
                    <div class="row justify-content-between">
                        <div class="col-auto" style="margin-bottom: 20px">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>

                    </div>
                    <div class="row justify-content-between">

                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1"><%=total%></p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Delivery Charges</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Free</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row invoice ">
                <div class="col">
                    <p class="mb-1"> Invoice Number : ${order.id}</p>
                    <p class="mb-1">Invoice Date : <%=session.getAttribute("curDate")%></p>
                    <p class="mb-1">Recepits Voucher:18KU-62IIK</p>
                </div>
            </div>

        </div>
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-sm-auto col-auto my-auto">
                        <a href="${pageContext.request.contextPath}/Home" style="text-decoration: none;margin-left: 10px">< Return to homepage</a>
                    </div>
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3 " style="color: black;opacity: 0.5 ;transform: scale(0.7)"><%=total%> </h1>
                    </div>
                </div>

            </div>
        </div>
    </div>

<%@include file="/common/footer.jsp"%>

</div>
</body>
</html>
</body>
</html>
