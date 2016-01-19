package com.mifatest.entities;

public class Passwort {
	private int passwortID;
	private User userID;
	private String passwortValue;
	
	public int getPasswortID() {
		return passwortID;
	}
	public void setPasswortID(int passwortID) {
		this.passwortID = passwortID;
	}
	public User getUserID() {
		return userID;
	}
	public void setUserID(User userID) {
		this.userID = userID;
	}
	public String getPasswortValue() {
		return passwortValue;
	}
	public void setPasswortValue(String passwortValue) {
		this.passwortValue = passwortValue;
	}
}
