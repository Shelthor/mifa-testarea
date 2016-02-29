package com.mifatest.entities;

public class Parameter {
	
	private int parameterID;
	private String parameterBezeichnung;
	private String parameterBeschreibung;
	private String parameterTyp;
	
	private Funktion funktionID;
	
	public Funktion getFunktionID() {
		return funktionID;
	}
	public void setFunktionID(Funktion funktionID) {
		this.funktionID = funktionID;
	}
	public int getParameterID() {
		return parameterID;
	}
	public void setParameterID(int parameterID) {
		this.parameterID = parameterID;
	}
	public String getParameterBezeichnung() {
		return parameterBezeichnung;
	}
	public void setParameterBezeichnung(String parameterBezeichnung) {
		this.parameterBezeichnung = parameterBezeichnung;
	}
	public String getParameterBeschreibung() {
		return parameterBeschreibung;
	}
	public void setParameterBeschreibung(String parameterBeschreibung) {
		this.parameterBeschreibung = parameterBeschreibung;
	}
	public String getParameterTyp() {
		return parameterTyp;
	}
	public void setParameterTyp(String parameterTyp) {
		this.parameterTyp = parameterTyp;
	}
	
}
