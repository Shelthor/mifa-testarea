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
		User u;
		
		u = f.getUserByEmail("hallo@tschüss.de");
		System.out.println(u.getnName());
		System.out.println(u.getUserID());
		
		Passwort p;
		p = f.getPasswortByUserId(u.getUserID());
		System.out.println(p.getPasswortValue());
		
		
		
	}

}
