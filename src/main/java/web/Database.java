package web;
import java.sql.*;
import javax.swing.*;

public class Database {
	/* static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	   static final String DB_URL = "jdbc:mysql://localhost/tp_jee";
	   static final String USER = "root";
	   static final String PASS = "romaysa123";*/
	   
	   public static Connection getConn() {
		      Connection conn = null;
		      try {
		            Class.forName("com.mysql.jdbc.Driver");
		        conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/tp_jee", "root", "romaysa123");
		         JOptionPane.showMessageDialog(null,"oui");
		      } catch (ClassNotFoundException | SQLException e) {
		         e.printStackTrace();
		         JOptionPane.showMessageDialog(null,"no");
		      }
		      return conn;
		   }
}


/*
public class Database {
    public static Connection getConn(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tp_jee", "root", "romaysa123");
            JOptionPane.showMessageDialog(null,"Conn etablie");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Conn No etablie");
        }
        return conn;

    }
}

*/


