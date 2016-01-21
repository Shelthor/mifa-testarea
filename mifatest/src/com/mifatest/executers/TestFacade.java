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
		
		//Aus Gründen der Wartbarkeit ist es immer besser, man jaucht die Werte nicht direkt in die Methode,
		//sondern deklariert vorher Variablen, die dann immer wieder neue Werte annehmen können
		
		String EMAILADRESSE = "cle.kruse@googlemail.com";
		Date HEUTE = new Date(90, 9, 16);
		String NACHNAME = "TEST";
		String VORNAME = "222222";
		String TELEFONNUMMER = "017684127806";
		String ISADMIN = "true";
		String ISACTIVATED = "true";
		
	 //   f.newUser(EMAILADRESSE, HEUTE, NACHNAME, VORNAME,TELEFONNUMMER, ISADMIN, ISACTIVATED);
		
		// --- ACHTUNG --- Reihenfolge der Parameter beachten!		
		//Aber keine Sorge: immer wenn man eine Funktion aufruft, die Parameter verlangt, werden die 
		//Parameter von Eclipse vorgeschlagen
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////			
		/*fahrtanlegen-test*/
		/* ACHTUNG - Nur ein f.newIRGENDWAS-Befehl pro JSP */
		
		Date DATUM = new Date(90, 9, 16);
		User FAHRER = f.getUserById(1);
		Time UHRZEIT = new Time(12, 44, 0);
		String GEPAECK = "klein";
		int KAPAZITAET = 2;
		String KOMMENTAR = "keine Umwege > 2km";
		
		String S1 = "Mülltown";
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
		
		f.newFahrt(DATUM, FAHRER, UHRZEIT, GEPAECK, KAPAZITAET, KOMMENTAR, S1, S2, S3, S4, S5, S6, P1, P2, P3, P4, P5, P6);
////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		/* Arbeit mit Listen - SELECT * FROM Tabelle */
		
		// Gib mir eine <List> mit allen Elementen aus der Tabelle Bewertungen, WHERE bewertungSenderID = 2
		List<Bewertung> bList = f.getListWithAllBewertungenFromUserByUserId(2);
		
		// Gib mir das 1te Element aus dieser Liste ( 'get(0)' ) -> Druck mir den Vornamen aus (getBewertungEmpfaengerID ist ein User-Objekt)
	 	System.out.println(bList.get(0).getBewertungEmpfaengerID().getvName());
		
		// Gib mir für jedes 'element' aus der Liste das Datum
	    for (Bewertung element : bList) {
			System.out.println(element.getBewertungDatum());
		} 
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Arbeit mit fahrzeug-Objekten */
	    String typ;
		typ = f.getFahrzeugByUserId(1).getFahrzeugTyp();
		
		System.out.println(typ); 
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Anlegen einer neuen Passagier-Fahrt-Beziehung*/
		f.newPassagierFahrt(f.getUserById(1), f.getFahrtById(1), "Dresden", "Leipzig");
////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/* Am Ende der SQL-Arbeit die Session wieder schließen */
		f.session.close();
		
	}

}
