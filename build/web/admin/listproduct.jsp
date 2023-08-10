<%-- 
    Document   : listproduct
    Created on : Mar 4, 2023, 10:15:50 AM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Sản Phẩm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admins.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <div class="option">
                <form id="setpage" action="listproductman" method="get">
                    <ion-icon id="search-outline" name="search"></ion-icon>
                    <input type="text" id="input_search" name="key" placeholder="Nhập tên hoặc id hoặc kiểu hoặc màu sắc" value="${key}">
                    <input type="submit" id="button_search" name="button_search" value="Tìm Kiếm">
                    <c:if test="${entryperpage == null || entryperpage == 0}">
                        <c:set var="value" value="6"></c:set>
                    </c:if>
                    <c:if test="${entryperpage != null}">
                        <c:set var="value" value="${entryperpage}"></c:set>
                    </c:if>
                    <label class="show"> Hiển thị <input type="number" onchange="submitNumber()" name="entryperpage" step="1" min="1" max="20" value="${value}"> mục</label>
                </form>
            </div>
            <c:if test="${data.isEmpty()}">
                <h2 style="text-align: center">KHÔNG TÌM THẤY ${key}</h2>
            </c:if>
            <c:if test="${!data.isEmpty()}">
                <div class="body_listuser">
                    <div class="t_box">
                        <div class="div_table">
                            <table class="table_product">
                                <tr>
                                    <th>Id</th>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Kiểu</th>
                                    <th>Màu sắc</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Giảm giá</th>
                                    <th style="width: 15%">Action</th>
                                </tr>
                                <c:forEach items="${data}" var="p">
                                    <tr>
                                        <td>${p.getId()}</td>
                                        <td><img src="${pageContext.request.contextPath}/image/${p.getImg()}" width="80px" height="80px"/></td>
                                        <td>${p.getName()}</td>
                                        <td>${p.getCategory().getName()}</td>
                                        <td>${p.getColor()}</td>
                                        <td>${p.getUnit_in_stock()}</td>
                                        <td>${p.getUnit_price()}</td>
                                        <td>${p.getDiscount()}</td>
                                        <td class="table_user_action">
                                            <a href="updateproduct?id=${p.getId()}">
                                                <ion-icon name="create"></ion-icon>
                                            </a>&nbsp;&nbsp;&nbsp;
                                            <a href="#" onclick="Del('${p.getId()}', '${page}', '${key}', '${entryperpage}', '${data.size()}')">
                                                <ion-icon class="delete" name="trash-sharp"></ion-icon>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="page_user">
                                <input type="hidden" id="pagechecked" value="${page}">
                                <c:forEach begin="${1}" end="${num}" var="i">
                                    <c:if test="${page != null && i == page}">
                                        <a class="pageofuser marked" href="listproductman?page=${i}&key=${key}&entryperpage=${entryperpage}">${i}</a>
                                    </c:if>
                                    <c:if test="${page == null || i != page}">
                                        <a class="pageofuser" href="listproductman?page=${i}&key=${key}&entryperpage=${entryperpage}">${i}</a>
                                    </c:if>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                </div></c:if>
            </div>
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
            <script src="${pageContext.request.contextPath}/js/product.js"></script>
        </body>
    </html>
