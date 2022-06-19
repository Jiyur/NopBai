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
    javax.servlet.http.Cookie cookie=new javax.servlet.http.Cookie("csrfToken",csrfToken); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Varela+Round&display=swap');
    </style>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/button.css">

    <style>

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
            color: #e3e3e3;
            font-size: 38px;
            padding: 15px;

        }

        .modal-body {
            padding: 16px;
            align-items: center;
            justify-content: center;
        }

        .modal-body button{
            width: 133px;
            padding: 10px;
        }

        .modal-close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 10px 15px;
            font-size: 25px;
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

<body>
<!-- header section starts      -->
<header>
    <a href="#" class="logo"><i class="fas fa-utensils"></i>foppe</a>
    <nav class="navbar">
        <a class="active" href="#home">Trang chủ ${checkFood}</a>
        <a href="#dishes">Món ăn</a>
        <a href="#about">About</a>
        <a href="#menu">Thực đơn</a>
        <a href="#review">Đánh giá</a>
        <!-- <a href="#order">Đặt hàng</a> -->
    </nav>

    <div class="icons">
        <i class="fas fa-bars" id="menu-bars"></i>
        <i class="fas fa-search" id="search-icon"></i>
        <a href="CartServlet" class="wrap-icon-cart cart-basket fas fa fa-shopping-cart fa-lg">
            <span class="d-flex align-items-center justify-content-center">
                ${cart.countItem}
            </span>
        </a>
<%--        <a href="views/login.jsp" class="fas fa-user"></a>--%>
        <a href="Login2Servlet?action=checkUser" class="fas fa-user"></a>
    </div>
</header>
<!-- header section ends-->

<!-- search form  -->
<form action="" id="search-form">
    <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
    <input type="search" placeholder="search here..." name="" id="search-box">
    <label for="search-box" class="fas fa-search"></label>
    <i class="fas fa-times" id="close"></i>
</form>

<!-- home section starts  -->
<section class="home" id="home">
    <div class="home-slider">
        <div class=" wrapper">
            <div class="slide">
                <div class="content">
                    <span>Thực đơn đặc biệt</span>
                    <h3>Cơm tấm</h3>
                    <p>
                        Cơm tấm,một món ăn được chế biến từ các nguyên liệu rất đơn giản nhưng làm nên hương vị rất riêng,
                        khó lẫn với bất kỳ món cơm nào khác.
                    </p>
                    <form style="cursor: pointer" action="DetailFoodServlet" method="post">
                        <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                        <input type="hidden" name="foodId" value="6">
                        <a class="btn btn-primary" onclick="this.parentNode.submit()">
                            <i class="fas fa-shopping-cart"></i>
                            Đặt ngay</a>
                    </form>
                </div>
                <div class="image">
                    <img src="assets/img/home-11.png" alt="">
                </div>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
</section>
<!-- home section ends -->

<!-- dishes section starts  -->
<section class="dishes" id="dishes">
    <h3 class="sub-heading"> Our dishes </h3>
    <h1 class="heading"> popular dishes </h1>
    <div class="box-container">
        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="assets/img/caKhoTo.jpg" alt="">
            <h3>Cá kho tộ</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>$15.99</span>
            <a href="#" class="btn">
                <i class="fas fa-shopping-basket"></i>
                Thêm vào giỏ</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="assets/img/khoQuet.jpg" alt="">
            <h3>Kho quẹt</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>$15.99</span>
            <a href="#" class="btn">
                <i class="fas fa-shopping-basket"></i>
                Thêm vào giỏ</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="assets/img/banhMi.jpg" alt="">
            <h3>Bánh mỳ</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>$15.99</span>
            <a href="#" class="btn">
                <i class="fas fa-shopping-basket"></i>
                Thêm vào giỏ</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="assets/img/goiGa.jpeg" alt="">
            <h3>Gỏi gà</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>$15.99</span>
            <a href="#" class="btn">
                <i class="fas fa-shopping-basket"></i>
                Thêm vào giỏ</a>
        </div>
    </div>
