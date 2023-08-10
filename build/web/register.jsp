<%-- 
    Document   : register
    Created on : Mar 3, 2023, 7:35:27 AM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_register_forget_style.css"/>
        <title>Đăng Ký</title>
    </head>
    <body>
        <section>
            <div class="register-form-box">
                <%@include file="register_form.jsp"%>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/js/login_register_forge.js"></script>
    </body>
</html>
