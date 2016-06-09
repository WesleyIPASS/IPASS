<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>IPASS - Wesley de Gooijer - bestellijst</title>
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

        <style type="text/css">
            #loginBtn {
                margin:15px auto;
                padding:5px;
                color:#FFF;
                border-radius:5px;
                background: #333333; /* Old browsers */
                background: -moz-linear-gradient(top,  #333333 0%, #000000 100%); /* FF3.6-15 */
                background: -webkit-linear-gradient(top,  #333333 0%,#000000 100%); /* Chrome10-25,Safari5.1-6 */
                background: linear-gradient(to bottom,  #333333 0%,#000000 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
                text-align:center;
                -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);
                -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27);

            }
            #loginBtn:hover {
                color:#FFF;
                border-radius:7px;
                text-align:center;
                background: #333333; /* Old browsers */
                background: -moz-linear-gradient(top,  #333333 0%, #000000 100%); /* FF3.6-15 */
                background: -webkit-linear-gradient(top,  #333333 0%,#000000 100%); /* Chrome10-25,Safari5.1-6 */
                background: linear-gradient(to bottom,  #333333 0%,#000000 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
                cursor:pointer;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="cart" scope="session" class="cart.cart"></jsp:useBean>

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
            <div class="grid_16" id="whiteBox">
                <div class="grid_8 push_3" >
                    <h1 class="push_2" style="padding:10px 00px">Gerechten in bestellijst</h1>

                    <%
                        user User = new user();
                        session.getAttribute("user");
                        User = (user) session.getAttribute("user");
                        if (session.getAttribute("user") == null) {
                    %>
                    <h3 class="showForm" id="loginBtn" style="padding:10px 00px">Login voordat je gaat bestellen...</h3>
                    <% } else { %>
                    <h3 class="push_2" ></h3>
                    <%
                        String sid = request.getParameter("id");
                        int id;
                        if (request.getParameter("id") == null) {
                            response.sendRedirect("addtoOrder_view.jsp");
                        } else {
                            id = Integer.parseInt(sid);

                            boolean b = cart.addProduct(id);

                            if (b == true) {
                                out.println("Gerecht toegevoegd");
                            } else {
                                out.println("Niet toegevoegd");
                            }

                            ArrayList<String> productNames = new ArrayList();
                            ArrayList<Double> productPrices = new ArrayList();
                            ArrayList<Integer> Qty = new ArrayList();
                            ArrayList<Integer> ids = new ArrayList();

                            productNames = cart.getProductNames();
                            productPrices = cart.getPrices();
                            Qty = cart.getQty();
                            ids = cart.getId();
                    %>


                    <div id="CartTable" style="padding:10px 00px" class="grid_11">
                        <div class="grid_5">
                            <h2>Gerechtnaam</h2> 
                        </div>
                        <div class="grid_2">
                            <h2>Prijs</h2>
                        </div>
                        <div class="grid_2">
                            <h2>Aantal<br><br></h2>
                        </div>

                        <%
                            for (int i = 0; i < productNames.size(); i++) {
                        %>

                        <div class="grid_5">
                            <%=productNames.get(i)%>
                        </div>
                        <div class="grid_2">
                            &euro; <%=productPrices.get(i)%>
                        </div>
                        <div class="grid_1">
                            x<%=Qty.get(i)%>
                        </div>
                        <div class="grid_2">
                            &euro; <%= Qty.get(i) * productPrices.get(i)%>
                        </div>

                        <%
                            }
                            productNames.clear();
                            productPrices.clear();

                        %>
                        <br/>

                        <div class="grid_5">
                            <strong><br>Totaal prijs</strong>
                        </div>

                        <div class="grid_3 push_3">
                            &euro; <%= Math.ceil(cart.getTotalPriceOfCart()) %>
                        </div>
                        <div class="clear"></div>

                        <br/>
                        <br/>
                        <a href="buyItems.jsp">
                            <div class="grid_3" id="greenBtn">
                                Bestel gerechten
                            </div>
                        </a>
                        <a href="viewproducts.jsp">
                            <div class="grid_3" id="greenBtn">
                                Ga verder met bestellen
                            </div>
                        </a>
                    </div>

                    <br/>
                    <br/>
                    
                    
                    <br/>
                    <%
                            }
                        }
                    %>
                </div>

            </div>
        </div>
    </body>
</html>
