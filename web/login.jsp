<%-- 
    Document   : login
    Created on : Feb 27, 2023, 10:39:35 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_register_forget_style.css"/>
        <title>Đăng Nhập</title>
    </head>
    <body>
        <section>
            <div class="form-box">
                <%@include file="login_form.jsp"%>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/login_register_forge.js"></script>
    </body>
</html>
