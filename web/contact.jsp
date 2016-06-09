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
            .error {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
            
            .error:active {
                color:#FFF;
                background: #CC0000;
                box-shadow: 0px 0px 10px #CC0000;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function (){
                
                var usrname = $('#usrname');
                
                usrname.keyup(function (){
                    if (!isNaN(usrname.attr ('value'))){
                        usrname.addClass('error');
                    }else {
                        usrname.removeClass('error');
                    }
                });
                
                //usrname.addClass('error')
        });
        </script>
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
        
        %>
        <jsp:include page="includesPage/navigationbar.jsp"></jsp:include>

        <div class="container_16">
            <div id="whiteBox" style="padding: 10px;">
                <br/>
                <h1>Contacteer ons</h1>
                <hr/>
            </div>
        </div>
        
        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="padding: 10px;">
             
                <div class="grid_7 push_1">
                    <div class="grid_5" id="whiteBox" style="margin: 15px;">
                <div class="grid_5">
                    
                    <div class="grid_3 ">
                        IPASS - Wesley de Gooijer
                    </div>
                    <div class="clear ">
                    </div>
                    <div class="grid_1">
                        Email:
                    </div>
                    <div class="grid_3">
                        wesley.degooijer@student.hu.nl
                    </div>
                    <div class="grid_1">
                        Adres:
                    </div>
                    <div class="grid_3">
                        Nijenoord 1, Utrecht
                    </div>
                    <div class="grid_1">
                        Mobiel:
                    </div>
                    <div class="grid_3">
                        0648393200
                    </div>
                </div>
            </div>
                    <img src="images/slider1.jpg" style="width: 388px;
height: 218px;
margin: 38px 0px;"/>
                     
                </div>
            </div>
        </div>
    </body>
</html>
