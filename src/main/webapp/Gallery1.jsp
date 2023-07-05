<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Profile UI Card Design | CodingNepal</title>
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/style1111.css">
       <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">        
   </head>
   <body>
  <%@ include file="HeaderNav.jsp" %>
       <div class="slider owl-carousel">  
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
   
    <div class="card">
     <div class="img" ><img src="data:image/jpeg;base64,<%=base64Image%>" width="200px"/></div>
            <div class="content">
               <div class="title"><%=NomSalle%></div>
               <div class="sub-title"><%=NomEtage%></div>
               <p class="text"><%=Description%></p>  
                </div>  
                 </div>
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
          <script>
      $(".slider").owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 2000, //2000ms = 2s;
        autoplayHoverPause: true,
      });
    </script>
      <%@ include file="Footer.jsp" %>
   </body>
</html>