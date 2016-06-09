<%@page import="cart.cart"%>
<%@page import="user.user"%>
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
            
            #leftside {
                cursor: pointer;
                position: fixed;
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
        
            user User;
            String printName = null;
            if ((session.getAttribute("user") == null)) {
                response.sendRedirect("index.jsp");
            } else {
                User = (user) session.getAttribute("user");
                String email = User.getUserEmail();
                String userName = User.getUsername();
                int uid = User.getUserId();

                if (userName == null){
                    printName = email;
                }
                else {
                    printName = userName;
                }
           
        %>

        <jsp:include page="includesPage/navigationbar.jsp"></jsp:include>
        

        <div class="container_16">
            <div class="grid_13 push_3" id="whiteBox">
                <div  class="grid_13">
                    <h1  style ="text-align: center; padding: 10px 0px 0px 0px;">Hallo <%= printName %></h1>  
                    <p  style ="text-align: center;"> 
                       Vul hier uw aanvullende gegevens in om bestellingen te kunnen doen op de applicatie
                    </p>
                </div>
            </div>
                
            
                <div id="whiteBox" class="grid_13 push_3">
                    
                 <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;" class="grid_12 MyOrders">
                        
                     <h1 style ="padding: 10px 0px 10px 0px;">Mijn bestellingen</h1>  
                    
                        <div id="CartTable" style="padding:10px 00px" class="grid_12">
                                    <div class="grid_1">
                                         <h3>Bestelnummer</h3>
                                    </div> 
                                    <div class="grid_7">
                                        <h3 class="push_3">Bestelbeschrijving</h3> 
                                            <div class="clear"></div>
                                            <div class="grid_4">
                                                Gerecht 
                                            </div>
                                            <div class="grid_2">
                                                Prijs en aantal
                                            </div>
                                    </div>
                                    <div class="grid_3 push_1">
                                        <h3>Datum</h3>
                                    </div>
                            
                                    <div class="clear"></div>
                                    
                                    <%
                                    String sql = "SELECT  `order_id` ,  `product_name` ,  `product_price` ,  `product_quantity` ,  `sold_on` "
                                                +" FROM  `order` o "
                                                +" INNER JOIN  `sales` s "
                                                +" USING (  `order_id` ) "
                                                +" WHERE o.`user_id` = "+uid+" "
                                                + " ORDER BY `order_id` DESC ";
                                    
                                    Connection c = new DB_Conn().getConnection();
                                    
                                    PreparedStatement psmt = 
                                            c.prepareStatement(sql);
                                    
                                    ResultSet rs = psmt.executeQuery();
                                    
                                    int oldOrder = 0;
                                    int newOrder;
                                    
                                    String product_name;
                                    double product_price;
                                    int product_quantity;
                                    Date sold_on_date;
                                    Time sold_on_time;
                                    
                                    while (rs.next()){
                                        newOrder = rs.getInt("order_id");
                                        product_name = rs.getString("product_name");
                                        product_price = rs.getDouble("product_price");
                                        product_quantity = rs.getInt("product_quantity");
                                        sold_on_time = rs.getTime("sold_on");
                                        sold_on_date = rs.getDate("sold_on");
                                        String orderDateArr [] = sold_on_date.toString().split("-");
                                        
                                        String billNo = "";
                                        for (int i= orderDateArr.length-1; i>= 1; i--){
                                            billNo += orderDateArr[i];
                                        }
                                        billNo+= newOrder;
                                        if (oldOrder == newOrder){
                                            // Dont Draw border Type II order Div
                                            %>

                                            <!-- Type II Order -->
                                            <div class="grid_12">
                                                <div class="push_1">
                                                    <div class="grid_7">
                                                            <div class="grid_4 ">
                                                                <a href="product.jsp?id="></a>
                                                                <%= product_name %>
                                                            </div>
                                                            <div class="grid_2">
                                                                &euro; <%= product_price %> x<%= product_quantity %>
                                                            </div>
                                                    </div>
                                                    <div class="grid_3">
                                                         <%= sold_on_date %> : <%= sold_on_time %>
                                                    </div>
                                                </div>
                                            </div>

                                            <%
                                        }else {
                                            // Draw New Order Type I order Div
                                            %>

                                            <!-- Type I Order -->
                                            <div class="grid_12"  style="border-top: 2px #444 solid;">
                                                <div  class="grid_1">
                                                    <a class="blue" href="showMyBill.jsp?oid=<%= newOrder %>"><%= billNo %></a>
                                                </div>
                                                <div class="grid_7">
                                                        <div class="grid_4 ">
                                                            <%= product_name %> 
                                                        </div>
                                                        <div class="grid_2">
                                                            &euro; <%= product_price %> x<%= product_quantity %>
                                                        </div>
                                                </div>
                                                <div class="grid_3">
                                                    <%= sold_on_date %> : <%= sold_on_time %>
                                                </div>
                                            </div>
                                            <div class="clear"></div>

                                            <%
                                        }
                                        oldOrder = newOrder;
                                    }
                                    
                                    %>
                        </div>
                 </div>
                 <div class="clear"></div>
                    <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;" class="grid_9 push_1 Account">
                        <h1 style ="padding: 10px 0px 10px 0px;">Gebruikersinfo</h1>  
                    
                        <%
                            if (User.getUsername() == null) {
                                %>
                        <form method="post" action="addUserDetalsServlet">
                            <div class="grid_3">
                                Naam
                            </div>
                            <div class="grid_5">
                                <input type="text" name="username" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Geslacht
                            </div>
                            <div class="grid_5">
                                <select name="gender" required>
                                    <option value="male">Man</option>
                                    <option value="female">Vrouw</option>
                                </select>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Mobiele nummer
                            </div>
                            <div class="grid_5">
                                <input type="text" name="mobileNum" maxlength="10" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Adres
                            </div>
                            <div class="grid_5">
                                <textarea name="address" required></textarea>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Plaatsf
                            </div>
                            <div class="grid_5">
                                <input type="text" value="Nederland" disabled/><br/> Wij accepteren geen bestellingen buiten Nederland <br/><br/>
                                <input type="submit" id="greenBtn" value="Add Details"/>
                            </div>
                            <div class="clear"></div><br/>
                        </form>
                            <%
                            }else {
                                       %>
                      <form method="post" action="addUserDetalsServlet">
                            <div class="grid_3">
                                Naam
                            </div>
                            <div class="grid_5">
                                <input type="text" name="username" value="<%= User.getUsername()%>" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Geslacht
                            </div>
                            <div class="grid_5">
                                <select name="gender" required>

                                    <%
                                        if (User.getGender().equals("male")) {
                                    %>
                                    <option value="male" selected>Man</option>
                                    <option value="female">Vrouw</option>
                                    <%        } else {
                                    %>
                                    <option value="male">Man</option>
                                    <option value="female" selected >Vrouw</option>

                                    <%                            }
                                    %>
                                </select>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Mobiele nummer
                            </div>
                            <div class="grid_5">
                                <input type="text" name="mobileNum"  value="<%= User.getMobileNum()%>" required/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Adres
                            </div>
                            <div class="grid_5">
                                <textarea name="address" required><%= User.getAddress()%></textarea>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Plaats
                            </div>
                            <div class="grid_5">
                                <input type="text" value="Nederland" disabled/><br/> Wij accepteren geen bestellingen buiten Nederland <br/><br/>
                                <input type="submit" id="greenBtn" value="Verander accountinformatie"/>
                            </div>
                            <div class="clear"></div><br/>
                        </form>
                        <% 
                            }
                        %>
                        
                    </div>
                 <div class="clear"></div>
                 
                 
                 
                 
                 
                 <div  style ="text-align: center; border-top: 20px #444 solid; padding: 10px 0px 10px 0px;" class="grid_9 push_1 Settings">
                        
                     <h1 style ="padding: 10px 0px 10px 0px;">Instellingen</h1>  
                    
                        <form method="post" action="changeMyPass">
                            <div class="grid_3">
                                E-mail 
                            </div>
                            <div class="grid_5">
                                <input type="text" name="email" value="<%= User.getUserEmail() %>" disabled/>
                            </div>
                            <div class="clear"></div><br/>
                            <div class="grid_3">
                                Wachtwoord
                            </div>
                            <div class="grid_5">
                                <input type="password" name="pass" /><br/><br/> 
                                <input id="greenBtn" type="submit" value="Verander wachtwoord"/>
                            </div>
                            <div class="clear"></div><br/>
                        </form>
                    </div>
                 <div class="clear"></div>
                </div>
        </div>
        <%
        //This is else closing of the top if checking of User Logged In...
        }        
%>
        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
    </body>
</html>