</section>
<!-- dishes section ends -->

<!-- about section starts  -->
<section class="about" id="about">
    <h3 class="sub-heading"> why choose us </h3>
    <h1 class="heading"> Mua hàng nhanh chóng và đơn giản </h1>

    <div class="row">

        <div class="image">
            <img src="assets/img/about-img.png" alt="">
        </div>

        <div class="content">
            <h3>Món ngon đa dạng</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, sequi corrupti corporis quaerat voluptatem ipsam neque labore modi autem, saepe numquam quod reprehenderit rem? Tempora aut soluta odio corporis nihil!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam, nemo. Sit porro illo eos cumque deleniti iste alias, eum natus.</p>
            <div class="icons-container">
                <div class="icons">
                    <i class="fas fa-shipping-fast"></i>
                    <span>Giao hàng miễn phí</span>
                </div>
                <div class="icons">
                    <i class="fas fa-dollar-sign"></i>
                    <span>Thanh toán nhanh gọn</span>
                </div>
                <div class="icons">
                    <i class="fas fa-headset"></i>
                    <span>CSKH 24/7 </span>
                </div>
            </div>
            <a href="#" class="btn btn-primary">Xem thêm</a>
        </div>

    </div>
</section>
<!-- about section ends -->

<!-- menu section starts  -->
<section style="text-align: center" class="menu" id="menu">

    <h3 class="sub-heading"> Our menu </h3>

    <h1 class="heading"> today's speciality </h1>

    <section class="catalog">
        <div class="food-type">
            <input name="inputFlagCate" id="inputFlagCate" type="hidden" value="0">
            <button onclick="loadCategory(0); changeCateId(0); changeColor(0)" class="all bbttnn btn-cate btn btn-primary btn-success">Tất cả</button>
            <button onclick="loadCategory(1); changeCateId(1); changeColor(1)" class="fastFood bbttnn btn-cate btn btn-primary">Đồ ăn nhanh</button>
            <button onclick="loadCategory(2); changeCateId(2); changeColor(2)" class="drink bbttnn btn-cate btn btn-primary">Đồ uống</button>
            <button onclick="loadCategory(3); changeCateId(3); changeColor(3)" class="snack bbttnn btn-cate btn btn-primary">Ăn vặt</button>
            <button onclick="loadCategory(4); changeCateId(4); changeColor(4)" class="dessert bbttnn btn-cate btn btn-primary">Tráng miệng</button>
        </div>
    </section>

    <div id="content" class="box-container">
        <c:forEach var="item" items="${listFood}">
            <form style="cursor: pointer" action="DetailFoodServlet" method="post">
                <input type="hidden" name="foodId" value="${item.fid}">
                <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                <a style="text-decoration: none; color: black;" onclick="this.parentNode.submit()">
                    <div class="box count-food">
                        <div class="image">
                            <img src="${item.galleries[0].img_url}" alt="">
                        </div>
                        <div class="content">
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                            <h3>${item.f_name}</h3>
<%--                            <p>${item.desciprtion}</p>--%>
                            <span class="price">${item.priceCurrencyFormat}</span>
                        </div>
                    </div>
                </a>
            </form>
        </c:forEach>
    </div>
    <button style="margin-top: 50px; padding: 10px 40px;" onclick="loadMore()" class="btn btn-primary">Xem thêm</button>
</section>
<!-- menu section ends -->

<!-- review section starts  -->
<section class="review" id="review">
    <h3 class="sub-heading"> Đánh giá từ khách hàng </h3>
    <h1 class="heading"> what they say </h1>

    <div class="swiper-container review-slider">
        <div class="swiper-wrapper">

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="assets/img/pic-1.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="assets/img/pic-2.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="assets/img/pic-3.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="assets/img/pic-4.png" alt="">
                    <div class="user-info">
                        <h3>john deo</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

        </div>
    </div>
</section>
<!-- review section ends -->

