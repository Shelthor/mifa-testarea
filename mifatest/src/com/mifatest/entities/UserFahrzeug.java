package com.mifatest.entities;

public class UserFahrzeug {
	
	private int user_fahrzeugID;
	private Fahrzeug fahrzeugID;
	private User userID;
	
	public int getUser_fahrzeugID() {
		return user_fahrzeugID;
	}
	public void setUser_fahrzeugID(int user_fahrzeugID) {
		this.user_fahrzeugID = user_fahrzeugID;
	}
	public Fahrzeug getFahrzeugID() {
		return fahrzeugID;
	}
	public void setFahrzeugID(Fahrzeug fahrzeugID) {
		this.fahrzeugID = fahrzeugID;
	}
	public User getUserID() {
		return userID;
	}
	public void setUserID(User userID) {
		this.userID = userID;
	}
}
