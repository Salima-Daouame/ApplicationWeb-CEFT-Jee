<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>

<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/swiper-bundle.min.css" />
      <link rel="stylesheet" href="css/styleGallery1.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css" />
    <link  type="text/css" rel="stylesheet" href="css/Style1.css" />
      <link  type="text/css" rel="stylesheet" href="css/styleimg.css" />
    <!-- <link  type="text/css" rel="stylesheet" href="css/style_footer.css" /> --> 
      <link  type="text/css" rel="stylesheet" href="css/style2.css" />
   
  <!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/> --> 
    
    
    <!--  <link rel="stylesheet" href="css/style.css" /> --> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
  <link rel="stylesheet" href="css/styleimg.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="js/scriptimg.js" defer></script>

<title>AppCenter</title>

<style type="text/css">

h1 {
color: #000000;
font-family: Playfair Display;
font-size: 50px;
font-weight: bold;
padding-right:82px;
margin-top: 10px;
margin-bottom: 10px;
border-radius: 30px;
/*background-color:#1c2a4f*/
}


</style>
</head>
<body style="background-color: ffffff">

  <%@ include file="HeaderNav.jsp" %>
       <!--Presentatio part  -->
  <div class="All">
         <div class="Firstdiv">
        
    <h2>Presentation</h2>
     <p>Centre d'Études et de formation tiznit est un centre public ouvert le mercredi 15 
     décembre 2020 dans la ville de Tiznit, où de nombreuses activités sont organisées chaque année dans différents domaines, 
     et est un disciple de l'Université Ibn Zouhre.</p>
         </div>
    
         <div class="Seconddiv">
     <p>Centre d'Études et de Formation Tiznit</p>
      <p>3ans au service.</p>
        <img src="images\centre.jpg" alt="" class="image" />
          </div>
   </div>
    <!--Presentation part  -->
    
     <!--Images Silde -->
      
   <div class="wrapper">
    
    <section class="main swiper mySwiper">
     
  
      <div class="wrapper swiper-wrapper">
        <div class="slide swiper-slide">
          <img src="images\C6.PNG" alt="" class="image" />
          <div class="image-data">
          
            <h2>
              Promotion licence professionnelle <br />
             Génie Informatique 2022/2023.
            </h2>

          </div>
        </div>
        <div class="slide swiper-slide">
          <img src="images\C1.jpg" alt="" class="image" />
          <div class="image-data">
            <h2>
             Une réunion introductive pour la délégation du sixième Forum Africain des administrateurs territoriaux <br />
              et des Instituts de formation ciblant les collectivités territoriales FAMI.
            </h2>
           
          </div>
        </div>
        
        <div class="slide swiper-slide">
          <img src="images\n9.jpg" alt="" class="image" />
          <div class="image-data">
           
            <h2>
            Jours de formation au profit des Bénéficiaires du programme des orchants  <br />
            pour année 2022
            </h2>
          </div>
        </div>
      </div>
      <div class="swiper-button-next nav-btn"></div>
      <div class="swiper-button-prev nav-btn"></div>
      <div class="swiper-pagination"></div>
    </section>

    <!-- Swiper JS -->
    <script src="js/swiper-bundle.min.js"></script>
    
          

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    
  
   <!--Presentatio part  -->
       <div style="text-align: center;"><h1>Les Salles de Centre</h1></div> 
   <div class="wrapper">
   
     <i id="left" class="fa-solid fa-angle-left"></i>
     <div class="carousel">
        
     
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
    
      <img src="data:image/jpeg;base64,<%=base64Image%>" alt="img" draggable="false"  />
     
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
     <i id="right" class="fa-solid fa-angle-right"></i>
    </div>
    
  
</body>


  <%@ include file="Footer.jsp" %>
</html>