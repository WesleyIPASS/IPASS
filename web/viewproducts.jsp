<%@page import="java.util.ArrayList"%>
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
            <div id = "contents">
                <div id="leftside" class="grid_3">
                    
                    <%
                        String category, subcategory;
                        StringBuffer sql = new StringBuffer();
                        sql.append("SELECT * FROM  `products` p "
                                        + "INNER JOIN  `images` i "
                                        + "USING (  `product-name` ) ");
                        
                        category = "";
                        subcategory = "";
                        if(session.getAttribute("cat") != null ){
                            category = (String) session.getAttribute("cat");
                            ArrayList subCat = product.getSubcategory(category);
                                
                            %>
                            <div>
                                <ul id="leftsideNav">
                                    <li><a href="#"><strong>Sub-Categorieën</strong></a></li>
                            <%
                            for (int i =0; i< subCat.size(); i++){
                                %>
                                <li><a href="addProductFilters.jsp?scat=<%= subCat.get(i) %>"><%= subCat.get(i) %></a></li>      
                                <%
                            } subCat.clear(); %>
                                </ul>
                            </div>
                       
                             <%
                            if (session.getAttribute("scat") != null){
                                subcategory = (String) session.getAttribute("scat");
                                
                            }
                        } else {
                            //Show Category
                            ArrayList Cat = product.getCategory();
                            %>
                            <div>
                                <ul id="leftsideNav">
                                    <li><a href="#"><strong>Categorieën</strong></a></li>
                            <%
                            for (int i =0; i< Cat.size(); i++){
                                %>
                                <li><a href="addProductFilters.jsp?cat=<%= Cat.get(i) %>"><%= Cat.get(i) %></a></li>      
                                <%
                            } Cat.clear();
                            %>
                                </ul>
                            </div>
                            <%
                        }
                    %>
                </div>
            </div>

            <div id="middle"class="grid_13">
                <div class="grid_13" id="whiteBox">
                    <div class="ProductHeading">
                        <div class="grid_12">
                                <h2 class="heading">Producten >
                                    <%= category %> 
                                    <%= subcategory %>
                                </h2>
                        </div>
                        
                    </div>
                    <div class="grid_12 productListing">
                        
                        <div class="clear"></div>
                        <%
                            if (session.getAttribute("cat") != null){
                                category = (String)session.getAttribute("cat");
                                
                                sql.append(" WHERE  `category-name` =  '"+category+"' ");
                                %>
                                    <div class="grid_4 ">
                                        <a id="greenBtn" href="removeProductFilter.jsp?cat=<%= category %>">Category : <%= category %> [x]</a>
                                    </div>
                                <%
                                
                                %>

                                    <%
                                        if (session.getAttribute("scat") != null){
                                            subcategory = (String)session.getAttribute("scat");
                                            sql.append(" AND  `sub-category-name` =  '"+subcategory+"' ");
                                            %>
                                                <div class="grid_4 ">
                                                    <a id="greenBtn" href="removeProductFilter.jsp?scat=<%= subcategory %>">Sub-Category : <%= subcategory %> [x]</a>
                                                </div>
                                            <%
                                        }
                                    %>
                                <%
                            }
                        %>
                        
                        <%
                        DB_Conn con = new DB_Conn();
                        Connection c = con.getConnection();
                        Statement st = c.createStatement();
                        ResultSet rs ;
                         if (sql.toString().equalsIgnoreCase("SELECT * FROM  `products` p "
                                                            + "INNER JOIN  `images` i "
                                                            + "USING (  `product-name` ) "
                                                            )){
                            
                            String newSQL  = "SELECT * FROM  `products` p "
                                            + "INNER JOIN  `images` i "
                                           + "USING (  `product-name` ) "
                                            + " WHERE `product_qty` > 0 "
                                          +" GROUP BY  `product-name` "
                                         + " ORDER BY  `hits` DESC  ";
                         rs= st.executeQuery(newSQL);
                         }else { 
                            
                        sql.append(" AND `product_qty` > 0  "
                                + " GROUP BY  `product-name` "
                                + " ORDER BY  `hits` DESC  ");
                            rs= st.executeQuery(sql.toString());                        
                         }
                        

                            while (rs.next()) {
                                String product_id = rs.getString("product_id");

                                String product_name = rs.getString("product-name");

                                String sub_category_name = rs.getString("sub-category-name");

                                String category_name = rs.getString("category-name");

                                String company_name = rs.getString("company-name");

                                String price = rs.getString("price");

                                String summary = rs.getString("summary");

                                String image_name = rs.getString("image-name");
                    %>
                        <div class="clear"></div>
                        <div class="grid_2">
                            <a href="product.jsp?id=<%=product_id%>"><img src="<%= image_name %>" /></a>
                        </div>
                        <div class="grid_9">
                            <div class="grid_5">
                                <p id="info"><a href="product.jsp?id=<%=product_id%>"><h3><span class="blue"> <%=product_name %></span></h3></a>Door <%= company_name+" "+ category_name %><br/><span class="red">&euro; <%= price %></span></p>
                            </div>
                            <div class="grid_3 push_2">
                                <p><%=sub_category_name %>  <a href="addtoOrder.jsp?id=<%= product_id %>" id="greenBtn">Voeg toe aan bestellijst</a></p>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <%
                                }
                            rs.close();
                            st.close();
                            c.close();
                        %>

                    </div>
                </div>
            </div>
            <!--The Middle Content Div Closing -->
        </div>
        <!--The Center Content Div Closing -->
<jsp:include page="includesPage/_footer.jsp"></jsp:include>

    </body>
</html>
