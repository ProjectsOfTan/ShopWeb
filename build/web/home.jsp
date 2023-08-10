<%-- 
    Document   : home
    Created on : Feb 27, 2023, 10:36:52 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" 
              integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homecss.css"/>
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
                        <a href="home?sort=${sort}" style="text-decoration: none;color: black">
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

        <!--slider-->
        <div class="slider_container">
            <div class="slider">
                <!--image slider start-->
                <div class="slider_img">
                    <div class="images">
                        <!--radio buttons start-->
                        <input type="radio" class="slide" name="slide" id="img1" checked>
                        <input type="radio" class="slide" name="slide" id="img2">
                        <input type="radio" class="slide" name="slide" id="img3">
                        <input type="radio" class="slide" name="slide" id="img4">
                        <!--radio buttons end-->
                        <!--slide images start-->
                        <img src="image/img1.jpg" class="m1" alt="img1"/>
                        <img src="image/img2.jpg" class="m2" alt="img2"/>
                        <img src="image/img3.webp" class="m3" alt="img3"/>
                        <img src="image/img4.webp" class="m4" alt="img4"/>
                        <!--slide images end-->
                    </div>
                </div>
            </div>
            <div class="dots">
                <label for="img1" class="manual-btn"></label>
                <label for="img2" class="manual-btn"></label>
                <label for="img3" class="manual-btn"></label>
                <label for="img4" class="manual-btn"></label>
            </div>
        </div>
        <!--end slider-->

        <!--body-->
        <div class="body">
            <div>
                <form id="frm" action="home" method="get">
                    <c:if test="${sort != null && sort == 'incre'}">
                        <input type="radio" checked id="incre" onclick="submit()" name="sort" value="incre">
                        <label for="incre">Tăng dần</label>
                        <input type="radio" id="decre" onclick="submit()" name="sort" value="decre">
                        <label for="decre">Giảm dần</label>
                    </c:if>
                    <c:if test="${sort != null && sort == 'decre'}">
                        <input type="radio" id="incre" onclick="submit()" name="sort" value="incre">
                        <label for="incre">Tăng dần</label>
                        <input type="radio" checked id="decre" onclick="submit()" name="sort" value="decre">
                        <label for="decre">Giảm dần</label>
                    </c:if>
                    <c:if test="${sort == null}">
                        <input type="radio" id="incre" onclick="submit()" name="sort" value="incre">
                        <label for="incre">Tăng dần</label>
                        <input type="radio" id="decre" onclick="submit()" name="sort" value="decre">
                        <label for="decre">Giảm dần</label>
                    </c:if>
                </form>
            </div>
            <c:if test="${list != null}">
                <div class="sort_container">
                    <div class="sort_box">
                        <div class="list_product">
                            <c:set var="i" value="0"/>
                            <c:forEach var="l" items="${list}">
                                <div class="product_item_box">
                                    <div class="product_item">
                                        <a href="detailproduct?id=${l.getId()}">
                                            <div class="img">
                                                <img src="${pageContext.request.contextPath}/image/${l.getImg()}" alt="alt"/>
                                            </div>
                                            <div class="name_product">
                                                ${l.getName()}
                                            </div>

                                            <div class="price_product">
                                                <span class="price_notdiscount">${l.getUnit_price()}đ</span>

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
                </div>
            </c:if>


            <div class="hot_sale_container">
                <h1 style="font-family: Sofia, sans-serif;text-align: center">
                    HOT SALE 
                </h1>
                <div class="slick_slide_container">
                    <div class="slick_slide">
                        <c:set var="i" value="0"/>
                        <c:forEach begin="1" end="10" var="ls" items="${listsale}">
                            <div class="product_item_box">
                                <div class="product_item">
                                    <a href="detailproduct?id=${ls.getId()}">
                                        <div class="discount">
                                            -${ls.getDiscount()}%
                                        </div>
                                        <div class="img">
                                            <img src="${pageContext.request.contextPath}/image/${ls.getImg()}" alt="alt"/>
                                        </div>
                                        <div class="name_product">
                                            ${ls.getName()}
                                        </div>
                                        <div class="price">
                                            <span class="after_discount">
                                                ${listaftersale.get(i)}đ
                                            </span>
                                            <span class="price_unit">${ls.getUnit_price()}đ</span>
                                        </div>
                                    </a>
                                    <div class="add_product" 
                                         onclick="detail('${ls.getId()}')">
                                        <p>Chi tiết sản phẩm</p>
                                    </div>
                                </div>
                            </div>
                            <c:set var="i" value="${i+1}"/>
                        </c:forEach>
                    </div>   
                </div>
            </div>

            <!--Male-->
            <div class="male_container">
                <h1 style="font-family: Sofia, sans-serif;text-align: center">
                    QUẦN ÁO NAM
                </h1>
                <div class="slick_slide_container">
                    <div class="slick_slide">
                        <c:forEach begin="0" end="9" var="lm" items="${listmale}">
                            <div class="product_item_box">
                                <div class="product_item">
                                    <a href="detailproduct?id=${lm.getId()}">
                                        <div class="img">
                                            <img src="${pageContext.request.contextPath}/image/${lm.getImg()}" alt="alt"/>
                                        </div>
                                        <div class="name_product">
                                            ${lm.getName()}
                                        </div>
                                        <div class="price">
                                            <span class="price_unit">${lm.getUnit_price()}đ</span>
                                        </div>
                                    </a>
                                    <div class="add_product" 
                                         onclick="detail('${lm.getId()}')">
                                        <p>Chi tiết sản phẩm</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>   
                </div>
            </div>
        </div>

        <!--Female-->
        <div class="female_container">
            <h1 style="font-family: Sofia, sans-serif;text-align: center">
                QUẦN ÁO NỮ
            </h1>
            <div class="slick_slide_container">
                <div class="slick_slide">
                    <c:forEach begin="0" end="9" var="lf" items="${listfemale}">
                        <div class="product_item_box">
                            <div class="product_item">
                                <a href="detailproduct?id=${lf.getId()}">
                                    <div class="img">
                                        <img src="${pageContext.request.contextPath}/image/${lf.getImg()}" alt="alt"/>
                                    </div>
                                    <div class="name_product">
                                        ${lf.getName()}
                                    </div>
                                    <div class="price">
                                        <span class="price_unit">${lf.getUnit_price()}đ</span>
                                    </div>
                                </a>
                                <div class="add_product" 
                                     onclick="detail('${lf.getId()}')">
                                    <p>Chi tiết sản phẩm</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>   
            </div>
        </div>

        <!--Child-->
        <div class="child_container">
            <h1 style="font-family: Sofia, sans-serif;text-align: center">
                QUẦN ÁO TRẺ EM
            </h1>
            <div class="slick_slide_container">
                <div class="slick_slide">
                    <c:forEach begin="0" end="9" var="ld" items="${listchild}">
                        <div class="product_item_box">
                            <div class="product_item">
                                <a href="detailproduct?id=${ld.getId()}">
                                    <div class="img">
                                        <img src="${pageContext.request.contextPath}/image/${ld.getImg()}" alt="alt"/>
                                    </div>
                                    <div class="name_product">
                                        ${ld.getName()}
                                    </div>
                                    <div class="price">
                                        <span class="price_unit">${ld.getUnit_price()}đ</span>
                                    </div>
                                </a>
                                <div class="add_product" 
                                     onclick="detail('${ld.getId()}')">
                                    <p>Chi tiết sản phẩm</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>   
            </div>
        </div>
    </div>
    <!--endbody-->
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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/home.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
            integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
            integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
