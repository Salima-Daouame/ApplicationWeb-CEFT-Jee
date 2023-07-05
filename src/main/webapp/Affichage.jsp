<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%">
<tr>
<th>Nom</th>
<th>Nom Etage</th>
<th>Description</th>
<th>Image</th>
</tr>

<%

 String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost/tp_jee";
   String USER = "root";
  String PASS = "romaysa123";
  
  try{
      Class.forName(JDBC_DRIVER);
      Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
      PreparedStatement pst = con.prepareStatement("select * from salles");
      ResultSet rs = pst.executeQuery();
      while(rs.next()){
          %>
          <tr>
              <th><%=rs.getString(1)%></th>
              <th><%=rs.getString(2)%></th>
              <th><%=rs.getString(3)%></th>
              <th>
                <%
                Blob blob = rs.getBlob("image");
                if (blob != null) {
                    byte[] imageData = blob.getBytes(1, (int) blob.length());
                    String imageBase64 = Base64.getEncoder().encodeToString(imageData);
                    out.print("<img src='data:image/png;base64," + imageBase64 + "' width='400px'/>");
                }
                %>
            </th>
           </tr>
           <%
      }
      rs.close();
      pst.close();
      con.close();
  } catch(Exception e){
      out.println(e);
  }

%>
</table>

</body>
</html>
