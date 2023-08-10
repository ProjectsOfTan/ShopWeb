<%-- 
    Document   : register_page
    Created on : Mar 4, 2023, 8:28:40 AM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="form-value">
            <form action="register" method="post">
                <h2>ĐĂNG KÝ</h2>
                <c:if test="${invalid != null}" >
                    <div class="error">
                        <p style="color: white ;font-weight: bold;
                           width: 310px;border: 3px solid red;
                           margin: 0px auto;
                           padding: 3px 0px; margin-top: 5px">
                        <ion-icon style="color: red;font-weight: bold" name="close-circle-outline"></ion-icon> 
                            ${invalid}
                        </p>
                    </div>
                </c:if>
                <div class="group">
                    <div class="inputbox-register">
                        <ion-icon name="person"></ion-icon>
                        <input type="text" class="in"
                               name="lastname" required
                               value="${lastname}"
                               title="Họ không chứa chữ số">
                        <label class="la" for="">Họ</label>
                    </div>
                    <div class="inputbox-register">
                        <ion-icon name="person"></ion-icon>
                        <input type="text" class="in"
                               name="firstname" required
                               value="${firstname}"
                               title="Tên không chứa chữ số">
                        <label class="la" for="">Tên</label>
                    </div>
                </div>


                <div id="address" class="inputbox-register">
                    <ion-icon name="home"></ion-icon>
                    <input type="text" class="in"
                           name="address" required
                           value="${address}">
                    <label class="la" for="">Địa chỉ</label>
                </div>



                <div class="group">
                    <div class="inputbox-register">
                        <ion-icon name="mail"></ion-icon>
                        <input type="email" class="in"
                               name="email" required
                               value="${email}">
                        <label class="la" for="">Email</label>
                    </div>
                    <div class="inputbox-register">
                        <ion-icon name="call"></ion-icon>
                        <input type="text" class="in"
                               name="phone" required
                               value="${phone}"
                               title="Số điện thoại có độ dài 10 chữ số">
                        <label class="la" for="">Số điện thoại</label>
                    </div>
                </div>


                <div class="group">
                    <div class="inputbox-register">
                        <ion-icon name="lock-closed"></ion-icon>
                        <input type="password" class="in"
                               name="pass" required
                               value="${pass}"
                               title="Phải bao gồm ít nhất một chữ số và một chữ cái và một chữ cái viết hoa và có độ dài từ 8 đến 15 ký tự">
                        <label class="la" for="">Mật khẩu</label>
                    </div>
                    <div class="inputbox-register">
                        <ion-icon name="lock-closed"></ion-icon>
                        <input type="password" class="in"
                               name="repass" required
                               value="${repass}">
                        <label class="la" for="">Nhập lại mật khẩu</label>
                    </div>
                </div>

                <div class="rules">
                    <label for="">
                        <span><input type="checkbox" name="check" required>Tôi đồng ý với</span>
                        <a href="#">điều khoản dịch vụ & Chính sách bảo mật</a>
                    </label>       
                </div>

                <div class="btn_box">
                    <input type="submit" class="button" id="regis_btn" name="sub" value="Đăng ký">
                </div>

                <div class="login-register">
                    <p>Bạn đã có tài khoản? <a href="login" class="login-link">Đăng nhập</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
