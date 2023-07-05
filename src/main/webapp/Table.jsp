<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en" title="Coding design">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Responsive HTML Table With Pure CSS - Web Design/UI Design</title>
    <link rel="stylesheet" href="css/styleTable.css">
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Les Salles</h1>
             <form action="viewImage.jsp" method="post">
            <div class="input-group">
            <input size="100"type="search" name="NomSalle" required="required" placeholder="Recherche Salle..."  src="images/search.png"/><br/><br/>
            </div>
             </form>
           
        </section>
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th> Nemero Salle <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Image <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Nom <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Nom Etage <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Description <span class="icon-arrow">&UpArrow;</span></th>
                        
                    </tr>
                </thead>
                <tbody>
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
      ResultSet rs = stmt.executeQuery("SELECT idSalles,NomSalle,NomEtage,Description,Image FROM salles");
      
      // Iterate through the results and output them in the slideshow
      while (rs.next()) {
    	  int idSalles=rs.getInt("idSalles");
    	  String NomSalle=rs.getString("NomSalle");
    	  String NomEtage=rs.getString("NomEtage");
    	  String Description=rs.getString("Description");
          Blob blob = rs.getBlob("Image");
        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
        String base64Image = new String(Base64.getEncoder().encode(imageBytes));
    %>
    
                    <tr>
                        <td><%=idSalles%> </td>
                        <td> <img src="data:image/jpeg;base64,<%=base64Image%>" width="400px"/></td>
                        <td> <%=NomSalle%> </td>
                        <td>
                            <p class="status delivered"><%=NomEtage%></p>
                        </td>
                         <td><%=Description%></td>
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
                </tbody>
            </table>
            <div style="text-align: center"> <a href="index.jsp">Ajouter Salle</a></div>
        </section>
    </main>
</body>

</html>