package com.mifatest.entities;

import java.sql.Time;

public class Nachricht {

	private int nachrichtID;
	private User nachrichtSenderID;
	private User nachrichtEmpfaengerID;
	private Time nachrichtZeit;
	private String nachrichtText;
	
	public int getNachrichtID() {
		return nachrichtID;
	}
	public void setNachrichtID(int nachrichtID) {
		this.nachrichtID = nachrichtID;
	}
	public User getNachrichtSenderID() {
		return nachrichtSenderID;
	}
	public void setNachrichtSenderID(User nachrichtSenderID) {
		this.nachrichtSenderID = nachrichtSenderID;
	}
	public User getNachrichtEmpfaengerID() {
		return nachrichtEmpfaengerID;
	}
	public void setNachrichtEmpfaengerID(User nachrichtEmpfaengerID) {
		this.nachrichtEmpfaengerID = nachrichtEmpfaengerID;
	}
	public Time getNachrichtZeit() {
		return nachrichtZeit;
	}
	public void setNachrichtZeit(Time nachrichtZeit) {
		this.nachrichtZeit = nachrichtZeit;
	}
	public String getNachrichtText() {
		return nachrichtText;
	}
	public void setNachrichtText(String nachrichtText) {
		this.nachrichtText = nachrichtText;
	}
	
}
