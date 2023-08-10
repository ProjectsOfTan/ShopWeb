<%-- 
    Document   : addproduct
    Created on : Mar 4, 2023, 4:17:59 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
                <h2 id="tsp" style="text-align: center;font-family: serif">THÊM SẢN PHẨM</h2>
                <h3 style="text-align: center;font-family: serif;color: #45b6fe;">${successfull}</h3>
            </div>
            <div class="body_listuser">
                <div class="adduser_box">
                    <div class="option">
                        <form action="addproduct" method="post" enctype='multipart/form-data'>
                            <div class="user_input">
                                <label class="label">Tên Sản Phẩm</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" type="text" required name="name" placeholder="Nhập Tên Sản Phẩm" >
                            </div><br>
                            <div class="user_input">
                                <label class="label">Kiểu</label><br>
                                <div class="select">
                                    <select class="format_product" id="format" name="type" required>
                                        <option selected disabled>Kiểu</option>
                                        <c:forEach var="cate" items="${data}">
                                            <option value="${cate.getName()}">${cate.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div><br>
                            <div class="user_input">
                                <label class="label">Màu Sắc</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" type="text" required name="color" placeholder="Nhập Màu Sắc">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Kích thước</label><br>
                                <table class="table_pro">
                                    <c:set var="count" value="0" scope="page"/>
                                    <c:forEach var="s" items="${size}">
                                        <c:if test="${count%3==0}">
                                            <tr>
                                            </c:if>
                                            <td>
                                                <input id="${s.getSize()}" required onchange="checkrequired()" 
                                                       class="size_product" value="${s.getId()}" 
                                                       type="checkbox" name="size">
                                                <label for="${s.getSize()}">${s.getSize()}</label>
                                            </td>
                                            <c:if test="${count%3==2}">
                                            </tr>
                                        </c:if>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                </table>
                            </div><br>
                            <div class="user_input">
                                <label class="label">Giá</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" type="text" required name="price" placeholder="Nhập Giá">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Số Lượng</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" type="number" required name="quantity" placeholder="Nhập Số Lượng">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Đối Tượng</label><br>
                                <div class="value_user">
                                    <input type="radio" id="Male" value="Nam" name="object"  required>
                                    <label for="Male">Nam</label>
                                    <input type="radio" id="Female" value="Nữ" name="object" >
                                    <label for="Female">Nữ</label>
                                    <input type="radio" id="None" value="Trẻ Em" name="object" >
                                    <label for="None">Trẻ Em</label>
                                </div>
                            </div><br>
                            <div class="user_input">
                                <label class="label">Giảm Giá</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" type="number" name="discount" required placeholder="Nhập Giảm Giá" min="0" max="100">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Mô Tả</label><br>
                                <ion-icon id="textarea" class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <textarea class="value_user" name="desc" required="re" id="id" name="name" rows="8" cols="67" placeholder="Nhập Mô Tả"></textarea>
                            </div><br>
                            <input type="text" id="hide_img" hidden name="inputimage">
                            <div class="form_upload">
                                <div class="image_upload" data-text="Chọn ảnh">
                                    <input type="file" value="" id="inputimage" name="fileimage" multiple accept=".jpg, .png" required >
                                </div>
                            </div>
                            <br><input style="cursor: pointer" type="submit" id="btn_adduser" onclick="addimg()" value="Lưu">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/product.js"></script>

    </body>
</html>
