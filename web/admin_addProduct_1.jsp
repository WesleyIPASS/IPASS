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
                  
            <%
                DB_Conn conn = new DB_Conn();
                Connection con = conn.getConnection();
                Statement st = con.createStatement();
                String sql_getCompany = "SELECT  `company-name` FROM  `company`;";
            %>
            
            
                <jsp:useBean class="product.productBean" scope="session" id="productBean"></jsp:useBean>
                
            <div class="grid_13"  style="padding: 10px 0px;" id="whiteBox">
                <div class="grid_13">
                    <br/><h1>Stap 1. Selecteer het filiaal, of voeg er 1 toe</h1><hr/>
                </div>
                <div class="clear"></div>
                <form method="post" action="admin_addProduct_controller.jsp">
                    <input type="hidden" name="page" value="admin_addProduct_2.jsp"/>
                    <div class="grid_2">
                        <h3>Selecteer filiaal</h3>
                    </div>
                    <div class="grid_5">
                        <select name="company" id="company">

                            <option value="" selected>Selecteer een filiaal</option>

                            <%
                                ResultSet company = st.executeQuery(sql_getCompany);
                                while (company.next()) {
                                    String companyName = company.getString("company-name");
                            %>

                            <option value="<%= companyName%>"><%= companyName%></option>

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
                        <h4 id="step1Feedback" class="grid_8 center">-------------------------------------------------------------<br/></h4>

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_2">
                        <h3>Voeg filiaal toe</h3>
                    </div>
                    <div class="grid_5">
                        <input id="companyName" type="text" name= "companyName" placeholder="Filiaal naam"/>
                    </div>
                    <div class="grid_2">

                    </div>
                    <div class="clear"></div><br/>
                    <div class="grid_7">
                        <input id="addProductNameBtn" class="buy" type="button" value="Voeg filiaal toe"/>

                    </div>
                    <div class="grid_5">
                        <input id="buy" type="submit" value="Volgende >"/>
                    </div>
                </form>

            </div>

        </div>

    </body>
</html>
