<%-- 
    Document   : order_detail
    Created on : Mar 15, 2023, 9:17:40 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order_detail.css"/>
    </head>
    <body>
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
                                <ion-icon name="cart" class="ion_cart">
                                </ion-icon>
                            </a>
                        </div>
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
                    </div>
                </div>
            </div>
        </div>

        <!--body-->
        <div class="body">
            <div class="container">
                <div class="product_box">
                    <div class="header">
                        <div class="sp">Sản phẩm</div>
                        <div class="dg">Đơn giá</div>
                        <div class="slg">Số lượng</div>
                        <div class="tt">Tổng tiền</div>
                    </div>
                    <c:set var="count" value="0"/>
                    <c:forEach items="${data}" var="i">
                        <div class="product_item">
                            <div class="img_name">
                                <div class="img_pro">
                                    <a href="detailproduct?id=${i.getProduct().getId()}">
                                        <img src="${pageContext.request.contextPath}/image/${i.getProduct().getImg()}" alt="alt"/> 
                                    </a>
                                </div>
                                <div class="name_product">
                                    <a href="detailproduct?id=${i.getProduct().getId()}">
                                        <p class="name_item">${i.getProduct().getName()}</p>
                                    </a>
                                    <p class="att_item">${i.getProduct().getColor()}/${i.getSize()}</p>
                                </div>
                            </div>
                            <c:if test="${i.getProduct().getDiscount() != '0'}">
                                <div class="price_box">
                                    <div class="sale" id="s${i.getProduct().getId()}${i.getSize()}">${listaftersale.get(count)}đ</div>
                                    <div class="before_sale">${i.getProduct().getUnit_price()}đ</div>
                                </div>
                                <c:set var="count" value="${count+1}"/>
                            </c:if>
                            <c:if test="${i.getProduct().getDiscount() == '0'}">
                                <div class="price_box">
                                    <div class="sale" id="s${i.getProduct().getId()}${i.getSize()}">${i.getProduct().getUnit_price()}đ</div>
                                </div>
                            </c:if>

                            <div class="quantity">
                                ${i.getQuantity()}
                            </div>

                            <div class="price_per_item">
                                ${i.getPrice()}đ
                            </div>   

                        </div>
                    </c:forEach>
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
        <script src="${pageContext.request.contextPath}/js/history.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
