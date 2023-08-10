<%-- 
    Document   : detailproduct
    Created on : Mar 12, 2023, 1:52:57 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detailproduct.css"/>
    </head>
    <body>
        <!--menu-->
        <div class="menu">
            <div class="contact">
                <div class="mail_contact">
                    <ion-icon name="mail"></ion-icon>
                    <label>admin@gmail.com</label>
                </div>
                <div class="phone_contact">
                    <ion-icon name="call"></ion-icon>
                    <label>+8412-345-6789</label>
                </div>
            </div>
            <div class="container_fix">
                <div class="navigation">
                    <%@include file="menuhome.jsp"%>
                </div>
                <div class="name_shop">
                    <div class="name">
                        <a href="home" style="text-decoration: none;color: black">
                            <h2 style="font-family: Sofia, sans-serif;margin: 0;text-align: center">
                                Fashion Shop
                            </h2> 
                        </a>
                    </div>
                    <div class="search">
                        <form action="action">
                            <input type="text" name="search">
                            <button type="submit">
                                <ion-icon name="search"></ion-icon>
                            </button>
                        </form>
                    </div>
                    <div class="cart_login">
                        <div class="cart">
                            <a href="show" class="cart_lb">
                                <p class="si_co">${size}</p>
                                <ion-icon name="cart"></ion-icon>
                            </a>
                        </div>
                        <c:if test="${sessionScope.account == null}">
                            <div class="person">
                                <a class="icon_login" href="login"><ion-icon name="person"></ion-icon></a>
                                <ul class="login_register">
                                    <li><a href="login.jsp">ĐĂNG NHẬP</a></li>
                                    <li><a href="register">ĐĂNG KÝ</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <div class="person_logined">
                                <a id="account_img" href="updateaccount" style="border: none;
                                   color: black">
                                    <img class="person_img" src="${pageContext.request.contextPath}/image/${sessionScope.account.getImage()}" alt="alt"/>
                                    <label style="cursor: pointer">${sessionScope.account.getFirtname()}</label>
                                </a>
                                <ul class="after_login">
                                    <li><a href="updateaccount">TÀI KHOẢN CỦA TÔI</a></li>
                                        <c:if test="${sessionScope.account.isAdmin() == 'Admin'}">
                                        <li><a href="management">QUẢN LÝ</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.account.isAdmin() != 'Admin'}">
                                        <li><a href="login">ĐƠN MUA</a></li>
                                        </c:if>
                                    <li><a href="logout">ĐĂNG XUẤT</a></li>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!--body-->
        <div class="body">
            <div class="container">
                <div class="img_desc">
                    <div class="img_pro">
                        <img src="${pageContext.request.contextPath}/image/${data.getImg()}" alt="alt"/>
                    </div>
                </div>
                <div class="attribute_pro">
                    <form action="action">
                        <div class="name_product">
                            <h1 style="font-size: 2.8em;margin-bottom: 10px;color: #EF036C ">
                                ${data.getName()}
                            </h1>
                        </div>

                        <div class="price_product">
                            <c:if test="${data.getDiscount() == 0}">
                                <span class="price_notdiscount">${data.getUnit_price()}đ</span>
                            </c:if>
                            <c:if test="${data.getDiscount() != 0}">
                                <span class="after_discount">${aftersalse}đ</span>
                                <span class="price_unit">${data.getUnit_price()}đ</span>
                                <span class="discount">GIẢM ${data.getDiscount()}%</span>
                            </c:if>
                        </div>

                        <div class="desc_box">
                            <h3>ĐẶC ĐIỂM NỔI BẬT:</h3>
                            <ul>
                                <c:forEach varStatus="i" begin="0" end="${fn:length(data.getDesc())-1}" step="1">
                                    <li>${data.getDesc()[i.index]}</li>
                                    </c:forEach>
                            </ul>
                        </div>

                        <div class="color_product">
                            <p>Màu sắc: <span style="font-weight: bold">${data.getColor()}</span></p>
                            <div class="img_current"
                                 title="${data.getColor()}">
                                <img src="${pageContext.request.contextPath}/image/${data.getImg()}"
                                     title="${lp.getColor()}" alt="alt"/>
                            </div>
                            <c:forEach var="lp" items="${listpro}">
                                <a class="img_item" href="detailproduct?id=${lp.getId()}">
                                    <img src="${pageContext.request.contextPath}/image/${lp.getImg()}"
                                         title="${lp.getColor()}" alt="alt"/>
                                </a>
                            </c:forEach>
                        </div>

                        <div class="size_product">
                            <p>Kích thước: <span class="show_size" style="font-weight: bold"></span></p>
                            <div class="list_size">
                                <c:forEach varStatus="i" var="ls" items="${data.getListsize()}">
                                    <div class="size" 
                                         onclick="choseSize('${ls.getSize()}', '${i.index}', '${data.getListsize().size()}')"
                                         onmouseover="setColor('${i.index}')"
                                         onmouseout="remove('${i.index}')">
                                        <span style="display: inline-block; margin: 0 auto;">${ls.getSize()}</span> 
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        
                            <h3 class="notice"></h3>

                        <div class="quan_btn">
                            <div class="quantity">
                                <button id="decre" type="button" onclick="stepper(this)"> - </button>
                                <input step="1" type="number" name="quantity" 
                                       min="1" id="my_input" value="1" 
                                       max="${quan}"
                                       onchange="stepper(this)">
                                <button id="incre" type="button" onclick="stepper(this)"> + </button>
                            </div> 
                            <div class="btn">
                                <input type="button" onclick="exec('${data.getId()}')" 
                                       name="buy" value="Thêm vào giỏ hàng">
                            </div>   
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--footer-->
        <div class="footer">
            <div class="contact_footer">
                <div class="footer-widget">
                    <h2>THÔNG TIN CỬA HÀNG</h2>
                    <div class="contact-info">
                        <p><i class="fa fa-map-marker"></i>Hà Đông, Hà Nội</p>
                        <p><i class="fa fa-envelope"></i>admin@gmail.com</p>
                        <p><i class="fa fa-phone"></i>+8412-345-6789</p>
                    </div>
                </div>
            </div>
            <div class="contact_internet">
                <div class="footer-widget">
                    <h2>THEO DÕI CHÚNG TÔI TRÊN</h2>
                    <div class="contact-info">
                        <div class="social">
                            <a href="#">
                                <ion-icon name="logo-twitter"></ion-icon></a>
                            <a href="#">
                                <ion-icon name="logo-facebook"></ion-icon></i></a> 
                            <a href="#">
                                <ion-icon name="logo-linkedin"></ion-icon></a> 
                            <a href="#">
                                <ion-icon name="logo-instagram"></ion-icon></a> 
                            <a href="#">
                                <ion-icon name="logo-youtube"></ion-icon></a></div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
                integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="${pageContext.request.contextPath}/js/detailproduct.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
