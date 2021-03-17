<%-- 
    Document   : Menu
    Created on : 25-Feb-2021, 14:49:19
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>Website 1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Css/grid.css">
    <link rel="stylesheet" href="Css/stylew1.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="font\fontawesome-free-5.15.2-web\css\all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <style>
        .header_web_items{
            font-size: 15px;
            display: inline-flex;
            height: 40px;
            /*width: 100px;*/
            align-items: center;
            justify-content: center;
            color: #e9bf12 !important;
            border-left: 1px solid #696868;
            border-right: 1px solid #696868;
            cursor: pointer;
        }
        .account_list_product > .account_items_product_v{
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 50px;
            list-style: none;
            margin-bottom: 10px;
        }
        
        .account_items_product_v img{
            height: 100%;
            width: 50px;
        }
        .Click_slider{
            text-align: center;
            margin-top: -50px;
            position: relative;
        }
        .Click_slider button{
            /*position: absolute;*/
/*            bottom: 50px;*/
            width: 20px;
            height: 10px;
            border-radius: 5px;
            margin-right: 2px;
            background-color: rgba(255,255,255,1);
            border: none;
            outline: none;
        }
        .active{
            background-color: rbga(0,0,0,0.8);
        }
        @keyframe fadein{
            
        }
    </style>
</head>
<div class="header_web">
    <div class="grid wide header">
        <ul class="header_web_list"style="width: 300px">
            <li class="header_web_items items_hover" style="width: 60px">
                <label for="nav-mobile-input" class="nav_bars_btn">
                    <i class="fas fa-search" style="cursor: pointer;"></i>
                </label>
            </li>
            <li class="header_web_items items_font"style="width: auto;padding: 5px;text-align: center">
                <c:if test="${sessionScope.acc != null}">
                    <i class="far fa-user"> ${sessionScope.acc.name}</i>  
                </c:if> 
                <c:if test="${sessionScope.acc == null}">
                    <a href="Login.jsp" style="text-decoration: none;font-size: 15px;color: #e9bf12">Xin chào</a>
                </c:if> 
            </li>
            <li class="header_web_items items_run" style="font-size: 15px;
                /* color: #fff; */
                display: flex;
                align-items: center;
                padding: 5px;border-right: none;
                justify-content: center;
                flex: 0.5">
                <i class="fas fa-shopping-basket" style="position: relative">
                    <!--                        <span class="header_web_gh">Giỏ hàng:</span>-->
                    <span class="header_web_sp" style="
                          position: absolute;
                          top: -8px;
                          right: -14px;
                          border: 0.225rem solid #e9bf12;
                          background-color: #r9bf12;
                          background-color: #e9bf12;
                          color: #333;
                          border-radius: 0.7rem;

                          ">
                        <c:if test="${Sosp == null}">
                            0
                        </c:if>
                        <c:if test="${Sosp != 0}">
                            ${Sosp}
                        </c:if>
                    </span>
                </i>
                <div class="header_product_shop">
                    <div class="header_product_shop_cart">
                        <div class="header_product_font" style="color: #333;font-weight: bold">
                            Thông tin giỏ hàng
                        </div>
                        <c:if test="${sessionScope.acc != null}">
                            <ul class="account_list_product" style="padding-left: 0">
                                <c:forEach items="${list}" var="o">
                                    <li class="account_items_product_v">
                                        <img src="${o.getD().image}" alt="">
                                        <p>
                                            <a href="detail?iid=${o.getD().id}" style="color: #333333;
                                               text-decoration: none;
                                               font-size: #333333;
                                               font-weight: bold;">
                                                ${o.getD().name}
                                            </a>
                                        </p>
                                        <div class="product_name">
                                            <span>
                                                ${o.getD().price}
                                            </span>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                        <div class="header_product_summoney">
                            <span>TỔNG TIỀN:</span>
                            <span>${tong}$</span>
                        </div>
                        
                    </div>
                </div>
            </li>
            <input type="checkbox" class="nav_input" id="nav-mobile-input">
            <lable class="header_web-search" for="nav-mobile-input">
                <form class="header_web-search_fix"  action="search" method="post">
                    <input name="txt" type="text" class="header_web-input" placeholder="Tìm kiếm..." value="${value}">
                    <button class="header_web-search-sp" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </lable>
        </ul>
    </div>
