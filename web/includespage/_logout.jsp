<%@page import="java.util.ArrayList"%>
<%@page import="user.user"%>
<style type="text/css">
    .backRed {
        background: #CC0000;
        padding: 3px 7px;
        margin-right: 3px;
    }
</style>
<jsp:useBean id="cart" scope="session" class="cart.cart"  ></jsp:useBean>
<%
    ArrayList<Integer> Qty = new ArrayList();
    Qty = cart.getQty();
    int totalQty = 0;
    for (int i=0; i<Qty.size(); i++){
        totalQty += Qty.get(i);
    }
    
        
    
    user User = (user) session.getAttribute("user");
    String email = User.getUserEmail();
    String userName = User.getUsername();
    int uid = User.getUserId();
    
    String printName;
    if (userName == null){
        printName = email;
    }
    else {
        printName = userName;
    }
%>
   <div id = "topWrapper">
        <div class="container_16">
                <div class="grid_16">
                        <!--<div id="logo" class="grid_6"> <a href="index.jsp"><img src="images/logo/icon.png" /></a>-->
                        </div>
                        <div class="grid_9" id="top">
                            <ul>
                                <a href="logoutServlet"><li id="greenBtn" class ="Btn showForm">Logout</li></a>
                                <a href="userinfo.jsp?uid=<%= uid %>"><li class ="Btn showForm"><%= printName %></li></a>
                                <%
                                    if (session.getAttribute("admin") != null){
                                %>
                                <a href="admin_dashboard.jsp"><li class ="Btn showForm">Beheerder: </li></a>
                                <%
                                    }
                                %>
                                <a href="addtoOrder.jsp"><li class ="Btn showForm"><span class="backRed"><%= totalQty %></span>Bestellijst</li></a>
                            </ul>
                        </div>
                </div>
            </div>
    </div>
