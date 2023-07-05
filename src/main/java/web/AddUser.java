package web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.connector.Request;
import org.apache.tomcat.util.net.DispatchType;


public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	   static final String DB_URL = "jdbc:mysql://localhost/tp_jee";
	   static final String USER = "root";
	   static final String PASS = "romaysa123";
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String login = request.getParameter("name");
		String password = request.getParameter("pass");
		String Email = request.getParameter("email");
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
	         PreparedStatement pst = con.prepareStatement("insert into user(login,password,Email) values(?,?,?)");
	         pst.setString(1, login);
	         pst.setString(2, password);
	         pst.setString(3, Email);
	         pst.executeUpdate();
	         response.sendRedirect("SingIn.jsp");
	         pst.close();
	         con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
