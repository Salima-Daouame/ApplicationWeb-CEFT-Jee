package web;

public class Message {
	
	protected int idMessage;
	protected String NomPersonne;
	protected String Email;
	protected String MessageEnvoye;
	
	
	
	public Message(int idMessage, String nomPersonne, String email, String messageEnvoye) {
		super();
		this.idMessage = idMessage;
		NomPersonne = nomPersonne;
		Email = email;
		MessageEnvoye = messageEnvoye;
	}
	public int getIdMessage() {
		return idMessage;
	}
	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}
	public String getNomPersonne() {
		return NomPersonne;
	}
	public void setNomPersonne(String nomPersonne) {
		NomPersonne = nomPersonne;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMessageEnvoye() {
		return MessageEnvoye;
	}
	public void setMessageEnvoye(String messageEnvoye) {
		MessageEnvoye = messageEnvoye;
	}

}
