<%-- 
    Document   : menuhome
    Created on : Mar 9, 2023, 6:58:15 AM
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
        <ul>
            <li><a href="home?sort=${sort}">TRANG CHỦ</a></li>
            <li><a href="showproduct?chose=0" id="sale_hot">HOT SALE</a></li>
            <li><a href="showproduct?chose=1">NAM</a></li>
            <li><a href="showproduct?chose=2">NỮ</a></li>
            <li><a href="showproduct?chose=3">TRẺ EM</a></li>
        </ul>
    </body>
</html>
