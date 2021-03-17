<%-- 
    Document   : Left
    Created on : 25-Feb-2021, 15:00:28
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col l-3  m-3 c-0">
                            <ul class="product_left">
                                <c:forEach items="${Listc}" var="o">
                                <li class="product_left_items ${Tag == o.cid ? "active":" "}">
                                   <a href="Category?ccid=${o.cid}" >
                                    <span class="product_img_items">
                                        <img src="${o.imageT}" alt="">
                                    </span>
                                    <span class="product_font_items">
                                        ${o.nameT}
                                    </span>
                                   </a>
                                </li>
                                </c:forEach>
                            </ul>

                            <h4 style="font-size: 18px;color: #000000;font-weight: 800; margin: 55px 0px;">TIN MỚI</h4>
                            <div class="li_items_new">
                                <img src="font\n1.jpg" alt="" class="">
                                <p>
                                    <a href="">
                                        Phòng chứa nồi hơi 'lột xác' thành ngôi nhà tuyệt đẹp sau cải tạo
                                    </a>
                                </p>
                            </div>
                            <div class="li_items_new">
                                <img src="font\n1.jpg" alt="" class="">
                                <p>
                                    <a href="">
                                        Phòng chứa nồi hơi 'lột xác' thành ngôi nhà tuyệt đẹp sau cải tạo
                                    </a>
                                </p>
                            </div>
                        </div>
