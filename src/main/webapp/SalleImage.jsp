<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Glass Card</title>
  <link rel="stylesheet" href="css/styleGridImage.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
 <div class="wrapper">
  
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
    
      <div > <img src="data:image/jpeg;base64,<%=base64Image%>" width="300px"/></div>
              <h1><%=NomSalle%></h1>
              <h2><%=NomEtage%></h2>
              <p><%=Description%></p>
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
  </div>
    </div>

  
</body>
</html>
