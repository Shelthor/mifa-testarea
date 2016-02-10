package com.mifatest.entities;

public class Fahrzeug {
	
	private int fahrzeugID;
	private String farzeugFarbe;
	private String fahrzeugTyp;
	private String fahrzeugBezeichnung;
	private String nummernschild;
	private String fahrzeugBildURL;
	//private int besitzerID;
	
	public int getFahrzeugID() {
		return fahrzeugID;
	}
	public void setFahrzeugID(int fahrzeugID) {
		this.fahrzeugID = fahrzeugID;
	}
	public String getFarzeugFarbe() {
		return farzeugFarbe;
	}
	public void setFarzeugFarbe(String farzeugFarbe) {
		this.farzeugFarbe = farzeugFarbe;
	}
	public String getFahrzeugTyp() {
		return fahrzeugTyp;
	}
	public void setFahrzeugTyp(String fahrzeugTyp) {
		this.fahrzeugTyp = fahrzeugTyp;
	}
	public String getFahrzeugBezeichnung() {
		return fahrzeugBezeichnung;
	}
	public void setFahrzeugBezeichnung(String fahrzeugBezeichnung) {
		this.fahrzeugBezeichnung = fahrzeugBezeichnung;
	}
	public String getNummernschild() {
		return nummernschild;
	}
	public void setNummernschild(String nummernschild) {
		this.nummernschild = nummernschild;
	}
	public String getFahrzeugBildURL() {
		return fahrzeugBildURL;
	}
	public void setFahrzeugBildURL(String fahrzeugBildURL) {
		this.fahrzeugBildURL = fahrzeugBildURL;
	}
	/*
	public void setBesitzerID(int besitzerID) {
		this.besitzerID = besitzerID;
	}
	public String getBesitzerID() {
		return besitzerID;
	}
	*/

}
