<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DB_Conn"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>IPASS - Wesley de Gooijer</title>
        <%@include file="includesPage/_stylesheets.jsp" %>

        <link rel="stylesheet" href="css/slider.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/slider.js"></script>


<script type="text/javascript" >
    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 7000
        });
    });
</script>
<script type="text/javascript" src="js/myScript.js"></script>
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
    <%@include file="includesPage/navigationbar.jsp" %>
    <div id = "banner">
        <div class="container_16">
            <div class="grid_16" style="padding-left: 20px; " id="slider">	
                <ul id="sliderContent">						
                    <li class="sliderImage" style="display: none; ">
                        <img src="images/slider1.jpg" width="900" height="300" /> 
                        <span class="top" style="display: none; ">
                            <strong>Sushi...</strong>	
                            <br>De allerlekste sushi hier bij GO
                            Alle soorten en smaken die je kunt bestellen op onze applicatie
                        </span>
                    </li>  
                    <li class="sliderImage" style="display: none; ">
                        <img src="images/slider2.jpg" width="900" height="300" /> 
                        <span class="top" style="display: none; ">
                            <strong>Vis, groenten...</strong>				
                            <br>Veel verschillende soorten vis, die vers voor u bereid worden
                            In combinatie met vele soorten groenten die u kunt bestellen bij ons.
                            Nu beschikbaar bij GO
                        </span>
                    </li>  
                    <li class="sliderImage" style="display: none; ">
                        <img src="images/slider3.jpg" width="900" height="300" /> 
                        <span class="top" style="display: none; ">
                            <strong>Verse rijst</strong>				
                            <br>Altijd de beste rijst die bij uw gerecht past
                            De heerlijke plakrijst die u bij uw sushi krijgt,
                            of de heerlijke softe rijst voor uw salades het kan allemaal bij GO 
                        </span>
                    </li>  
                    <li class="sliderImage" style="display: none; ">
                        <img src="images/slider4.jpg" width="900" height="300" /> 
                        <span class="top" style="display: none; ">
                            <strong>Warm water...</strong>				
                            <br>Na elke ronde krijgt u warm water om u handten in te wassen
                            Nu beschikbaar met een doekje, om u handen niet te veel vuil te maken
                        </span>
                    </li>   
                    <div class="clear sliderImage"></div>  
                </ul>
            </div>
        </div>
    </div>
    <div class="container_16">
    <div id = "contents">
<%
    Connection c = new DB_Conn().getConnection();
    Statement st = c.createStatement();
    String getCategory = "SELECT * FROM  `category`  ";
    
    ResultSet rs = st.executeQuery(getCategory);
    
%>
            <div id="leftside" class="grid_3">
                <div>
                    <ul id="leftsideNav">
                        <li><a href="#"><strong>Categorieën</strong></a></li>
                        <%
                        while (rs.next()){
                            String category = rs.getString ("category_name");
                            %>
                            <li><a href="viewproducts.jsp"><%= category %></a></li>
                        <%
                        }
                        %>
                    </ul>
                </div>
            </div>
        </div>
        <div id="middle"class="grid_13">
            <jsp:include page="includesPage/mainHeaders/topMostViewedProducts_4.jsp"></jsp:include>
        </div>
    </div>
    <jsp:include page="includesPage/_footer.jsp"></jsp:include>
</body>
</html>



