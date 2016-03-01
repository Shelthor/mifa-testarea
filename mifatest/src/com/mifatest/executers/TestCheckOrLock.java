package com.mifatest.executers;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.*;

public class TestCheckOrLock {

	public static void main(String[] args) {
		Facade f = new Facade();
		
		/*
		 * 
		 * 
		 * Die Ganze Klasse arbeitet aktuell komplett aus Sicht des FAHRERS
		 * 
		 * 
		 * 
		 */
		
		int fahrer = 1;
		
		int boolZaehler = 0;
		//Erstelle Liste mit Fahrten, wo user mit der ID *1 Fahrer gewesen ist
		List<Fahrt> fListA = f.getListWithAllAngeboteneFahrtenOfUserByUserId(fahrer);
		
		List<User> uListA;
		List<User> uListB;
		boolean b = false;
		
		for( int i = 0; i < fListA.size() ; i++)
		{
			//Für jedes Element in der Liste mit den Fahrten Erstelle eine Liste mit Usern, die vom Fahrer bewertet wurden
			uListA = f.getUsersWhoAreRatedByUserId(fListA.get(i).getFahrtID(), f.getUserById(fahrer).getUserID());
			
			//Markierung um welche Fahrt es sich handelt
			System.out.println("--fahrtid : " + fListA.get(i).getFahrtID());
			System.out.println("LISTE A:   User, die bei der Fahrt " + fListA.get(i).getFahrtID() + " vom Fahrer bewertet worden sind : ");
				//gib den Nachnamen von jedem User, der bewertet worden ist
				for( int j = 0; j < uListA.size() ; j++)
					System.out.println(uListA.get(j).getnName());
				
			//Für jedes Element in der Liste mit den Fahrten, erstelle eine liste mit Usern, die bei der Fahrt X Passagier waren
			//und gib den Namen jedes Passagiers aus 
			uListB = f.getListWithAllPassagiereOfFahrtByFahrtId(fListA.get(i).getFahrtID());
			System.out.println("LISTE B:   Passagiere, zur Fahrt " + fListA.get(i).getFahrtID() + ": ");
				for( int h = 0; h < uListB.size() ; h++)
					System.out.println(uListB.get(h).getnName());
				
				
			//System.out.println("fahrtID: " + fListA.get(i).getFahrtID() + ", Start: " + fListA.get(i).getS1());
			b  = uListA.equals(uListB);
			System.out.println("Listen A und B gleich?" + b);
			if(b==true){
			}else{
				//Zähle wie oft noch keine Bewertung vorliegt
				boolZaehler++;
			}
		}
		System.out.println("Gezählte Fahrten ohne Bewertung: " + boolZaehler);
		
		//sollten für mehr als 5 Fahrten keine Bewertungen vorliegen -> Sperre die Seite
	}

}
