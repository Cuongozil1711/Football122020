<%-- 
    Document   : detail
    Created on : 25-Feb-2021, 11:27:16
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sản phẩm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/grid.css">
        <link rel="stylesheet" href="Css/stylew1.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="font\fontawesome-free-5.15.2-web\css\all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
        <style>
            .items_product{
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0px;
                margin-top: -20px;
                margin-left: 5px;


            }

            .items_product img{
                width: 275px;
                height: 250px; 
                border-radius: 10px;
                box-shadow: 2px;
                box-shadow: 5px 5px 5px 5px #f1f1f1f1;
                animation: fadein ease-in .5s!important;
                transition: width 2s ease 0s;
                -moz-transition: width 2s ease 0s;
                -webkit-transition: width 2s ease 0s;
                -o-transition: width 2s ease 0s;
                -ms-transition: width 2s ease 0s;
            }
            .items_product img:hover{
                transform: scale(1.1);
            }
            .items_products_child{
                margin-top: 6px;
                padding-left: 0;
                display: flex;
                width: 100%;
                align-items: center;
                justify-content: space-around;
                margin-left: 5px;
            }
            .items_products_child li{
                animation: fadein ease-in .5s!important;
                transition: width 2s ease 0s;
                -moz-transition: width 2s ease 0s;
                -webkit-transition: width 2s ease 0s;
                -o-transition: width 2s ease 0s;
                -ms-transition: width 2s ease 0s;
                list-style: none;
            }
            .items_products_child li img{
                width: 60px;
                height: 60px;
            }
            .items_products_child li img:hover{
                transform: scale(1.1);
            }
            .buy_now_a:hover{
                background-color: #FFC107;
            }
            @keyframes fadein{
                from{
                    opacity: 0;
                    transform: scale(0);
                }
                to{
                    opacity: 1;
                    transform: scale(1);
                }
            }
        </style>
    </head>
    <body>
        <div class="web">
            <jsp:include page="Menu.jsp"></jsp:include>

                <div class="container">
                    <div class="container_bar">
                        <div class="grid wide">
                            <div class="row">
                            <jsp:include page="Left.jsp"></jsp:include>
                                <div class="col l-9  m-9 c-12">
                                    <h1 class="backgroud_font">
                                        <img src="font\dot.png" alt="">
                                        <span>Tiện nghi & Sang trọng</span>
                                        <img src="font\dot.png" alt="">
                                    </h1>
                                    <div class="row">
                                        <div class="col l-4 m-4 c-6">
                                            <div class="items_product">
                                                <img src="${detail.image}" alt="" id="result">
                                        </div>
                                        <p style="text-align: left;color: #ff0000;;font-size: 15px;margin: 0;margin-top: -32px;font-weight: bold; margin-left: 5px;">SL: ${detail.soluong}</p>
                                        <ul class="items_products_child">
                                            <li>
                                                <img src="${detail.image}" alt="" onclick="changeImage('one')" id="one"/>
                                            </li>
                                            <li>
                                                <img src="font/sp1.jpg" alt="" onclick="changeImage('two')" id="two"/>
                                            </li>
                                            <li>
                                                <img src="font/sp3.jpg" alt="" onclick="changeImage('three')" id="three"/>
                                            </li>
                                            <li>
                                                <img src="font/sp4.jpg" alt="" onclick="changeImage('four')" id="four"/>
                                            </li>
                                        </ul>
                                <!--<p style="text-align: left;color: #f4304c;font-size: 15px;text-decoration: underline">Còn ${detail.soluong} sản phẩm</p>-->
                                    </div>
                                    <div class="col l-8 m-8 c-6">
                                        <div class="detail" style="margin-left: 15px">
                                            <h1 class="name_prodcut_sell">${detail.name}</h1>

                                            <p class="description">Sản phẩm chất lượng cao đã được kiểm định qua nhiều khách hàng lâu năm và uy tín được sử dụng phổ biến trong các gia đình ngày nay
                                                Một sản phẩm được làm từ gỗ lim, chắn chắn, hoa văn hài hòa với không gian nhà bạn
                                                Giá thành hợp lý và chất lượng tốt chắc chắn sẽ làm hài lòng khách hàng
                                            </p>
                                            <div class="product_sell_price" >
                                                <span>
                                                    ${detail.price}
                                                </span>
                                                <span>
                                                    ${detail.price}
                                                </span>
                                                <span class="product_sale_sell">
                                                    15% Giảm
                                                </span>
                                            </div>
                                            <form  action="cartadd?cid=${detail.id}" method="post">       
                                                <div class="quality">
                                                    <label for="quantity"style="font-size: 20px;
                                                           color: #333;
                                                           font-weight: bold;margin-right: 3px">Số lượng  </label>

                                                    <input type="number" id="quantity" name="quantity" min="1" max="100" value="1" style="width: 50px;height: 25px; " onclick="getValue(value)">
<!--                                                    <input type="text" id="sl" name="value_product" style="width: 50px;height: 25px;">-->

                                                    <!--<input name="user" type="text" class="header_web-input" placeholder="Tên tài khoản">-->
                                                </div>
                                                <div class="buy_now">
                                                    <c:if test="${sessionScope.acc != null}">
                                                        <a href="addcart?cid=${detail.id}">
                                                            <button class="buy_now_a">Mua ngay</button>
                                                        </a>
                                                        <a href="">
                                                            <button class="add_cart" type="submit">Thêm vào giỏ hàng</button>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc == null}">
                                                        <a href="Login.jsp" style="">
                                                            <button class="buy_now_a hover">Mua ngay</button>
                                                        </a>
                                                        <a href="Login.jsp" class="add_cart hover" style="
                                                           background-color: #e9bf12;
                                                           color: #fff;
                                                           padding: 10px 10px;
                                                           margin-right: 15px;
                                                           border: none;
                                                           outline: none;
                                                           cursor: pointer;
                                                           text-decoration: none;
                                                           font-size: 13.33333px;
                                                           font-weight: 600">
                                                            Thêm vào giỏ hàng
                                                        </a>
                                                    </c:if>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="backgroud_img" style="margin-top:100px;">
                                    <hr>
                                    <div class="grid wide">
                                        <h1 class="backgroud_font">
                                            <img src="font\dot.png" alt="">
                                            <span>SẢN PHẨM KHÁC</span>
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
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <div class="hotline" style="border-radius: 25px">
            <a href="">
                <i class="fas fa-phone-volume"></i>
                0528129662
            </a>
        </div>
        <div class="hotline2" style="border-radius: 25px;background-color: #e9bf12">
            <a href="">
                <i class="fas fa-phone-volume"></i>
                0528129662
            </a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
                                                        function changeImage(event) {
                                                            let number = document.getElementById(event).getAttribute('src');
                                                            document.getElementById('result').setAttribute('src', number);
                                                        }
                                                        function getValue(v) {
//                                                                var number = document.getElementById("quantity").value;
                                                            document.getElementById("sl").value = v;
//                                                                $.ajax({
//                                                                    url: "/Template/cartadd?cid=1",
//                                                                    type: "get", //send it through get method
//                                                                    data: {
//                                                                        sl: number;
//                                                                    },
//                                                                    success: function (data) {
////                                                                        
//                                                                    },
//                                                                    error: function (xhr) {
//                                                                        //Do Something to handle error
//                                                                        
//                                                                    }
//                                                                });
                                                        }
    </script>
</body>
</html>
