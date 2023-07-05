package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;



public class MaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	   static final String DB_URL = "jdbc:mysql://localhost/tp_jee";
	   static final String USER = "root";
	   static final String PASS = "romaysa123";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	     // Connection conn = Database.getConn();
	      String login = request.getParameter("username");
	      String password = request.getParameter("password");
	      try {
	    	  Class.forName("com.mysql.cj.jdbc.Driver");
	    	  Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
	    	  
	         PreparedStatement pst = con.prepareStatement("SELECT iduser FROM user where login=? and password=? ");
	         pst.setString(1, login);
	         pst.setString(2, password);
	         ResultSet rs = pst.executeQuery();
	         if(rs.next()) {
	        	 session.setAttribute("login", login);
	        	 response.sendRedirect("index.jsp");
	         }else   response.sendRedirect("SingIn.jsp");
	         rs.close();
	         pst.close();
	         con.close();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }

}

