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
            if (session.getAttribute("user") == null) {// THen new user, show join now
%>
        <jsp:include page="includesPage/_joinNow.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        
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
         <jsp:useBean class="product.productBean" scope="session" id="productBean"></jsp:useBean>
         
<style type="text/css">
    .error {
        box-shadow: 0px 0px 7px #CC0000;
        background: #CC0000;
    }
</style>
<script type="text/javascript">
    $(document).ready(function (){
        var qty = $('#productQty');
        var price = $('#price');
        var summary = $('#summary');
        var next= $('.next');
    
        qty.change(function (){
            if (isNaN(qty.attr('value'))){
                qty.addClass('error');
                qty.css('background', 'red');
                next.attr('disabled', true);
            }else {
                if (qty.attr('value')<0){
                    qty.addClass('error');
                    qty.css('background', 'red');
                    next.attr('disabled', true);
                }else {
                    qty.removeClass('error');
                    next.attr('disabled', false);
                }
            }
        });
        price.change(function (){
            if (isNaN(price.attr('value'))){
                price.addClass('error');
                    price.css('background', 'red');
                next.attr('disabled', true);
            }else {
                if (price.attr('value')<0){
                    price.addClass('error');
                    price.css('background', 'red');
                    next.attr('disabled', true);
                }else {
                    price.removeClass('error');
                    next.attr('disabled', false);
                }
            }
        });

    
        
    });
</script>
            <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                <div class="grid_13">
                    <br/><h1>Stap 4. Voer productprijs, aantal, en productomschrijving in</h1><hr/>
                </div>
                <form method="post" action="admin_addProduct_controller.jsp">
                    <input type="hidden" name="company" value="<%= productBean.getCompany() %>"/>
                    <input type="hidden" name="category" value="<%= productBean.getCategory() %>"/>
                    <input type="hidden" name="subCategory" value="<%= productBean.getSubcategory() %>"/>
                    <input type="hidden" name="productName" value="<%= productBean.getName() %>"/>
                    <input type="hidden" name="tags" value="<%= productBean.getTags() %>"/>
                    <input type="hidden" name="page" value="admin_addProduct_Insert.jsp"/>

                    <div class="grid_4">
                        <h3>Product Prijs : &euro; </h3>
                    </div>
                    <div class="grid_5">
                        <input id="price" type="number" name= "price" min="1" placeholder="bijv. 50" required/><br/>
                       
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_4">
                        <h3>Voer aantal in met cijfers</h3>
                    </div>
                    <div class="grid_5">
                        <input id="productQty" type="number" min="1" name= "productQty"  placeholder="Aantal in afgeronde cijfers" required/><br/>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_4">
                        <h3>Voer productomschrijving in</h3>
                    </div>
                    <div class="grid_5">
                        <textarea id="summary" cols="40" rows="20" name="summary" class="grid_6" required></textarea>
                    </div>

                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="buy" class="next" type="submit" value="Volgende >" disabled/>
                    </div>
                </form>
            </div>

        </div>

    </body>
</html>
