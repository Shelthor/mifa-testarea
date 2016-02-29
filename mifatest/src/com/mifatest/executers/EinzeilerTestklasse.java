package com.mifatest.executers;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.*;

public class EinzeilerTestklasse {

	public static void main(String[] args) {
		Facade f = new Facade();
		
	//	f.newBewertung("haalll", 2, 2, 3, f.getUserById(1), f.getUserById(2), new Date(), f.getFahrtById(1));
		//f.newPassagierFahrt(f.getUserById(1), f.getFahrtById(1), "Dresden", "Leipzig");
		//fdsadasd.newPasswort(fdsadasd.getUserById(2), "duschen");
		
		/*
		String EMAILADRESSE = "cle.kruse@googlemail.com";
		Date HEUTE = new Date(90, 9, 16);
		String NACHNAME = "Kruse";
		String VORNAME = "Clemens";
		String TELEFONNUMMER = "017684127806";
		String ISADMIN = "true";
		String ISACTIVATED = "true";
		
	    f.newUser(EMAILADRESSE, HEUTE, NACHNAME, VORNAME,TELEFONNUMMER, ISADMIN, ISACTIVATED);
	    */
		
		/*
		List<User> uListA = f.checkBewertungenA(f.getFahrtById(2), f.getUserById(1));
		
		for( int i = 0; i < uListA.size() ; i++)
			System.out.println(uListA.get(i).getnName());
		
		List<User> uListB = f.checkBewertungenB(f.getFahrtById(2));
		for( int i = 0; i < uListB.size() ; i++)
			System.out.println(uListB.get(i).getnName());
		
		 boolean b  = uListA.equals(uListB);
		 System.out.println(b);
		 */
		
		/*
		List<User> l = f.getAllPassagiereOfFahrtByFahrtId(2);
		System.out.println(l.get(0).geteMail());
		System.out.println(l.get(1)); */

		/*
		
		Encryptor en = new Encryptor();
		String userPw = "root";
		
		String hash = en.inc(userPw);
		
		System.out.println(hash);
		
		try{
			f.newUser("hash4@dsd.de", new Date(), "Hash", "Peter", "123 4 44 ", hash);
		}catch(Exception e){
			System.out.println(e);
		}
		
*/
		/*
		String myNewCarTyp = "duschen";
		String myNewCarBez = "duschen";
		String myNewCarPlate = "duschen";
		String myNewCarColor = "duschen";
		//Wie Bild erfassen?
		String myNewCarPicture = "Picture";
		String carOwner = "CurrentUser";
		
		Facade fcreateNewCar = new Facade();
		
		try
		{
			//fNewUserCar.newFahrzeug(ftyp, fBez, nschild, fFarbe, url)
			//Erzeugt neues Fahrzeug
			fcreateNewCar.newFahrzeug(myNewCarTyp, myNewCarBez, myNewCarPlate, myNewCarColor, myNewCarPicture);
			System.out.print("Fahrzeug anlegen erfolgreich.");
		}
		catch(Exception e)
		{
			e.toString();
			System.out.print("Fahrzeug anlegen fehlgeschlagen!");
		}
		*/
		
		String fBez = "16duschen";
		String fTyp = "16Ente";
		String fBesch = "16duscht regelm‰ﬂig";
		
		f.newFunktion(fBez, fTyp, fBesch);
		
		String pBez = "16duschen - 1";
		String pTyp = "16Ente - 1";
		String pBesch = "16duscht regelm‰ﬂig - 1";
		int fuId = f.aktuelleFunktionsID;
				
		Facade f2 = new Facade();
				
		f2.newParameter(pBez, pTyp, pBesch, fuId);
		
		f2 = new Facade();
		
		pBez = "16duschen - 2";
		pTyp = "16Ente - 2";
		pBesch = "16duscht regelm‰ﬂig - 2";
		
		f2.newParameter(pBez, pTyp, pBesch, fuId);
		
		f2 = new Facade();
		
		pBez = "16duschen - 3";
		pTyp = "16Ente - 3";
		pBesch = "16duscht regelm‰ﬂig - 3";
		
		f2.newParameter(pBez, pTyp, pBesch, fuId);
		
		f2 = new Facade();
		
		pBez = "16duschen - 4";
		pTyp = "16Ente - 4";
		pBesch = "16duscht regelm‰ﬂig - 4";
		
		f2.newParameter(pBez, pTyp, pBesch, fuId);
		
		
		
	}

}
