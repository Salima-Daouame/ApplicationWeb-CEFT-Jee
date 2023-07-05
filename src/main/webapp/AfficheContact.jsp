<%@ page import="java.sql.*" %>
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
            <h1>Boîte Email</h1>
           
        </section>
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th> Nemero Message <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Nom de Personne <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Email <span class="icon-arrow">&UpArrow;</span></th>
                        <th> Message <span class="icon-arrow">&UpArrow;</span></th>
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
      ResultSet rs = stmt.executeQuery("SELECT idMessage,NomPersonne,Email,MessageEnvoye FROM Message");
      
      // Iterate through the results and output them in the slideshow
      while (rs.next()) {
    	  int idMessage=rs.getInt("idMessage");
    	  String NomPersonne=rs.getString("NomPersonne");
    	  String Email=rs.getString("Email");
    	  String MessageEnvoye=rs.getString("MessageEnvoye");
    %>
    
                    <tr>
                        <td><%=idMessage%> </td>
                        <td> <%=NomPersonne%> </td>
                        <td>
                            <p class="status delivered"><%=Email%></p>
                        </td>
                         <td><%=MessageEnvoye%></td>
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
            <div style="text-align: center"> <a href="index.jsp">Retour</a></div>
        </section>
    </main>
</body>

</html>