<%-- 
    Document   : updateproduct
    Created on : Mar 8, 2023, 7:06:03 AM
    Author     : wth0z
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h2 id="tsp" style="text-align: center;font-family: serif">SỬA THÔNG TIN SẢN PHẨM</h2>
                <h3 style="text-align: center;font-family: serif;color: #45b6fe;">${successfull}</h3>
            </div>
            <div class="body_listuser">
                <div class="adduser_box">
                    <div class="option">
                        <form action="updateproduct" method="post" enctype='multipart/form-data'>
                            <input type="hidden" name="id" value="${p.getId()}">
                            <div class="user_input">
                                <label class="label">Tên Sản Phẩm</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" value="${p.getName()}" type="text" required name="name" placeholder="Nhập Tên Sản Phẩm" >
                            </div><br>
                            <div class="user_input">
                                <label class="label">Kiểu</label><br>
                                <div class="select">
                                    <select class="format_product" id="format" name="type">
                                        <option disabled>Kiểu</option>
                                        <option selected value="${p.getCategory().getName()}">${p.getCategory().getName()}</option>
                                        <c:forEach var="cate" items="${data}">
                                            <c:if test="${cate.getName() != p.getCategory().getName()}">
                                                <option value="${cate.getName()}">${cate.getName()}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div><br>
                            <div class="user_input">
                                <label class="label">Màu Sắc</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input class="value_user" value="${p.getColor()}" type="text" required name="color" placeholder="Nhập Màu Sắc">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Kích thước</label><br>
                                <table class="table_pro">
                                    <c:set var="count" value="0" scope="page"/>
                                    <c:set var="t" value="0" scope="page"/>
                                    <c:forEach var="s" items="${size}">
                                        <c:if test="${count%3==0}">
                                            <tr>
                                            </c:if>
                                            <c:if test="${p.getListsize().get(t).getSize() != s.getSize()}">
                                                <td>
                                                    <input id="${s.getSize()}" onchange="checkrequired()" 
                                                           class="size_product" value="${s.getId()}" 
                                                           type="checkbox" name="size">
                                                    <label for="${s.getSize()}">${s.getSize()}</label>
                                                </td>
                                            </c:if>
                                            <c:if test="${p.getListsize().get(t).getSize() == s.getSize()}">
                                                <td>  
                                                    <input id="${s.getSize()}" onchange="checkrequired()" 
                                                           class="size_product" value="${s.getId()}" 
                                                           type="checkbox" name="size" checked>
                                                    <label for="${s.getSize()}">${s.getSize()}</label>
                                                </td>
                                                <c:if test="${t+1<p.getListsize().size()}">
                                                    <c:set var="t" value="${t + 1}" scope="page"/>
                                                </c:if>
                                            </c:if>
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
                                <input value="${p.getUnit_price()}" 
                                       class="value_user" type="text"
                                       required name="price" placeholder="Nhập Giá">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Số Lượng</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input value="${p.getUnit_in_stock()}" 
                                       class="value_user" type="number" min="0" max="100" 
                                       required name="quantity" placeholder="Nhập Số Lượng">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Đối Tượng</label><br>
                                <div class="value_user">
                                    <c:if test="${p.getOb().getOb() == 'Nam'}">
                                        <input type="radio" id="Male" checked value="Nam" name="object"  required>
                                        <label for="Male">Nam</label>
                                        <input type="radio" id="Female" value="Nữ" name="object" >
                                        <label for="Female">Nữ</label>
                                        <input type="radio" id="None" value="Trẻ Em" name="object" >
                                        <label for="None">Trẻ Em</label>
                                    </c:if>
                                    <c:if test="${p.getOb().getOb() == 'Nữ'}">
                                        <input type="radio" id="Male" value="Nam" name="object"  required>
                                        <label for="Male">Nam</label>
                                        <input type="radio" id="Female" checked value="Nữ" name="object" >
                                        <label for="Female">Nữ</label>
                                        <input type="radio" id="None" value="Trẻ Em" name="object" >
                                        <label for="None">Trẻ Em</label>
                                    </c:if>
                                    <c:if test="${p.getOb().getOb() == 'Trẻ em'}">
                                        <input type="radio" id="Male" value="Nam" name="object"  required>
                                        <label for="Male">Nam</label>
                                        <input type="radio" id="Female" value="Nữ" name="object" >
                                        <label for="Female">Nữ</label>
                                        <input type="radio" id="None" checked value="Trẻ Em" name="object" >
                                        <label for="None">Trẻ Em</label>
                                    </c:if>
                                    <c:if test="${p.getOb().getOb() != 'Trẻ em'
                                                  &&p.getOb().getOb() != 'Nữ'
                                                  &&p.getOb().getOb() != 'Nam'}">
                                          <input type="radio" id="Male" value="Nam" name="object"  required>
                                          <label for="Male">Nam</label>
                                          <input type="radio" id="Female" value="Nữ" name="object" >
                                          <label for="Female">Nữ</label>
                                          <input type="radio" id="None" value="Trẻ Em" name="object" >
                                          <label for="None">Trẻ Em</label>
                                    </c:if>
                                </div>
                            </div><br>
                            <div class="user_input">
                                <label class="label">Giảm Giá</label><br>
                                <ion-icon class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <input value="${p.getDiscount()}" class="value_user" 
                                       type="number" name="discount" 
                                       required placeholder="Nhập Giảm Giá" min="0" max="100">
                            </div><br>
                            <div class="user_input">
                                <label class="label">Mô Tả</label><br>
                                <ion-icon id="textarea" class="pencil-sharp" name="pencil-sharp"></ion-icon>
                                <textarea class="value_user" name="desc" required="re" id="id" name="name" rows="8" cols="67" placeholder="Nhập Mô Tả">${des.trim()}</textarea>
                            </div><br>
                            <input type="text" id="hide_img" hidden name="inputimage" value="${p.getImg()}">
                            <div class="form_upload">
                                <div class="image_upload" data-text="${p.getImg()}">
                                    <input type="file" id="inputimage" name="fileimage" multiple accept=".jpg, .png">
                                </div>
                            </div>
                            <br><input type="submit" id="btn_adduser" onclick="addimg()" value="Lưu">
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
