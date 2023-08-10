<%-- 
    Document   : adduser
    Created on : Mar 1, 2023, 8:30:58 AM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admins.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->
    </head>
    <body>
        <div class="menu">
            <div class="img"><img src="${pageContext.request.contextPath}/image/mainlogo.png"/></div>
                <%@include file="adminmenu.jsp" %>
            <i class="fa fa-times" onclick="Remove()"></i>
        </div>
        <div class="container">
            <div class="header">
                <div class="menu_button">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div>
                <h2 style="text-align: center;font-family: serif">THÊM TÀI KHOẢN</h2>
            </div>
            <div class="body_listuser">
                <div class="adduser_box">
                    <form action="adduser" method="post" enctype='multipart/form-data'>
                        <div class="upload">
                            <img class="default_img" 
                                 src="${pageContext.request.contextPath}/image/no-profile-picture-icon-18.jpg"/>
                            <div class="display_img"></div>
                            <div id="display_img" class=""></div>
                            <div class="round">
                                <input id="input_img" type="file" class="custome" name="image" accept=".jpg, .png"
                                       onchange="getImgPreview(event)">
                                <i class="fa fa-camera" style="color: white"></i>
                            </div>
                        </div>
                        <div class="user_input">
                            <label class="label">Email</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="email" required name="email" placeholder="Nhập Email" >
                        </div><br>
                        <div class="user_input">
                            <label class="label">Mật Khẩu</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" 
                                   type="password" required name="pass" 
                                   placeholder="Nhập Mật Khẩu"
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" 
                                   title="Phải bao gồm ít nhất một chữ số và một chữ cái và một chữ cái viết hoa và có độ dài từ 8 đến 15 ký tự">
                                   </div><br>
                                   <div class="user_input">
                            <label class="label">Họ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" required name="lastname" placeholder="Nhập Họ">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Tên</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" required name="firstname" placeholder="Nhập Tên">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Số Điện Thoại</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" required name="phone" placeholder="Nhập Số Điện Thoại">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Giới tính</label><br>
                            <div class="value_user">
                                <input type="radio" id="Male" value="Male" name="gender"  required>
                                <label for="Male">Nam</label>
                                <input type="radio" id="Female" value="Female" name="gender" >
                                <label for="Female">Nữ</label>
                                <input type="radio" id="None" value="None" name="gender" >
                                <label for="None">Khác</label>
                            </div>
                        </div><br>
                        <div class="user_input">
                            <label class="label">Ngày sinh</label><br>
                            <input class="value_user" type="date" name="DoB">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Địa chỉ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="text" required name="address" placeholder="Nhập Mật Khẩu">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Vai trò</label><br>
                            <div class="value_user">
                                <input type="radio" id="Admin" value="Admin" name="IsAdmin" required >
                                <label for="Admin">Admin</label>
                                <input type="radio" id="User" value="User" name="IsAdmin" >
                                <label for="User">User</label>
                            </div>
                        </div>
                        <input type="text" id="hide_img" hidden name="inputimage">
                        <input type="submit" onclick="addimg()" value="Lưu" id="btn_adduser">
                        ${error}
                    </form>
                </div>
            </div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/testad.js"></script>
    </body>
</html>
