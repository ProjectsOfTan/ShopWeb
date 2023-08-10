<%-- 
    Document   : updateaccount
    Created on : Mar 11, 2023, 11:07:20 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông Tin Chi Tiết</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateuser.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" 
              integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

        <div>
            <h2 style="text-align: center;font-family: serif">THÔNG TIN CHI TIẾT</h2>
        </div>
        <div class="body">  
            <div class="body_listuser">
                <div class="adduser_box">
                    <form action="updateuser" method="post" enctype='multipart/form-data'>
                        <div class="upload">
                            <img class="default_img" 
                                 src="${pageContext.request.contextPath}/image/${u.getImage()}"/>
                            <div class="display_img"></div>
                            <div class="round">
                                <input id="input_img" type="file" class="custome" name="image" accept=".jpg, .png"
                                       onchange="getImgPreview(event)">
                                <i class="fa fa-camera" style="color: white"></i>
                            </div>
                        </div>
                        <div class="user_input">
                            <label class="label">Email</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="email" value="${u.getEmail()}"  name="email" placeholder="Nhập Email" >
                        </div><br>
                        <div class="user_input">
                            <label class="label">Mật Khẩu</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" 
                                   type="text" name="pass" value="${u.getPass()}">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Họ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" value="${u.getLastname()}" type="text" name="lastname">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Tên</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" value="${u.getFirtname()}" name="firstname">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Số Điện Thoại</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" value="${u.getPhone()}" name="phone">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Giới tính</label><br>
                            <c:if test="${u.getGender() == 'Nam'}">
                                <div class="value_user">
                                    <input type="radio" id="Male" value="Male" name="gender" checked>
                                    <label for="Male">Nam</label>
                                    <input type="radio" id="Female" value="Female" name="gender" disabled>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" id="None" value="None" name="gender" disabled>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                            <c:if test="${u.getGender() == 'Nữ'}">
                                <div class="value_user">
                                    <input type="radio" id="Male" value="Male" name="gender"disabled>
                                    <label for="Male">Nam</label>
                                    <input type="radio" id="Female" value="Female" name="gender" checked>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" id="None" value="None" name="gender" disabled>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                            <c:if test="${u.getGender() != 'Nam' && u.getGender() != 'Nữ'}">
                                <div class="value_user">
                                    <input type="radio" id="Male" value="Male" name="gender" disabled>
                                    <label for="Male">Nam</label>
                                    <input type="radio" id="Female" value="Female" name="gender" disabled>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" id="None" value="None" name="gender"  checked>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                        </div><br>
                        <div class="user_input">
                            <label class="label">Ngày sinh</label><br>
                            <input class="value_user" type="date" name="DoB">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Địa chỉ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" value="${u.getAddress()}" type="text" name="address" >
                        </div><br>
                        <input type="text" id="hide_img" hidden name="inputimage">
                        <input type="submit" onclick="addimg()" value="Lưu" id="btn_adduser">
                    </form>
                </div>
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
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${pageContext.request.contextPath}/js/testad.js"></script>
</body>
</html>
