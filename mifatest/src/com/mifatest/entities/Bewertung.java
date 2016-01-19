package com.mifatest.entities;

import java.util.*;

public class Bewertung {

	private int bewertungID;
	private User bewertungSenderID;
	private User bewertungEmpfaengerID;
	private Fahrt fahrtID;
	
	private int puenktlichkeitRating;
	private int fahrstilRating;
	private int freundlichkeitRating;
	
	private Date bewertungDatum;
	private String bewertungText;
	public int getBewertungID() {
		return bewertungID;
	}
	public void setBewertungID(int bewertungID) {
		this.bewertungID = bewertungID;
	}
	public User getBewertungSenderID() {
		return bewertungSenderID;
	}
	public void setBewertungSenderID(User bewertungSenderID) {
		this.bewertungSenderID = bewertungSenderID;
	}
	public User getBewertungEmpfaengerID() {
		return bewertungEmpfaengerID;
	}
	public void setBewertungEmpfaengerID(User bewertungEmpfaengerID) {
		this.bewertungEmpfaengerID = bewertungEmpfaengerID;
	}
	public Fahrt getFahrtID() {
		return fahrtID;
	}
	public void setFahrtID(Fahrt fahrtID) {
		this.fahrtID = fahrtID;
	}
	public int getPuenktlichkeitRating() {
		return puenktlichkeitRating;
	}
	public void setPuenktlichkeitRating(int puenktlichkeitRating) {
		this.puenktlichkeitRating = puenktlichkeitRating;
	}
	public int getFahrstilRating() {
		return fahrstilRating;
	}
	public void setFahrstilRating(int fahrstilRating) {
		this.fahrstilRating = fahrstilRating;
	}
	public int getFreundlichkeitRating() {
		return freundlichkeitRating;
	}
	public void setFreundlichkeitRating(int freundlichkeitRating) {
		this.freundlichkeitRating = freundlichkeitRating;
	}
	public Date getBewertungDatum() {
		return bewertungDatum;
	}
	public void setBewertungDatum(Date bewertungDatum) {
		this.bewertungDatum = bewertungDatum;
	}
	public String getBewertungText() {
		return bewertungText;
	}
	public void setBewertungText(String bewertungText) {
		this.bewertungText = bewertungText;
	}
	
	
}
