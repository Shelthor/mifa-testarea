package com.mifatest.executers;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.*;

public class Buchen {

	public void passangerBooksHimselfIn(int fahrtId, String start, String ziel){
		Facade f = new Facade();
		
		Fahrt fahrt = new Fahrt();
		List<String> hilfsListe = new ArrayList();
		
		String userStart;
		String userZiel;
		
		int kap;
		
		int p1;
		int p2;
		int p3;
		int p4;
		int p5;
		int p6;
		
		int zaehlenStart = 0;
		int zaehlenStopp = 0;
		
		fahrt = f.getFahrtById(fahrtId);
		
		 userStart = start;
		 userZiel = ziel;
		
		kap = fahrt.getKapazitaet();
		
		p1 = fahrt.getP1();
		p2 = fahrt.getP2();
		p3 = fahrt.getP3();
		p4 = fahrt.getP4();
		p5 = fahrt.getP5();
		p6 = fahrt.getP6();
		///
								
		hilfsListe.add(fahrt.getS1());
		hilfsListe.add(fahrt.getS2());
		hilfsListe.add(fahrt.getS3());
		hilfsListe.add(fahrt.getS4());
		hilfsListe.add(fahrt.getS5());
		hilfsListe.add(fahrt.getS6());
		
		//
		
		for (int i = 0; i < hilfsListe.size(); i++)
		{
			
			if(hilfsListe.get(i)!= null){
				
				int ausgabe = i+1;
				
				if(hilfsListe.get(i).equals(userStart)){
					
					zaehlenStart = ausgabe;
				}
			}
		}
		
		for (int i = hilfsListe.size()-1; i >= 1; i--)
		{

			
			if(hilfsListe.get(i)!= null){
				
				int ausgabe = i;
				if(hilfsListe.get(i).equals(userZiel)){

					
					zaehlenStopp = ausgabe;
				}
			}
		}
				
		for(int j = zaehlenStart; j <= zaehlenStopp; j++)
		{
			if(j == 1){
				fahrt.setP1(p1-1);
				
			}
			if(j == 2){
				fahrt.setP2(p2-1);
			}
			if(j == 3){
				fahrt.setP3(p3-1);
			}
			if(j == 4){
				fahrt.setP4(p4-1);
			}
			if(j == 5){
				fahrt.setP5(p5-1);
			}
			
		}

		f.updateFahrt(fahrt);
	}
	
	public void passangerBooksHimselfOut(int fahrtId, String start, String ziel){
		Facade f = new Facade();
		
		Fahrt fahrt = new Fahrt();
		List<String> hilfsListe = new ArrayList();
		
		String userStart;
		String userZiel;
		
		int kap;
		
		int p1;
		int p2;
		int p3;
		int p4;
		int p5;
		int p6;
		
		int zaehlenStart = 0;
		int zaehlenStopp = 0;
		
		fahrt = f.getFahrtById(fahrtId);
		
		 userStart = start;
		 userZiel = ziel;
		
		kap = fahrt.getKapazitaet();
		
		p1 = fahrt.getP1();
		p2 = fahrt.getP2();
		p3 = fahrt.getP3();
		p4 = fahrt.getP4();
		p5 = fahrt.getP5();
		p6 = fahrt.getP6();
		///
								
		hilfsListe.add(fahrt.getS1());
		hilfsListe.add(fahrt.getS2());
		hilfsListe.add(fahrt.getS3());
		hilfsListe.add(fahrt.getS4());
		hilfsListe.add(fahrt.getS5());
		hilfsListe.add(fahrt.getS6());
		
		//
		
		for (int i = 0; i < hilfsListe.size(); i++)
		{
			
			if(hilfsListe.get(i)!= null){
				
				int ausgabe = i+1;
				
				if(hilfsListe.get(i).equals(userStart)){
					
					zaehlenStart = ausgabe;
				}
			}
		}
		
		for (int i = hilfsListe.size()-1; i >= 1; i--)
		{

			
			if(hilfsListe.get(i)!= null){
				
				int ausgabe = i;
				if(hilfsListe.get(i).equals(userZiel)){

					
					zaehlenStopp = ausgabe;
				}
			}
		}
				
		for(int j = zaehlenStart; j <= zaehlenStopp; j++)
		{
			if(j == 1){
				fahrt.setP1(p1+1);
				
			}
			if(j == 2){
				fahrt.setP2(p2+1);
			}
			if(j == 3){
				fahrt.setP3(p3+1);
			}
			if(j == 4){
				fahrt.setP4(p4+1);
			}
			if(j == 5){
				fahrt.setP5(p5+1);
			}
			
		}

		f.updateFahrt(fahrt);
	}
	
	
}
