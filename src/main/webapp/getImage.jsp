<%@page import="web.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    /*String id = request.getParameter("id");
    try {
        Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from data where id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("image");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
            System.out.println("No image found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }*/ 
    
    String NomSalle = request.getParameter("NomSalle");
    try {
        Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM salles WHERE NomSalle LIKE CONCAT('%', ?, '%')");
        ps.setString(1, NomSalle);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String nom = rs.getString("NomSalle");
            String NomEtage = rs.getString("NomEtage");
            String Description = rs.getString("Description");
            Blob blob = rs.getBlob("image");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
           
        } else {
            System.out.println("No image found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }

    
    
%>
