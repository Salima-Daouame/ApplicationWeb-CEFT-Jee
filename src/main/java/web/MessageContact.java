package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class MessageContact
 */
public class MessageContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageContact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 PrintWriter out;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        String NomPersonne = request.getParameter("NomPersonne");
        String Email = request.getParameter("Email");
        String MessageEnvoye = request.getParameter("MessageEnvoye");
      
            try {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into Message(NomPersonne,Email,MessageEnvoye) values(?,?,?)");
               
                ps.setString(1, NomPersonne);
                ps.setString(2, Email);
                ps.setString(3, MessageEnvoye);
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("contact.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }


}
