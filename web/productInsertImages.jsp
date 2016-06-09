<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>IPASS - Wesley de Gooijer</title>
        <link rel="shortcut icon" href="images/logo/ico.ico"/>
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <!--<link rel="stylesheet" type="text/css" href="css/lightbox.css"  />-->

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

        <script src="js/jquery-1.7.2.min.js"></script>
        
        <style type="text/css">

            #targetPrev {
                padding:5px;
                border:1px solid #CCC;
                background:#EEE;
            }
        </style>
        <script type = "text/javascript">
            
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    $('#targetPrev').hide();
                    reader.onload = function (e) {
                        $('#targetPrev')
                        .attr('src', e.target.result)
                        .width(150);
                        $('#targetPrev').fadeIn(3000);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </head>
    <body>

        <%@ page language="java" import="javazoom.upload.*,java.util.*" %>

        <%
            String path = application.getRealPath("uploads");
        %>

        <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
            <jsp:setProperty name="upBean" property="folderstore" value="<%= path%>" />
        </jsp:useBean>

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

    
    <div class="container_16">
            <div id="whiteBox" class="grid_13">
                <div style="padding: 10px;" class="grid_13">
                    <h3  align="center">
                        <%
                            if ((session.getAttribute("productName") == null)) {
                                // if email session is set, Dont show the message redirect to index
                                //response.sendRedirect("/saikiranBookstoreApp/index.jsp");
                                out.println("There is no product detected to insert an image for it...");
                            }else {
                        %>
                    </h3>        
                    <h1><% out.print("Voeg de productafbeelding toe<br /><br />" + session.getAttribute("productName"));%></h1>
                    <p>
                        <%
                            out.print("Product :" + session.getAttribute("productName"));
                        %>
                    </p>

                    <form method="post" action="uploadImage.jsp" name="upform" enctype="multipart/form-data">

                        <img class="push_1" id="targetPrev" alt="your image" /><br><br>
                        <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
                            <tr>
                                <td align="left"><b>Selecteer een afbeelding om up te loaden :</b></td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <input type="file" onchange="readURL(this);"  name="uploadfile" size="50">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <input type="hidden" name="todo" value="upload">
                                    <input id="greenBtn" type="submit" name="Submit" value="Voeg productafbeelding toe">
                                    <br/>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <br>
                        <%
                            if (request.getAttribute("fileName") != null) {
                        %>
                        <a href="admin_manageProduct.jsp?pid=<%= (String)session.getAttribute("productId") %>" style="float: left;" id="buy" >Wijzig product</a>
                        <div class="clear"></div><br/>
                        <h1>Resultaat : <%= request.getAttribute("result")%><br/></h1>
                        Afbeelding naam : <%= request.getAttribute("fileName")%><br/>
                        Afbeelding's type : <%= request.getAttribute("fileType")%><br/>
                        Afgbeelding grootte : <%= request.getAttribute("fileSize")%><br/>
                        
                        <%
                            String result = (String) request.getAttribute("result");
                            if (result.equals("Afbeelding is succesvol toegevoegd")) {
                        %>

                        File <%= request.getAttribute("fileName")%> was uploaded to <%= path%>

                        <%
                                }
                            }
                          }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
