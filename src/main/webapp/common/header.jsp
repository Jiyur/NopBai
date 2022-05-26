<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header>
    <a href="/" class="logo" style="font-size: 30px; text-decoration: none"><i class="fas fa-utensils"></i>foppe</a>
    <div class="icons" style="font-weight: 900!important;">
        <i class="fas fa-bars" id="menu-bars"></i>
        <i class="fas fa-search" id="search-icon"></i>
        <a href="CartServlet" class="fas fa fa-shopping-cart fa-lg" style="font-weight: 900 !important;">
<%--            <span class="d-flex align-items-center justify-content-center">--%>
<%--                ${cart.countItem}--%>
<%--            </span>--%>
        </a>
        <a href="Login2Servlet?action=checkUser" class="fas fa-user" style="font-weight: 900 !important;"></a>

    </div>
</header>