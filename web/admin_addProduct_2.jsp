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
        <script type="text/javascript">
            $(document).ready (function (){
                $('#selectMenuCategory').click(function (){
                    var category = $(this).attr('value');
                    //alert ("Aargh " +getCategory);
                    $.get('getProductSubCategory', 
                    { category: category}, 
                    function (data){
                        $('#selectMenuSubCategory').html(data);
                    });
                });
            });
        </script>
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
            <!--Loading the AJAX API-->
            <script type="text/javascript" src="js/gclibrary/jsapi.js"></script>
            <script type="text/javascript" src="js/gclibrary/core.js"></script>
            <script type="text/javascript" src="js/gclibrary/core1.js"></script>

         <jsp:useBean class="product.productBean" scope="session" id="productBean"></jsp:useBean>
         
         
<%
    DB_Conn conn = new DB_Conn();
    Connection con = conn.getConnection();
    Statement st = con.createStatement();
    String sql_getCategory = "SELECT  `category_name` FROM  `category`; ";
    String sql_getSubCategory = "SELECT  `sub-category_name` FROM  `sub-category`;";

    if (productBean.getCompany() == null || 
            productBean.getCompany()  == ""){
        response.sendRedirect("admin_addProduct_1.jsp");
    }
%>
            

            <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                <div class="grid_13">
                    <br/><h1>Step 2. Vul categorie in</h1><hr/>
                </div>
                <div class="clear"></div>
                <form method="post" action="admin_addProduct_controller.jsp">
                    <input type="hidden" name="company" value="<%= productBean.getCompany() %>">
                    <input type="hidden" name="page" value="admin_addProduct_3.jsp">
                    <div class="grid_2">
                        <h3>Selecteer categorie</h3>
                    </div>
                    <div class="grid_5">
                        <select id="selectMenuCategory" name="category">
                            <option value="" selected="">Selecteer categorie</option>
                                        <% 
                                            ResultSet rs = st.executeQuery(sql_getCategory);
                                            while (rs.next()) {
                                                String category = rs.getString("category_name");
                                        %>
                                        <option value="<%= category%>"><%= category%></option>
                                        <%
                                            }
                                        %>
                        </select>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Of
                    </div>
                    <div class="grid_5">
                        <h4 id="step2Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        <h3>Voeg categorie toe</h3>
                    </div>
                    <div class="grid_5">
                        <input id="categoryName" type="text" name= "categoryName" tabindex="1" placeholder="bijv. Sushi, Groenten enz."/>
                    </div>
                    <div class="grid_2">

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="addCategoryNameBtn" class="buy" type="button" value="Voeg categorie toe"/>
                    </div>
                    <div class="clear"></div>
                    <div class="grid_2">
                        <h3>Selecteer sub-categorie</h3>
                    </div>
                    <div class="grid_5">
                        <select id="selectMenuSubCategory" name="subCategory">
                            <option value="" selected="">Selecteer sub-categorie</option>
                                            <%

                                                ResultSet subCategory = st.executeQuery(sql_getSubCategory);

                                                while (subCategory.next()) {
                                                    String subCat = subCategory.getString("sub-category_name");
                                            %>

                                            <option value="<%= subCat%>"><%= subCat%></option>

                                            <%
                                                }
                                                st.close();
                                            %>
                        </select>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        Of
                    </div>
                    <div class="grid_5">
                        <h4 id="step2Feedback1" class="grid_8 center">-------------------------------------------------------------<br/></h4>
                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        <h3>Voeg sub-categorie toe</h3>
                    </div>
                    <div class="grid_5">
                        <input id="SubCategoryName"  type="text" name= "SubCategoryName" tabindex="1" placeholder="bijv. Rijst, Wasabi enz."/></div>
                    <div class="grid_2">

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="addSubCategoryBtn" class="buy" type="button" value="Voeg sub-categorie toe"/>
                    </div>
                    <div class="grid_5">
                        <input id="buy" type="submit" value="Volgende >"/>
                    </div>
                </form>
            </div>

        </div>

    </body>
</html>
