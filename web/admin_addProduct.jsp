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
            .highlight {
                box-shadow: inset -10px 0px 10px #666;
                background: #E0E0E0;
                border-radius: 0px 27px 27px 0px;
            }
            
            .blueButton {
                background: -webkit-linear-gradient(top,#00AAC9, #026A84);
            }
            
            
            #buy {
                padding: 30px;
                font-size: 17px;
                -webkit-transition:.3s all ease-in-out;
                -moz-transition:.3s all ease-in-out;
            }
            #buy:hover {
                padding: 30px;
                font-size: 17px;
                box-shadow: inset 0px 2px 17px #444;
            }
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
                    <div class="grid_3">
                        <br/><h1>Voeg product toe</h1>
                    </div>
                <div>
                        
                <div class="grid_3">
                        <br/><h1>Stap 1. Vul Filiaal in</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Stap 2. Vul Categorie in</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Stap 3. Vul Productnaam, Tags in</h1><hr/>
                    </div>
                <div class="grid_3">
                        <br/><h1>Stap 4. Vul Productprijs, Aantal en Productomschrijving in</h1><hr/>
                    </div>
                
                    </div>
                </div>
                <div class="clear"></div>
                <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                    <div class="grid_13">
                        <br/><h1>4 stappen voor het toevoegen van producten...</h1><hr/>
                    </div>
                    
                    <div class="grid_7">
                        <a style="
border: 1px solid black;
box-shadow: 0px 2px 10px #333;" href="admin_addProduct_1.jsp" class="grid_5 push_2" id="buy">Start het toevoegen van producten...</a>
                    </div>
                </div>
                    
        </div>
        
    </body>
</html> 
