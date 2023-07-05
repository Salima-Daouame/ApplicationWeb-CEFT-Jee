<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Affichage Image</title>
    </head>
    <body>
    		<%
String NomSalle = request.getParameter("NomSalle");

%>
   <h1 align="center"><%=NomSalle%></h1>  
          <div style="text-align: center"> <b><a href="Table.jsp">Affiche</a>   |  <a href="index.jsp">Télécharge</a></b><br/><br/></div>
<div style="text-align: center"> <img   src="getImage.jsp?NomSalle=<%=NomSalle%>" width="400px"/></div>
 <div style="text-align: center"> <a href="Table.jsp">Les Salles</a></div>
    </body>
</html>
