package com.mifatest.entities;

public class FunktionParameter {
	
	private int funktion_parameterID;
	private Parameter parameterID;
	private Funktion funktionID;
	
	public int getFunktion_parameterID() {
		return funktion_parameterID;
	}
	public void setFunktion_parameterID(int funktion_parameterID) {
		this.funktion_parameterID = funktion_parameterID;
	}
	public Parameter getParameterID() {
		return parameterID;
	}
	public void setParameterID(Parameter parameterID) {
		this.parameterID = parameterID;
	}
	public Funktion getFunktionID() {
		return funktionID;
	}
	public void setFunktionID(Funktion funktionID) {
		this.funktionID = funktionID;
	}
	
}
