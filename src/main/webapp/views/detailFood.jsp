<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Web</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/assets/css/templatemo.css"/>">

    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

<%--    <link type="text/css" rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />--%>

    <link rel="stylesheet" href="<c:url value="/assets/css/slick.min.css"/>">

    <link rel="stylesheet" href="<c:url value="/assets/css/slick-theme.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/styleDetailFood2.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/common.css"/>"/>

    <link rel="stylesheet" href="/assets/css/button.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Varela+Round&display=swap');
        .btn{
            padding: 9px !important;
        }

        #btn-plus, #btn-minus{
            width: 33px;
        }
    </style>
</head>
<body>

<%@include file="/common/header.jsp"%>

<div class="wrap pb-5" style="background-color: white; margin-top: 80px">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 mt-5 new-border-card">
                <div style="
                            height: 28rem;
                            width: 100%;
                            padding: 10px 0px;
                            overflow: hidden;
                            position: relative;
                            box-shadow: 0 2px 0px 0 rgba(0, 0, 0, 0.14);"
                            class="image mb-3">
                    <img class="image card-img img-fluid" src="${food.galleries[0].img_url}" alt="Card image cap" id="product-detail">
                </div>
                <div class="row">
                    <!--Start Controls-->
                    <div class="col-1 align-self-center">
                        <a href="#multi-item-example" role="button" data-bs-slide="prev">
                            <i class="text-dark fas fa-chevron-left"></i>
                        </a>
                    </div>

                    <!--Start Carousel Wrapper-->
                    <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                        <!--Start Slides-->
                        <div class="carousel-inner product-links-wap" role="listbox">
                            <!--First slide-->
                            <div class="carousel-item active">
                                <div class="row">
                                    <div style="margin-bottom: 0" class="carousel-related-product">
                                        <c:forEach var="item" items="${listGalleries}">
                                            <div class="p-2 pb-3">
                                                <div class="box new-border-card product-wap card rounded-0">
                                                    <a href="#" class="card">
                                                        <img style="height: 5rem" class="image" src="${item.getImg_url()}" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!--/.First slide-->
                        </div>
                        <!--End Slides-->
                    </div>
                    <!--End Carousel Wrapper-->

                    <div class="col-1 align-self-center">
                        <a href="#multi-item-example" role="button" data-bs-slide="next">
                            <i class="text-dark fas fa-chevron-right"></i>
                        </a>
                    </div>
                    <!--End Controls-->
                </div>
            </div>
            <!-- col end -->
            <div class="col-lg-7 mt-5">
                <div class="card new-border-card">
                    <div class="card-body">
                        <h1 style="margin-top: 10px;" class="h2" style="font-size: 30px; font-weight: 500 !important;">${food.f_name}</h1>
                        <p class="h3 py-2" style="font-size: 22px !important;">${food.priceCurrencyFormat}</p>
                        <p class="py-2">
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star text-warning"></i>
                            <i class="fa fa-star "></i>
                            <span class="list-inline-item text-dark">Rating 4.8</span>
                        </p>
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <h6>Brand:</h6>
                            </li>
                            <li class="list-inline-item">
                                <p style="opacity: 0.4;"><strong>FOPPE</strong></p>
                            </li>
                        </ul>

                        <div class="wrap-description" style= "height: 165px;">
                            <h6 class="font-weight-bold">Description:</h6>
                            <p>${food.desciprtion}</p>
                        </div>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="product-title" value="Activewear">
                            <div style="margin-bottom: 12px" class="row">
                                <div class="col-auto">
                                    <ul class="list-inline">
                                        <li class="list-inline-item">Size :
                                            <input type="hidden" name="product-size" id="product-size" value="S">
                                        </li>
                                        <li class="list-inline-item"><span class="btn btn-success btn-size">Nhỏ</span></li>
                                        <li class="list-inline-item"><span class="btn btn-success btn-size">Vừa</span></li>
                                        <li class="list-inline-item"><span class="btn btn-success btn-size">Lớn</span></li>
                                        <li class="list-inline-item"><span class="btn btn-success btn-size">Cực lớn</span></li>
                                    </ul>
                                </div>
                                <div class="col">
                                    <ul class="list-inline pb-3">
                                        <li class="list-inline-item text-right">
                                            Quantity
                                            <input type="hidden" name="quantity" id="product-quanity" value="1">
                                        </li>
                                        <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                        <li class="list-inline-item"><span class="btn bg-light" id="var-value">1</span></li>
                                        <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row pb-3">
