package com.mifatest.entities;

public class Funktion {
	
	private int funktionID;
	private String funktionBezeichnung;
	private String funktionBeschreibung;
	private String funktionTyp;
	
	public String getFunktionTyp() {
		return funktionTyp;
	}
	public void setFunktionTyp(String funktionTyp) {
		this.funktionTyp = funktionTyp;
	}
	public int getFunktionID() {
		return funktionID;
	}
	public void setFunktionID(int funktionID) {
		this.funktionID = funktionID;
	}
	public String getFunktionBezeichnung() {
		return funktionBezeichnung;
	}
	public void setFunktionBezeichnung(String funktionBezeichnung) {
		this.funktionBezeichnung = funktionBezeichnung;
	}
	public String getFunktionBeschreibung() {
		return funktionBeschreibung;
	}
	public void setFunktionBeschreibung(String funktionBeschreibung) {
		this.funktionBeschreibung = funktionBeschreibung;
	}

}
