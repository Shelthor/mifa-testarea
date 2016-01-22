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
		
		
		String EMAILADRESSE = "cle.kruse@googlemail.com";
		Date HEUTE = new Date(90, 9, 16);
		String NACHNAME = "Kruse";
		String VORNAME = "Clemens";
		String TELEFONNUMMER = "017684127806";
		String ISADMIN = "true";
		String ISACTIVATED = "true";
		
	    f.newUser(EMAILADRESSE, HEUTE, NACHNAME, VORNAME,TELEFONNUMMER, ISADMIN, ISACTIVATED);
	}

}
