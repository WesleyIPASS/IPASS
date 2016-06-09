<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="product.product" id="product" scope="session"></jsp:useBean>

<%
    ArrayList category =  product.getCategory();
    %>
                    <div>
                        <ul id="leftsideNav">
                            <li><a href="#"><strong>Categorieën</strong></a></li>   
    <%
    for (int i=0;i<category.size(); i++){
        %>         
                            <li><a href="addProductFilters.jsp?cat=<%= category.get(i) %>"><%= category.get(i) %></a></li>
        <%
    }%>
                        </ul>
                    </div>
    <%
%>
