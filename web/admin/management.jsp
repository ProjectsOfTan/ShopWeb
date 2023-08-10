<%-- 
    Document   : management
    Created on : Feb 28, 2023, 8:25:40 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý</title>
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
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/testad.js"></script>

    </body>
</html>
