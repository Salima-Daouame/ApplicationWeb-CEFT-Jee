package web;




import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
@jakarta.servlet.annotation.WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("image");
        String NomSalle = request.getParameter("NomSalle");
        String Description = request.getParameter("Description");
        String NomEtage = request.getParameter("NomEtage");
        if (part != null) {
            try {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into salles(NomSalle,NomEtage,Description,Image) values(?,?,?,?)");
                InputStream is = part.getInputStream();
                ps.setString(1, NomSalle);
                ps.setString(2, NomEtage);
                ps.setString(3, Description);
                ps.setBlob(4, is);
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("Table.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}
