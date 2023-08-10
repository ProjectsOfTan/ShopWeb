<%-- 
    Document   : updateuser
    Created on : Mar 1, 2023, 11:20:07 AM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông Tin Chi Tiết</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admins.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->
    </head>
    <body>
        <div class="menu">
            <!--<div class="img"><img src="${pageContext.request.contextPath}/image/mainlogo.png"/></div>-->
            <h2 style="color: yellowgreen;font-size: 2.3em;text-align: center">AD<span style="color: #0D98BA;">MIN</span></h2>    
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
                <h2 style="text-align: center;font-family: serif">THÔNG TIN CHI TIẾT</h2>
            </div>
            <div class="body_listuser">
                <div class="adduser_box">
                    <form action="updateuser" method="post" enctype='multipart/form-data'>
                        <div class="upload">
                            <img class="default_img" 
                                 src="${pageContext.request.contextPath}/image/${u.getImage()}"/>
                            <div class="display_img"></div>
                            <div class="round">
                                <input id="input_img" readonly type="file" class="custome" name="image" accept=".jpg, .png"
                                       onchange="getImgPreview(event)">
                                <i class="fa fa-camera" style="color: white"></i>
                            </div>
                        </div>
                        <div class="user_input">
                            <label class="label">Email</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" type="email" readonly value="${u.getEmail()}" required name="email" placeholder="Nhập Email" >
                        </div><br>
                        <div class="user_input">
                            <label class="label">Mật Khẩu</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" 
                                   type="text" name="pass" readonly value="${u.getPass()}">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Họ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" readonly value="${u.getLastname()}" type="text" name="lastname">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Tên</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" readonly type="text" value="${u.getFirtname()}" name="firstname">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Số Điện Thoại</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" readonly type="text" value="${u.getPhone()}" name="phone">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Giới tính</label><br>
                            <c:if test="${u.getGender() == 'Nam'}">
                                <div class="value_user">
                                    <input type="radio" id="Male" readonly value="Male" name="gender" checked>
                                    <label for="Male">Nam</label>
                                    <input type="radio" id="Female" readonly value="Female" name="gender" disabled>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" id="None" readonly value="None" name="gender" disabled>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                            <c:if test="${u.getGender() == 'Nữ'}">
                                <div class="value_user">
                                    <input type="radio" readonly id="Male" value="Male" name="gender"disabled>
                                    <label for="Male">Nam</label>
                                    <input type="radio" readonly id="Female" value="Female" name="gender" checked>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" readonly id="None" value="None" name="gender" disabled>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                            <c:if test="${u.getGender() != 'Nam' && u.getGender() != 'Nữ'}">
                                <div class="value_user">
                                    <input type="radio" readonly id="Male" value="Male" name="gender" disabled>
                                    <label for="Male">Nam</label>
                                    <input type="radio" readonly id="Female" value="Female" name="gender" disabled>
                                    <label for="Female">Nữ</label>
                                    <input type="radio" readonly id="None" value="None" name="gender"  checked>
                                    <label for="None">Khác</label>
                                </div>
                            </c:if>
                        </div><br>
                        <div class="user_input">
                            <label class="label">Ngày sinh</label><br>
                            <input class="value_user" readonly type="date" name="DoB">
                        </div><br>
                        <div class="user_input">
                            <label class="label">Địa chỉ</label><br>
                            <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                            <input class="value_user" readonly value="${u.getAddress()}" type="text" name="address" >
                        </div><br>
                        <div class="user_input">
                            <label class="label">Vai trò</label><br>
                            <div class="value_user">
                                <c:if test="${u.isAdmin() == true}">
                                    <input type="radio" id="Admin" readonly value="Admin" name="IsAdmin" required checked>
                                    <label for="Admin">Admin</label>
                                    <input type="radio" id="User" readonly value="User" name="IsAdmin" >
                                    <label for="User">User</label>
                                </c:if>
                                <c:if test="${u.isAdmin() != true}">
                                    <input type="radio" id="Admin" readonly value="Admin" name="IsAdmin" required>
                                    <label for="Admin">Admin</label>
                                    <input type="radio" id="User" readonly value="User" name="IsAdmin" checked>
                                    <label for="User">User</label>
                                </c:if>
                            </div>
                        </div>
                        <input type="text" id="hide_img" hidden name="inputimage">
                        <input type="submit" onclick="addimg()" value="Lưu" id="btn_adduser">
                    </form>
                </div>
            </div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/testad.js"></script>
    </body>
</html>