<!-- footer section starts  -->
<section class="footer">
    <div class="box-container">
        <div class="box">
            <h3>Địa điểm</h3>
            <a href="#">TP. Hồ Chí Minh</a>
            <a href="#">Bình Dương</a>
            <a href="#">Đồng Nai</a>
            <a href="#">Bà Rịa - Vũng Tàu</a>
        </div>

        <div class="box">
            <h3>Danh mục</h3>
            <a href="#">Trang chủ</a>
            <a href="#">Món ăn</a>
            <a href="#">About</a>
            <a href="#">Thực đơn</a>
            <a href="#">Đánh giá</a>
        </div>

        <div class="box">
            <h3>Thông tin liên hệ</h3>
            <a href="#">089-764-3463</a>
            <a href="#">19110376@gmail.com</a>
            <a href="#">TP. Thủ Đức, Hồ Chí Minh, Việt Nam</a>
        </div>

        <div class="box">
            <h3>Nền tảng</h3>
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">Instagram</a>
            <a href="#">Linkedin</a>
        </div>
    </div>
    <div class="credit"> copyright @ 2021 by <span>NHÓM 7</span> </div>
</section>
<!-- footer section ends -->

<div onclick="closeModal()" class="modal js-modal">
    <div onclick="closeModal()" class="modal-container js-modal-container">
        <div class="modal-close js-modal-close">
            <i class="fas fa-times"></i>
        </div>
        <div class="modal-header">
            <i class="fas fa-exclamation-circle modal-header-icon btn-info btn-radius" style=" padding: 6px; margin-right: 12px"></i>
            ĐÃ HẾT SẢN PHẨM
        </div>
        <div class="modal-body">
            <button onclick="closeModal()" class="btn-info modal-cart">
                OK
            </button>
        </div>
    </div>
</div>

<script language="JavaScript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function loadMore(){
        var flagCate = document.getElementById("inputFlagCate").value;
        var amount = document.getElementsByClassName("count-food").length;
        $.ajax({
            url: "/LoadMoreServlet",
            type: "get", //send it through get method
            data: {
                inputFlagCate: flagCate,
                exist: amount,
            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML += data;
                var amount2 = document.getElementsByClassName("count-food").length;

                if(amount2 == amount){
                    openModal()
                }
            },
            error: function(xhr) {

            }
        });
    }

    function loadCategory(cateId){
        // var length = document.getElementsByClassName("count-food").length;
        $.ajax({
            url: "/LoadCategoryServlet",
            type: "get", //send it through get method
            data: {
                cateId: cateId,
            },
            success: function(data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function(xhr) {

            }
        });
    }

    function changeCateId(cateId){
        document.getElementById("inputFlagCate").value = cateId;
    }

    function changeColor(num){
        const allBtn = document.querySelectorAll('.bbttnn')
        for(const item of allBtn){
            item.classList.remove('btn-success')
        }

        if(num==0){
            const btn = document.querySelector('.all')
            btn.classList.add('btn-success')
        }
        else if(num==1){
            const btn = document.querySelector('.fastFood')
            btn.classList.add('btn-success')
        }
        else if(num==2){
            const btn = document.querySelector('.drink')
            btn.classList.add('btn-success')
        }
        else if(num==3){
            const btn = document.querySelector('.snack')
            btn.classList.add('btn-success')
        }
        else if(num==4){
            const btn = document.querySelector('.dessert')
            btn.classList.add('btn-success')
        }
    }

    function openModal(){
        const modal = document.querySelector('.js-modal')
        modal.classList.add('open')
    }

    function closeModal(){
        const modal = document.querySelector('.js-modal')
        modal.classList.remove('open')
    }



</script>


<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="assets/js/script.js"></script>


<style>
    .wrap-icon-cart{
        display: inline-block;
    }
    .cart-basket{
        width: 45px !important;
        font-size: .6rem;
        /*position: absolute;*/
        top: -6px;
        right: -5px;
        width: 15px;
        height: 15px;
        color: #fff;
        background-color: #418deb;
        border-radius: 50%;
    }
</style>
</body>
</html>