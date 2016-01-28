package com.mifatest.executers;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.Bewertung;
import com.mifatest.entities.User;

public class TestFacade {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Facade f = new Facade();

////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		/*userAnlegen-test*/
		
		//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTESR
		
		//Aus Gr�nden der Wartbarkeit ist es immer besser, man jaucht die Werte nicht direkt in die Methode,
		//sondern deklariert vorher Variablen, die dann immer wieder neue Werte annehmen k�nnen
		
		String EMAILADRESSE = "cle.kruse@googlemail.com";
		Date HEUTE = new Date(90, 9, 16);
		String NACHNAME = "1";
		String VORNAME = "Mitfahrer";
		String TELEFONNUMMER = "017684127806";
		String ISADMIN = "true";
		String ISACTIVATED = "true";
		
	  //  f.newUser(EMAILADRESSE, HEUTE, NACHNAME, VORNAME,TELEFONNUMMER, ISADMIN, ISACTIVATED);
		
		// --- ACHTUNG --- Reihenfolge der Parameter beachten!		
		//Aber keine Sorge: immer wenn man eine Funktion aufruft, die Parameter verlangt, werden die 
		//Parameter von Eclipse vorgeschlagen
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////			
		/*fahrtanlegen-test*/
		//es kann immer nur ein jsp ausgef�hrt werden
		Date DATUM = new Date();
		int FAHRER = 1; 
		Time UHRZEIT = new Time(0, 0, 0);
		String GEPAECK = "GRO�";
		int KAPAZITAET = 2;
		String KOMMENTAR = "keine Umwege > 2km";
		
		String S1 = "Dresden";
		String S2 = null;
		String S3 = "Grimma";
		String S4 = null;
		String S5 = null;
		String S6 = "Leipzig";
		
		int P1 = 2;
		int P2 = 2;
		int P3 = 2;
		int P4 = 2;
		int P5 = 2;
		int P6 = 2;
		
		Facade[] fA = new Facade[10];
		
		for(int i = 0; i < 10; i++){
			fA[i] = new Facade();
			fA[i].newFahrt(DATUM, FAHRER, UHRZEIT, GEPAECK, KAPAZITAET, KOMMENTAR, S1, S2, S3, S4, S5, S6, P1, P2, P3, P4, P5, P6);
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		/* Arbeit mit Listen - SELECT * FROM Tabelle 
		
		// Gib mir eine <List> mit allen Elementen aus der Tabelle Bewertungen, WHERE bewertungSenderID = 2
		List<Bewertung> bList = f.getListWithAllBewertungenFromUserByUserId(2);
		
		// Gib mir das 1te Element aus dieser Liste ( 'get(0)' ) -> Druck mir den Vornamen aus (getBewertungEmpfaengerID ist ein User-Objekt)
	 	System.out.println(bList.get(0).getBewertungEmpfaengerID().getvName());
		
		// Gib mir f�r jedes 'element' aus der Liste das Datum
	    for (Bewertung element : bList) {
			System.out.println(element.getBewertungDatum());
		} 
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Arbeit mit fahrzeug-Objekten 
	    String typ;
		typ = f.getFahrzeugByUserId(1).getFahrzeugTyp();
		
		System.out.println(typ); */
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Anlegen einer neuen Passagier-Fahrt-Beziehung
		f.newPassagierFahrt(f.getUserById(1), f.getFahrtById(1), "Dresden", "Leipzig"); */
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Am Ende der SQL-Arbeit die Session wieder schlie�en */
		//f.session.close();
		
	}

}
