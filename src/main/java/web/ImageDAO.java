package web;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.Part;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.*;
import web.DB;
import java.awt.image.BufferedImage;
import javax.servlet.http.*;
import javax.servlet.*;


public class ImageDAO {
	
/*	public List<Salle> getImageData() {
	    List<Salle> imageDataList = new ArrayList<>();
	    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    String DB_URL = "jdbc:mysql://localhost/tp_jee";
	       String USER = "root";
	      String PASS = "romaysa123";
	      try {
	    	    Class.forName(JDBC_DRIVER);
	    	    Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
	    	    Statement stmt = con.createStatement();
	    	    ResultSet rs = stmt.executeQuery("select * from salles");
	    	    while (rs.next()) {
	    	        String NomSalle = rs.getString("NomSalle");
	    	        String NomEtage = rs.getString("NomEtage");
	    	        String Description = rs.getString("Description");
	    	        Blob imageBlob = rs.getBlob("imageBlob");
	    	        Blob  imageB = new javax.sql.rowset.serial.SerialBlob(imageBlob);
	    	        imageDataList.add(new Salle(NomSalle, NomEtage, Description,imageB));
	    	    }
	    	    rs.close();
	    	    stmt.close();
	    	    con.close();
	    	} catch (SQLException e) {
	    	    e.printStackTrace();
	    	} catch (ClassNotFoundException e) {
	    	    e.printStackTrace();
	    	}
	    return imageDataList;
	}*/
	
	private String jdbcURL = "jdbc:mysql://localhost/tp_jee";
    private String jdbcUsername = "root";
    private String jdbcPassword = "romaysa123";

    private static final String SELECT_ALL_IMAGES = "select * from salles";

    public List<Salle> getAllImages() {
        List<Salle> images = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_IMAGES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
            	String NomSalle = rs.getString("NomSalle");
    	        String NomEtage = rs.getString("NomEtage");
    	        String Description = rs.getString("Description");
    	        Blob imageBlob = rs.getBlob("imageBlob");
    	        Blob  imageB = new javax.sql.rowset.serial.SerialBlob(imageBlob);
                Salle image = new Salle(NomSalle, NomEtage, Description, imageB);
                images.add(image);
              }
            rs.close();
            preparedStatement.close();
    	    connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }
}
