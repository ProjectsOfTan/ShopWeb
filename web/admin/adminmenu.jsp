<%-- 
    Document   : adminmenu
    Created on : Feb 28, 2023, 3:16:59 PM
    Author     : wth0z
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý</title>
    </head>
    <body>
        <div class="menu-container">
            <ul class="ul-parent">
                <li class="tk">
                    <a href="home">
                        <ion-icon name="home-sharp"></ion-icon>
                        <span>Home</span>
                    </a>
                </li>
                <li class="tk">
                    <a href="#">
                        <ion-icon name="stats-chart-sharp"></ion-icon>
                        <span>Thống kê</span>
                    </a>
                </li>
                <li>
                    <ul class="ql">
                        <li id="cqltk" class="list" onmouseover="show(0)" onmouseout="hide(0)">
                            <ion-icon name="people-sharp"></ion-icon>
                            <span>Quản lý tài khoản</span>
                            <i class="arrow" id="a1"></i>
                            <ul class="ht">
                                <li><a href="listuser">Danh sách tài khoản</a></li>
                            </ul>
                        </li>
                        <li id="cqlsp" class="list" onmouseover="show(1)" onmouseout="hide(1)">
                            <ion-icon name="cart-sharp"></ion-icon>
                            <span>Quản lý sản phẩm </span>
                            <i class="arrow" id="a2"></i>
                            <ul class="ht">
                                <li><a href="addproduct">Thêm sản phẩm</a></li>
                                <li><a href="listproductman">Danh sách sản phẩm</a></li>
                            </ul> 
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </body>
</html>
