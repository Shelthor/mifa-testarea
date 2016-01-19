package com.mifatest.entities;

public class PassagierFahrt {
	
	private int passagier_fahrtID;
	private Fahrt fahrtID;
	private User userID;
	private String userStart;
	private String userZiel;
	
	public int getPassagier_fahrtID() {
		return passagier_fahrtID;
	}
	public void setPassagier_fahrtID(int passagier_fahrtID) {
		this.passagier_fahrtID = passagier_fahrtID;
	}
	public Fahrt getFahrtID() {
		return fahrtID;
	}
	public void setFahrtID(Fahrt fahrtID) {
		this.fahrtID = fahrtID;
	}
	public User getUserID() {
		return userID;
	}
	public void setUserID(User userID) {
		this.userID = userID;
	}
	public String getUserStart() {
		return userStart;
	}
	public void setUserStart(String userStart) {
		this.userStart = userStart;
	}
	public String getUserZiel() {
		return userZiel;
	}
	public void setUserZiel(String userZiel) {
		this.userZiel = userZiel;
	}
	
	

}
