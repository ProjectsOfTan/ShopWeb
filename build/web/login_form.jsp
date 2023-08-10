<%-- 
    Document   : login
    Created on : Mar 3, 2023, 7:51:07 AM
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
            <form action="login" method="post">
                <h2>ĐĂNG NHẬP</h2>
                <c:if test="${invalid != null}" >
                    <p style="color: white ;font-weight: bold;text-align: center;width: 310px;border: 3px solid red;padding: 3px 0px; margin-top: 5px">
                    <ion-icon style="color: red;font-weight: bold" name="close-circle-outline"></ion-icon> 
                        ${invalid}
                    </p>
                </c:if>
                <c:if test="${invalid == null}" >
                    <div class="inputbox">
                        <ion-icon name="mail"></ion-icon>
                        <input type="text" class="in" name="email"
                               required
                               value="${cookie.cuser.value}">
                        <label class="la" for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed"></ion-icon>
                        <input class="in" type="password" name="pass"
                               value="${cookie.cpass.value}" 
                               required
                               title="Phải bao gồm ít nhất một chữ số và một chữ cái và một chữ cái viết hoa và có độ dài từ 8 đến 15 ký tự">
                        <label class="la" for="">Mật khẩu</label>
                    </div>
                </c:if>
                <c:if test="${invalid != null}" >
                    <div class="inputbox">
                        <ion-icon name="mail"></ion-icon>
                        <input type="text" class="in" name="email" oninput="position(0)" 
                               value="${email}">
                        <label class="la" for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed"></ion-icon>
                        <input class="in" type="password" name="pass" value="${pass}" 
                               oninput="position(1)"
                               title="Phải bao gồm ít nhất một chữ số và một chữ cái và một chữ cái viết hoa và có độ dài từ 8 đến 15 ký tự">
                        <label class="la" for="">Mật khẩu</label>
                    </div>
                </c:if>
                <div class="forget">
                    <label for=""><input type="checkbox" ${cookie.crem!=null?'checked':''} name="rem" value="ON">Ghi nhớ tài khoản</label> 
                    <a href="#">Quên mật khẩu</a>
                </div>
                <input type="submit" class="button" name="sub" value="Đăng nhập">
                <div class="login-register">
                    <p>Khách hàng mới? <a href="register" class="register-link">Tạo tài khoản</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
