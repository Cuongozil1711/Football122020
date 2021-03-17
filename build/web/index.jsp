<%-- 
    Document   : index
    Created on : 22-Feb-2021, 16:12:57
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Trang chủ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/grid.css">
        <link rel="stylesheet" href="Css/stylew1.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="font\fontawesome-free-5.15.2-web\css\all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
        <style>
            .items_product img{
                width: 100%;
                height: 275px;
                background-color: #f1f1f1;
                animation: fadein ease-in .5s!important;
                transition: width 2s ease 0s;
    -moz-transition: width 2s ease 0s;
    -webkit-transition: width 2s ease 0s;
    -o-transition: width 2s ease 0s;
    -ms-transition: width 2s ease 0s;
            }
            .items_product img:hover{
                transform: scale(1.05);
            }
            .items_product{
                border: 1px solid #f1f1f1;
                box-shadow: 0 1px 3px -2px rgb(0 0 0 / 12%), 0 1px 2px rgb(0 0 0 / 24%);
            }
            .list_product{
                padding: 15px 10px;
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
                                        <span>Sản Phẩm</span>
                                        <img src="font\dot.png" alt="">
                                    </h1>
                                    <div class="row">
                                    <c:forEach items="${Listp}" var="o">
                                        <div class="col l-4 m-4 c-6" style="margin-bottom: 50px">
                                            <div class="items_product">
                                                <img src="${o.image}" alt="">
                                                <p style="text-align: center;color: #333333;font-weight: bold;font-size: 15px">

                                                    ${o.name}

                                                </p>
                                                <div class="list_product">
                                                    <button class="product_name_1" style="background-color: #e9bf12;border: none;padding: 5px 5px;">
                                                        <a href="detail?iid=${o.id}">
                                                            Mua ngay
                                                        </a>
                                                    </button>
                                                    <div class="product_name_2">
                                                        <span>
                                                            ${o.price} $
                                                        </span>

                                                    </div>
                                                </div>
                                                <span class="product_sale">
                                                    0%
                                                </span>
                                            </div>
                                        </div>
                                    </c:forEach>
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
</body>
</html>
