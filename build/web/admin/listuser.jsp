<%-- 
    Document   : listuser
    Created on : Feb 28, 2023, 11:02:25 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Người Dùng</title>
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
                <form id="setpage" action="listuser" method="get">
                    <ion-icon id="search-outline" name="search"></ion-icon>
                    <input type="text" id="input_search" name="key" placeholder="Tìm Kiếm" value="${key}">
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
                            <table class="table_user">
                                <tr>
                                    <th>Ảnh đại diện</th>
                                    <th>
                                        <a href="#">
                                            Email

                                            <ion-icon class="swap-vertical" name="swap-vertical"></ion-icon>
                                        </a>
                                    </th>
                                    <th>Mật Khẩu</th>
                                    <th style="width: 16%">
                                        <a href="#">
                                            Họ và Tên
                                            <ion-icon class="swap-vertical" name="swap-vertical"></ion-icon>
                                        </a>
                                    </th>
                                    <th>Số điện thoại</th>
                                    <th style="width: 10%">
                                        <a href="#">
                                            Địa chỉ
                                            <ion-icon class="swap-vertical" name="swap-vertical"></ion-icon>
                                        </a>
                                    </th>
                                    <th>Vai trò</th>
                                    <th style="width: 15%">Action</th>
                                </tr>
                                <c:forEach items="${data}" var="i">
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/image/${i.getImage()}" alt="alt"/></td>
                                        <td>${i.getEmail()}</td>
                                        <td>${i.getPass()}</td>
                                        <td>${i.getLastname()}&nbsp;${i.getFirtname()}</td>
                                        <td>${i.getPhone()}</td>
                                        <td>${i.getAddress()}</td>
                                        <td>${i.isAdmin()}</td>
                                        <td class="table_user_action">
                                            <a href="updateuser?email=${i.getEmail()}">
                                                <ion-icon name="eye-sharp"></ion-icon>
                                            </a>&nbsp;&nbsp;&nbsp;
                                            <a href="#" onclick="Delete('${i.getEmail()}', '${page}', '${key}', '${entryperpage}', '${data.size()}')">
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
                                        <a class="pageofuser marked" href="listuser?page=${i}&key=${key}&entryperpage=${entryperpage}">${i}</a>
                                    </c:if>
                                    <c:if test="${page == null || i != page}">
                                        <a class="pageofuser" href="listuser?page=${i}&key=${key}&entryperpage=${entryperpage}">${i}</a>
                                    </c:if>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/testad.js"></script>
    </body>
</html>