<%--                                <div class="col d-grid">--%>
<%--                                    <input type="submit" class="btn btn-success btn-lg" name="submit" value="Buy"/>--%>
<%--                                </div>--%>
                                <div style="margin-bottom: 8px" class="col d-grid">
                                    <form action="CartServlet" method="get">
                                        <input type="hidden" name="isDetail" value="yes">
                                        <input type="hidden" name="foodId" value="<c:out value='${food.fid}'/>">
                                        <input name="AddToCart" type="submit" class="js-buy-ticket btn btn-success btn-lg" value="Thêm vào giỏ hàng">
                                    </form>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<section class="py-5">
    <div class="container">
        <div class="row text-left p-2 pb-3">
            <h4>Related Products</h4>
        </div>

        <!--Start Carousel Wrapper-->
        <div class="carousel-related-product">
            <c:forEach var="item" items="${listFood}">
                <form action="DetailFoodServlet" method="post">
                    <input type="hidden" name="foodId" value="<c:out value='${item.fid}'/>">
                    <a style="text-decoration: none; color:black" onclick="this.parentNode.submit()">
                        <div class="p-2 pb-3">
                            <div class="box new-border-card product-wap card rounded-0" style="border: 2px solid rgba(0,0,0,.125) !important; border-radius: 0.25rem !important;">
                                <div class="card">
                                    <img class="image" src="${item.galleries[0].img_url}" alt="">
                                </div>
                                <div class="card-body">
                                    <h3 class="h3 text-decoration-none">${item.f_name}</h3>
                                    <ul class="list-unstyled d-flex justify-content-center mb-1">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0"><c:out value="${item.priceCurrencyFormat}"/></p>
                                </div>
                            </div>
                        </div>
                    </a>
                </form>
            </c:forEach>
        </div>
    </div>
</section>

<%@include file="/common/footer.jsp"%>

<div class="modal js-modal">
    <div class="modal-container js-modal-container">
        <div class="modal-close js-modal-close">
            <i class="fas fa-times"></i>
        </div>
        <div class="modal-header">
            <i class="fas fa-check-circle modal-header-icon btn-success" style="border-radius: 80px; padding: 5px; color: white; margin-right: 8px"></i>
            ĐÃ THÊM VÀO GIỎ HÀNG
        </div>
        <div class="modal-body">
            <form action="CartServlet">
                <button class="btn-success modal-cart">
                    <i class="fas fa-shopping-cart"></i>
                    XEM GIỎ HÀNG
                </button>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="/assets/js/scriptDetailFood.js"></script>
<script src="<c:url value="/assets/js/scriptDetailFood.js"/>"></script>

<script src="<c:url value="/assets/js/jquery-1.11.0.min.js"/>"></script>

<script src="<c:url value="/assets/js/slick.min.js"/>"></script>

<script src="<c:url value="/assets/js/bootstrap.bundle.min.js"/>"></script>

<script src="<c:url value="/assets/js/templatemo.js"/>"></script>

<script src="<c:url value="/assets/js/scriptDetailFood.js"/>"></script>

<!-- <script src="/js/templatemo.js"></script> -->
<!-- End Script -->
<!-- Start Slider Script -->
<script>
    $('.carousel-related-product').slick({
        infinite: true,
        arrows: false,
        slidesToShow: 4,
        slidesToScroll: 3,
        dots: true,
        responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        }, {
            breakpoint: 600,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 3
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 3
            }
        }]
    });
</script>
<!-- End Slider Script -->
</body>
</html>