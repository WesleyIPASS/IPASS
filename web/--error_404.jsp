<%-- 
    Document   : error_404
    Created on : 10 Dec, 2012, 2:34:20 AM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPASS - Wesley de Gooijer - 404</title>        
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>
        
        <%
            if (session.getAttribute("user") == null) {// THen new user, show join now
%>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>
        
        <%@include file="includesPage/navigationbar.jsp" %>

        

        <div class="container_16">
            <div class="grid_14 push_1" id="whiteBox" style="padding: 10px;">
                <br/><h1 style="padding: 10px;">Error Status <span class="blue">404</span> - Page Not found!!
                </h1><hr/><br/>
                <p  class="grid_4" style="text-align: right; font-size: 52px;">404</p>
                <p class="grid_7">
                It seems that the page you've requested has not been found or has a broken link
                please check the requested web page again or try again Later!! 
                <br/> We are extremely sorry about the inconvenience for not finding the requested webpage, Please Do co-operate!! We wish you best
                </p>
            </div>
        </div>
    </body>
</html>

