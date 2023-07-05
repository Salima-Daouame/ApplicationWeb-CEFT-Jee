<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<html>
<head>
 
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
      // Query the database for the images
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT NomSalle,NomEtage,Description,Image FROM salles");
      
      // Iterate through the results and output them in the slideshow
      while (rs.next()) {
    	  String NomSalle=rs.getString("NomSalle");
    	  String NomEtage=rs.getString("NomEtage");
    	  String Description=rs.getString("Description");
          Blob blob = rs.getBlob("Image");
        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
        String base64Image = new String(Base64.getEncoder().encode(imageBytes));
    %>
    
      
 <tr>
              <td><%=NomSalle%></td>
              <td><%=NomEtage%></td>
              <td><%=Description%></td>
               <td> <img src="data:image/jpeg;base64,<%=base64Image%>" width="400px"/></td>
       
     </tr>
    <%
      }
      
      // Close the database connection
      rs.close();
      stmt.close();
      con.close();
      } catch(Exception e){
          out.println(e);
      }
    %>
</table>
</body>
</html>