<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<html>
<head>
  <!-- Include your slideshow library -->
   <link rel="stylesheet" type="text/css" href="slick.css"/>
  <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="scripte.js"></script>
 <link rel="stylesheet" href="css/swiper-bundle.min.css" />
      <link  type="text/css" rel="stylesheet" href="css\Style1.css" />
    <link  type="text/css" rel="stylesheet" href="css\style_footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    
    
    <link rel="stylesheet" href="css/style.css" />
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize your slideshow library
      $('.slideshow').slick();
    });
  </script>
</head>
<body>
<section class="main swiper mySwiper">
  <div class="wrapper swiper-wrapper">
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
      ResultSet rs = stmt.executeQuery("SELECT Image FROM salles");
      
      // Iterate through the results and output them in the slideshow
      while (rs.next()) {
        Blob blob = rs.getBlob("Image");
        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
        String base64Image = new String(Base64.getEncoder().encode(imageBytes));
    %>
      <div  class="slide swiper-slide">

        <img src="data:image/jpeg;base64,<%=base64Image%>" />
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
  </section>
 
</body>
</html>