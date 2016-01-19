package com.mifatest.entities;

import java.util.*;

public class User {

	private int userID;
	private String userBildURL;
	private String isAdmin;
	private String isActivated;
	private String telNummer;
	private String eMail;
	
	private String vName;
	private String nName;
	private Date geburtsDatum;
	
	public String getIsActivated() {
		return isActivated;
	}
	public void setIsActivated(String isActivated) {
		this.isActivated = isActivated;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserBildURL() {
		return userBildURL;
	}
	public void setUserBildURL(String userBildURL) {
		this.userBildURL = userBildURL;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getTelNummer() {
		return telNummer;
	}
	public void setTelNummer(String telNummer) {
		this.telNummer = telNummer;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getvName() {
		return vName;
	}
	public void setvName(String vName) {
		this.vName = vName;
	}
	public String getnName() {
		return nName;
	}
	public void setnName(String nName) {
		this.nName = nName;
	}
	public Date getGeburtsDatum() {
		return geburtsDatum;
	}
	public void setGeburtsDatum(Date geburtsDatum) {
		this.geburtsDatum = geburtsDatum;
	}
	
} 
