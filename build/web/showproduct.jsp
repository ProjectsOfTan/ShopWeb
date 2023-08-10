<%-- 
    Document   : showproduct
    Created on : Mar 15, 2023, 10:58:40 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show.css"/>
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
                                <ion-icon name="cart">
                                </ion-icon>
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
                                        <li><a href="salehistory">ĐƠN MUA</a></li>
                                        </c:if>
                                    <li><a href="logout">ĐĂNG XUẤT</a></li>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
                                
        <h2 class="title">${title}</h2>
        
        <div class="body">
            <div class="filter">
                <div class="filter_box">
                    <form id="fr" action="showproduct" method="post">
                        <input type="hidden" name="chose" value="${chose}">
                        <input type="hidden" name="key" value="${key}">
                        <div class="cate_container">
                            <div class="title_cate">
                                Loại sản phẩm
                            </div>
                            <div class="cate_pro_box">
                                <c:set var="count" value="0"/>
                                <c:forEach var="l" items="${lcate}">
                                    <c:if test="${l.getId() != cate[count]}">
                                        <div class="cate_pro">
                                            <input onchange="Filter()" id="${l.getName()}" type="checkbox" name="cate" value="${l.getId()}">
                                            <label for="${l.getName()}">${l.getName()}</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${l.getId() == cate[count]}">
                                        <div class="cate_pro">
                                            <input checked onchange="Filter()" id="${l.getName()}" type="checkbox" name="cate" value="${l.getId()}">
                                            <label for="${l.getName()}">${l.getName()}</label>
                                        </div>
                                        <c:set var="count" value="${count+1}"/>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="size_container">
                            <div class="title_cate">
                                Kích thước
                            </div>
                            <div class="cate_pro_box">
                                <c:set var="count1" value="0"/>
                                <c:forEach var="l" items="${lsize}">
                                    <c:if test="${l.getId() != si[count1]}">
                                        <div class="cate_pro">
                                            <input onchange="Filter()" id="${l.getSize()}" type="checkbox" name="size" value="${l.getId()}">
                                            <label for="${l.getSize()}">${l.getSize()}</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${l.getId() == si[count1]}">
                                        <div class="cate_pro">
                                            <input checked onchange="Filter()" id="${l.getSize()}" type="checkbox" name="size" value="${l.getId()}">
                                            <label for="${l.getSize()}">${l.getSize()}</label>
                                        </div>
                                        <c:set var="count1" value="${count1+1}"/>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="color_container">
                            <div class="title_cate">
                                Màu sắc
                            </div>
                            <div class="cate_pro_box">
                                <c:set var="count1" value="0"/>
                                <c:forEach var="l" items="${listcolor}">
                                    <c:if test="${l != color[count1]}">
                                        <div class="cate_pro">
                                            <input onchange="Filter()" id="${l}" type="checkbox" name="color" value="${l}">
                                            <label for="${l}">${l}</label>
                                        </div>
                                    </c:if>
                                    <c:if test="${l == color[count1]}">
                                        <div class="cate_pro">
                                            <input onchange="Filter()" id="${l}" type="checkbox" name="color" value="${l}">
                                            <label for="${l}">${l}</label>
                                        </div>
                                        <c:set var="count1" value="${count1+1}"/>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="Price_container">
                            <div class="title_cate">
                                Khoảng giá (VNĐ)
                            </div>
                            <div class="cate_pro_box">
                                <div class="cate_pro">
                                    <input onchange="Filter()" id="pri" type="radio" name="price" value="1">
                                    <label for="pri">Từ 350.000đ - 500.000đ</label>
                                </div>
                                <div class="cate_pro">
                                    <input onchange="Filter()" id="pri1" type="radio" name="price" value="2">
                                    <label for="pri1">Từ 500.000đ - 700.000đ</label>
                                </div>
                                <div class="cate_pro">
                                    <input onchange="Filter()" id="pri2" type="radio" name="price" value="3">
                                    <label for="pri2">Lớn hơn 700.000đ</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="list_product">
                <c:set var="i" value="0"/>
                <c:forEach var="l" items="${list}">
                    <div class="product_item_box">
                        <span class="discount">-${l.getDiscount()}%</span>
                        <div class="product_item">
                            <a href="detailproduct?id=${l.getId()}">
                                <div class="img">
                                    <img src="${pageContext.request.contextPath}/image/${l.getImg()}" alt="alt"/>
                                </div>
                                <div class="name_product">
                                    ${l.getName()}
                                </div>

                                <div class="price_product">
                                    <c:if test="${l.getDiscount() == '0'}">
                                        <span class="price_notdiscount">${l.getUnit_price()}đ</span>
                                    </c:if>
                                    <c:if test="${l.getDiscount() != '0'}">
                                        <span class="after_discount">${listaftersale.get(i)}đ</span>
                                        <span class="price_unit">${l.getUnit_price()}đ</span>
                                    </c:if>
                                </div>

                            </a>
                            <div class="add_product" 
                                 onclick="detail('${l.getId()}')">
                                <p>Chi tiết sản phẩm</p>
                            </div>
                        </div>
                    </div>
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
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
        <script src="${pageContext.request.contextPath}/js/show.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
