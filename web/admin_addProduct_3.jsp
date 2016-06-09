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
         
            
<%
    if (productBean.getCompany() == null || 
            productBean.getCompany()  == ""){
        response.sendRedirect("admin_addProduct_1.jsp");
    }
    else if ( productBean.getCategory() == null || 
                    productBean.getCategory()  == "" ||
                    productBean.getSubcategory()  == null || 
                    productBean.getSubcategory()  == "" ){
        response.sendRedirect("admin_addProduct_2.jsp");
    }
%>
            
<style type="text/css">
    .error {
        box-shadow: 0px 0px 7px #CC0000;
    }
</style>
<script type="text/javascript">
    $(document).ready (function (){
        var next= $('.next');
        var name= $('#productName');
        var tags= $('#tags');
        
        name.keyup(function (){
            if ((name.attr('value').indexOf('\'') != -1)){
                name.addClass('error');
                next.attr ('disabled', true);
            } else {
                name.removeClass('error');
                next.attr ('disabled', false);
            }
            var valueTag = name.attr('value');
            tags.val(valueTag);
        });
        tags.keyup(function (){
            if ((tags.attr('value').indexOf('\'') != -1)){
                tags.addClass('error');
                next.attr ('disabled', true);
            }else {
                tags.removeClass('error');
                next.attr ('disabled', false);
            }
        });
    });
</script>
         <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                
                <div class="grid_13">
                    <br/><h1>Step 3. Voer productnaam, tags in</h1><hr/>
                </div>

                <div class="clear"></div>
                <form method="post" action="admin_addProduct_controller.jsp">
                    <input type="hidden" name="company" value="<%= productBean.getCompany() %>"/>
                    <input type="hidden" name="category" value="<%= productBean.getCategory() %>"/>
                    <input type="hidden" name="subCategory" value="<%= productBean.getSubcategory() %>"/>
                    <input type="hidden" name="page" value="admin_addProduct_4.jsp"/>

                    <div class="grid_4">
                        <h3>Voer productnaam in </h3>
                    </div>
                    <div class="grid_5">
                        <input id="productName" type="text" name= "productName"  placeholder="Productnaam" required/><br/>
                        
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_4">
                        <h3>Voer product tags in [niet verplicht]</h3>
                    </div>
                    <div class="grid_5">
                        <textarea id="tags" name= "tags" placeholder="Voeg tags toe zonder komma's" required></textarea>
                    </div>
                    
                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="buy" class="next" type="submit" value="Volgende >"/>
                    </div>
                </form>

            </div>

        </div>

    </body>
</html>
