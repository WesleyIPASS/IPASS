<%-- 
    Document   : removeProductFilter
    Created on : 16 Nov, 2012, 12:15:51 AM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("cat") != null ){
        session.removeAttribute("cat");
    }
    if (request.getParameter("scat") != null ){
        session.removeAttribute("scat");
    }
    response.sendRedirect("viewproducts.jsp");
%>
