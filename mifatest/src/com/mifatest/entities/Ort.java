package com.mifatest.entities;

public class Ort {
	
	private int ortID;
	private String PLZ;
	private String ortBezeichnung;
	
	public int getOrtID() {
		return ortID;
	}
	public void setOrtID(int ortID) {
		this.ortID = ortID;
	}
	public String getPLZ() {
		return PLZ;
	}
	public void setPLZ(String pLZ) {
		PLZ = pLZ;
	}
	public String getOrtBezeichnung() {
		return ortBezeichnung;
	}
	public void setOrtBezeichnung(String ortBezeichnung) {
		this.ortBezeichnung = ortBezeichnung;
	}
	
}
