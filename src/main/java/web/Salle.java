package web;

import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.sql.*;


/**
 * User.java
 * This is a model class represents a User entity
 * @author Ramesh Fadatare
 *
 */

/*idSalles int AI PK 
NomSalle varchar(100) 
NomEtage varchar(100) 
Description varchar(500) 
Image blob*/
public class Salle {
	protected int idSalles;
	protected String NomSalle;
	protected String NomEtage;
	protected String Description;
	protected Blob Image;
	
	public Salle() {
	}
	
	public Salle(String NomSalle, String NomEtage, String Description , Blob Image) {
		super();
		this.NomSalle = NomSalle;
		this.NomEtage = NomEtage;
		this.Description = Description;
		this.Image = Image;
	}

	public Salle(int idSalles,String NomSalle, String NomEtage, String Description , Blob Image) {
		super();
		this.idSalles = idSalles;
		this.NomSalle = NomSalle;
		this.NomEtage = NomEtage;
		this.Description = Description;
		this.Image = Image;
	}
	
	public int getIdSalles() {
		return idSalles;
	}

	public void setIdSalles(int idSalles) {
		this.idSalles = idSalles;
	}

	public String getNomSalle() {
		return NomSalle;
	}

	public void setNomSalle(String nomSalle) {
		NomSalle = nomSalle;
	}

	public String getNomEtage() {
		return NomEtage;
	}

	public void setNomEtage(String nomEtage) {
		NomEtage = nomEtage;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Blob getImage() {
		return Image;
	}

	public void setImage(Blob image) {
		Image = image;
	}
}
