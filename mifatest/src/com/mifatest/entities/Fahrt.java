package com.mifatest.entities;
import java.sql.Time;
import java.util.*;

public class Fahrt {
	
	private int fahrtID;
	private User fahrerID;
	private String kommentar;
	private int kapazitaet;
	
	private Time fahrtStartZeit;

	private String gepaeck;
	
	private String s1;
	private String s2;
	private String s3;
	private String s4;
	private String s5;
	private String s6;
	
	private int p1;
	private int p2;
	private int p3;
	private int p4;
	private int p5;
	private int p6;
	
	private Date fahrtDatum;
	
	public int getFahrtID() {
		return fahrtID;
	}
	public void setFahrtID(int fahrtID) {
		this.fahrtID = fahrtID;
	}
	public User getFahrerID() {
		return fahrerID;
	}
	public void setFahrerID(User fahrerID) {
		this.fahrerID = fahrerID;
	}
	public String getKommentar() {
		return kommentar;
	}
	public void setKommentar(String kommentar) {
		this.kommentar = kommentar;
	}
	public int getKapazitaet() {
		return kapazitaet;
	}
	public void setKapazitaet(int kapazitaet) {
		this.kapazitaet = kapazitaet;
	}
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
	}
	public String getS6() {
		return s6;
	}
	public void setS6(String s6) {
		this.s6 = s6;
	}
	public int getP1() {
		return p1;
	}
	public void setP1(int p1) {
		this.p1 = p1;
	}
	public int getP2() {
		return p2;
	}
	public void setP2(int p2) {
		this.p2 = p2;
	}
	public int getP3() {
		return p3;
	}
	public void setP3(int p3) {
		this.p3 = p3;
	}
	public int getP4() {
		return p4;
	}
	public void setP4(int p4) {
		this.p4 = p4;
	}
	public int getP5() {
		return p5;
	}
	public void setP5(int p5) {
		this.p5 = p5;
	}
	public int getP6() {
		return p6;
	}
	public void setP6(int p6) {
		this.p6 = p6;
	}
	public Date getFahrtDatum() {
		return fahrtDatum;
	}
	public void setFahrtDatum(Date fahrtDatum) {
		this.fahrtDatum = fahrtDatum;
	}

	public String getGepaeck() {
		return gepaeck;
	}
	public void setGepaeck(String gepaeck) {
		this.gepaeck = gepaeck;
	}

	public Time getFahrtStartZeit() {
		return fahrtStartZeit;
	}
	public void setFahrtStartZeit(Time fahrtStartZeit) {
		this.fahrtStartZeit = fahrtStartZeit;
	}
	
}
