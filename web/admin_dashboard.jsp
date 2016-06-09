<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>IPASS - Wesley de Gooijer</title>
        <jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

        <%@page import="java.sql.*, database.*" %>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <!--<link rel="stylesheet" type="text/css" href="css/lightbox.css"  />-->

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        
        <script src="js/myScript.js"></script>
        
        
        <style type="text/css">
            .adminMenu {
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 0px;
                background: #FFF;
                box-shadow: 0px 0px 10px #333;
            }
            .adminMain {
                margin-top: 10px;
                margin-bottom: 10px;
                background: #FFF;
                box-shadow: 0px -1px 10px #333;
            }
            #leftside {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        
        <%
        if (session.getAttribute("user") == null ){// THen new user, show join now
            %>
            <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%
        }
        
        if (session.getAttribute("admin")== null){
            response.sendRedirect("admin.jsp");
        }
        %>
        <jsp:include page="includesPage/navigationbar.jsp"></jsp:include>
        

        <div class="container_16">
            <div class="grid_16" style="padding: 10px;" id="whiteBox">
                    <br/>
                <h1 class="grid_15">Beheerder Dashboard</h1><hr/>
                <a href="admin_manageProduct.jsp" id="buy"  class="grid_15">Beheer producten</a>    
                <a href="admin_addProduct.jsp" id="buy"  class="grid_15">Voeg product toe</a> 
           </div>
                <div class="clear"></div>
            <!--Loading the AJAX API-->
                <script type="text/javascript" src="js/gclibrary/jsapi.js"></script>
                <script type="text/javascript" src="js/gclibrary/core.js"></script>
                <script type="text/javascript" src="js/gclibrary/core1.js"></script>
                
                <jsp:include page="includesPage/gChartings/gChart_ComboLine.jsp"></jsp:include>
                
                <div class="grid_13">
                    <jsp:include page="includesPage/gChartings/gCharts_top10Products_viewed.jsp"></jsp:include>
                </div>
        
    </body>
</html>