</div>
<div class="nav">
    <div class="grid wide">
        <div class="nav_bar">
            <div class="nav_logo">
                <a href="Homecontrol" class="nav_logo_link">
                    <img src="font\logo.png" alt="" class="nav_logo_link_img">
                </a>
            </div>
            <ul class="nav_logo_list">
                <li class="nav_logo_list_items">
                    <a href="Homecontrol" class="nav_link">
                        <span>Trang chủ</span>
                    </a>
                </li>
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Giới thiệu</span>
                    </a>
                </li>
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Tin tức</span>
                    </a>
                </li>
                <li class="nav_logo_list_items hover">
                    <a href="" class="nav_link">
                        <span>
                            Sản phẩm
                            <i class="fas fa-angle-down"></i>
                        </span>

                    </a>
                    <ul class="nav_items_product">
                        <li class="nav_items_product_fix">
                            <a href="">
                                Tủ Rrượu
                            </a>
                        </li>
                        <li class="nav_items_product_fix"> 
                            <a href="">
                                Giường
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Sofa Bộ
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Sofa Góc, Sofa Băng
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Bàn Trà Sofa
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Kệ Tivi
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Bàn Làm Việc
                            </a>
                        </li class="nav_items_product_fix">
                        <li class="nav_items_product_fix">
                            <a href="">
                                Tủ Quần Áo
                            </a>
                        </li>
                        <li class="nav_items_product_fix">
                            <a href="">
                                Nội Thất Gia Đình
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Tuyển dụng</span>
                    </a>
                </li>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav_logo_list_items">
                        <a href="#" class="nav_link">
                            <span>Tin tức</span>
                        </a>
                    </li>
                    <li class="nav_logo_list_items">
                        <a href="logout" class="nav_link">
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav_logo_list_items">
                        <a href="#" class="nav_link">
                            <span>Tin tức</span>
                        </a>
                    </li>
                    <li class="nav_logo_list_items">
                        <a href="Login.jsp" class="nav_link">
                            <span>Đăng nhập</span>
                        </a>
                    </li>
                </c:if>
            </ul>

            <label for="nav-mobile-inputk" class="nav_bars_btk">
                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" class="svg-inline--fa fa-bars fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg>
            </label>


            <input type="checkbox" class="nav_input_btk" id="nav-mobile-inputk">

            <label for="nav-mobile-inputk" class="nav_ovarlay"></label>
            <ul class="nav_logo_list_mobile">
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Trang chủ</span>
                    </a>
                </li>
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Giới thiệu</span>
                    </a>
                </li>
                <li class="nav_logo_list_items">
                    <a href="" class="nav_link">
                        <span>Tin tức</span>
                    </a>
                </li>
                <li class="nav_logo_list_items hover">
                    <a href="Login.jsp" class="nav_link">
                        <span>
                            Sản phẩm
                            <i class="fas fa-angle-down"></i>
                        </span>

                    </a>
                </li>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav_logo_list_items">
                        <a href="Homecontrol" class="nav_link">
                            <span><i class="far fa-user"></i>  ${sessionScope.acc.username}</span>
                        </a>
                    </li>
                    <li class="nav_logo_list_items">
                        <a href="logout" class="nav_link">
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav_logo_list_items">
                        <a href="Login.jsp" class="nav_link">
                            <span>Đăng nhập</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<div class="backgroud_img">
    <div class="grid wide">
        <div class="backgroud_img_slide">
            <div class="backgroud">
                <img src="http://durable.vn/application/media/gioi_thieu/banner_04.jpg" id="image_p" alt="" onclick="checkout(0)" style="height: 600px">
            </div>
            <div class="Click_slider">
                <button class="click" onclick="onclickI(0)" id="0" value="0"></button>
                <button class="click" onclick="onclickI(1)" id="1" value="1"></button>
                <button class="click" onclick="onclickI(2)" id="2" value="2"></button>
                <button class="click" onclick="onclickI(3)" id="3" value="3"></button>
            </div>
        </div>
        <h1 class="backgroud_font">
            <img src="font\dot.png" alt="">
            <span>SẢN PHẨM PHỔ BIẾN</span>
            <img src="font\dot.png" alt="">
        </h1>
        <div class="product_slider">
            <div class="row">
                <div class="col l-3 m-6 c-6">
                    <img src="font\sp1.jpg" alt="">
                    <p>
                        <a href="">
                            Bàn chân xòe
                        </a>
                    </p>
                    <div class="product_name">
                        <span>
                            2,900,000đ
                        </span>
                        <span>
                            2,900,000đ
                        </span>
                    </div>
                    <span class="product_sale">
                        0%
                    </span>
                </div>
                <div class="col l-3 m-6 c-6">
                    <img src="font\sp2.jpg" alt="">
                    <p>
                        <a href="">
                            Tủ quần áo hd02
                        </a>
                    </p>
                    <div class="product_name">
                        <span>
                            12,500,000đ
                        </span>
                        <span>
                            14,500,000đ
                        </span>
                    </div>
                    <span class="product_sale">
                        15%
                    </span>
                </div>
                <div class="col l-3 m-6 c-6">
                    <img src="font\sp3.jpg" alt="">
                    <p>
                        <a href="">
                            Tủ quần áo tcd1
                        </a>
                    </p>
                    <div class="product_name">
                        <span>
                            33,800,000đ
                        </span>
                        <span>
                            24,500,000đ
                        </span>
                    </div>
                    <span class="product_sale">
                        25%
                    </span>
                </div>
                <div class="col l-3 m-6 c-6">
                    <img src="font\sp4.jpg" alt="">
                    <p>
                        <a href="">
                            Tab tcd01
                        </a>
                    </p>
                    <div class="product_name">
                        <span>
                            4,500,000đ
                        </span>
                        <span>
                            3,500,000đ
                        </span>
                    </div>
                    <span class="product_sale">
                        40%
                    </span>
                </div>

            </div>

        </div>

    </div>
</div>
<script>
        var index = 1;
        var checkout = function(){
            var image = ["http://durable.vn/application/media/gioi_thieu/banner_04.jpg","font/k1.jpg","font/k2.jpg","font/k3.jpg"];
            document.getElementById("image_p").src = image[index];
            index++;
            if(index==4){
                index = 0;
            }
        }
        function onclickI(v){
            var image = ["http://durable.vn/application/media/gioi_thieu/banner_04.jpg","font/k1.jpg","font/k2.jpg","font/k3.jpg"];
            document.getElementById("image_p").src = image[v];
            var c_active = document.getElementsByClassName("click");
            for(var i=0; i< c_active.length; i++){
            c_active[i].style.background_color = "#f1f1f1f1";
            }
            c_active[v].style.background_color = "black";
        }
        setInterval(checkout,1500);
</script>