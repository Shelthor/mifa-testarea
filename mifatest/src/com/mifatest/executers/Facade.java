package com.mifatest.executers;
import com.mifatest.entities.*;

import java.util.*;

import javax.management.Query;

import java.sql.Time;

import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

public class Facade {
	Bewertung bewertung;
	Fahrt fahrt;
	Fahrzeug fahrzeug;
	Nachricht nachricht;
	Ort ort;
	PassagierFahrt passagierFahrt;
	Passwort passwort;
	User user = new User();
	UserFahrzeug userFahrzeug;

// - - - Hibernate - - - //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/* Konstruktor öffnet Session und beginnt Transaktion*/
	Session session;
	Transaction t;
	
	public Facade(){
		//creating configuration object  
	    Configuration cfg=new Configuration();  
	    cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
	      
	    //creating session factory object  
	    SessionFactory factory=cfg.buildSessionFactory();  
	      
	    //creating session object  
	    session=factory.openSession();
	      
	    //creating transaction object  
	    t=session.beginTransaction(); 
	}
		
//Bewertungen/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/* Clemens - 25.01. */
	public void newBewertung(String text, int fahrstil, int puenktlich, int freundlich, User empfid, User senderid, Date datum, Fahrt fahrtid ){

 		bewertung = new Bewertung();
 		
 		bewertung.setBewertungText(text);
 		bewertung.setFahrstilRating(fahrstil);
 		bewertung.setPuenktlichkeitRating(puenktlich);
 		bewertung.setFreundlichkeitRating(freundlich);
 		bewertung.setBewertungEmpfaengerID(empfid);
 		bewertung.setBewertungSenderID(senderid);
 		bewertung.setBewertungDatum(datum);
 		bewertung.setFahrtID(fahrtid);
 		
 		session.merge(bewertung);
 		t.commit();
 	}
	
	public List<Bewertung> getListWithAllBewertungenFromUserByUserId(int userid){

		org.hibernate.Query q= session.createQuery("from Bewertung as u where u.bewertungSenderID =" + " " + userid + "");
	
		List result = q.list();
		
		return result;
	}
	
	public List<Bewertung> getListWithAllBewertungenToUserByUserId(int userid){

		org.hibernate.Query q= session.createQuery("from Bewertung as u where u.bewertungEmpfaengerID =" + " " + userid + "");
	
		List result = q.list();
				
		return result;
	}
	
	public double durchschnitt(List<Integer> rating){
		
		int max = 0;
        int min = 0;
        double mittelwert = 0;
        double summe = 0;
        
        boolean first = true;
		
		for (Integer next : rating) {
            summe = summe + next;
            if (next > max)
                max = next;
            if (first){
                min = next;
                                first = false;
            }else if (next < min)
                min = next;        
        }

        mittelwert = summe / rating.size();
        
        return mittelwert;
	}
	
	/* Clemens 26.1.2016 */
	
	public List<User> checkBewertungenA(Fahrt fahrtID, User userID){
		//gib Liste mit Bewerteten Usern zurück, zugehörig zur Fahrt *fahrtID und zum Sender *userID
		org.hibernate.Query q= session.createQuery("select bewertungEmpfaengerID from Bewertung as u where u.bewertungSenderID =" + " " + userID.getUserID() + " and u.fahrtID = " + fahrtID.getFahrtID());
		
		List result = q.list();
		return result;
	}
	
	public List<User> checkBewertungenB(Fahrt fahrtID){
		//gib Liste mit Bewerteten Usern zurück, zugehörig zur Fahrt *fahrtID und zum Sender *userID
		org.hibernate.Query q= session.createQuery("select userID from PassagierFahrt as u where u.fahrtID =" + fahrtID.getFahrtID());
		
		List result = q.list();
		return result;
	}
	
//Nachrichten//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public void newNachricht(User senderid, User empfid, String text, Time zeit){

 		nachricht = new Nachricht();
 		
 		nachricht.setNachrichtEmpfaengerID(empfid);
 		nachricht.setNachrichtSenderID(senderid);
 		nachricht.setNachrichtText(text);
 		nachricht.setNachrichtZeit(zeit);
 		
 		session.merge(nachricht);
 		
 		t.commit();
 		
 		System.out.println("success");
 	}
	
	public Nachricht getNachrichtById(int id){
		return (Nachricht) session.load(Nachricht.class, id);
	}
	
	public List<Nachricht> getListWithAllNachrichtenFromUserByUserId(int userid){
		
		org.hibernate.Query q= session.createQuery("from Nachricht as u where u.nachrichtSenderID =" + " " + userid + "");
	
		List result = q.list();
		
		return result;
	}
	
	public List<Nachricht> getListWithAllNachrichtenToUserByUserId(int userid){
		
		org.hibernate.Query q= session.createQuery("from Nachricht as u where u.nachrichtEmpfaengerID =" + " " + userid + "");
	
		List result = q.list();
		
		return result;
	}

//Users//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	public void newUser(String mail, Date bDate, String nachn, String vorn, String tel, String admin, String act ){
 		
	    //bDate = new Date(90, 9, 16);// hilfsobjekt für Datum 
	    
	    user.seteMail(mail);
	    user.setGeburtsDatum(bDate);
	    user.setnName(nachn);
	    user.setTelNummer(tel);
	    user.setvName(vorn);
	    user.setIsAdmin(admin);
	    user.setIsActivated(act);
	    
	    session.merge(user);
	    
	    t.commit();
	    
	    System.out.println("success");
	}
 	
 	public User getUserById(int id){ 
		return (User) session.load(User.class, id);
	}
 	
 	public void updateUser(User f){
		session.update(f); 
		t.commit();
	}
//Fahrten//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	public void newFahrt(Date fDatum, User fahrerid, Time uhrzeit, String gepaeck, int kap, String comment, String s1, String s2, String s3, String s4, String s5, String s6, int p1, int p2, int p3, int p4, int p5, int p6) {
 		
 		fahrt = new Fahrt();
	    
 		fahrt.setFahrtDatum(fDatum);
 		fahrt.setFahrerID(fahrerid);
 		fahrt.setFahrtStartZeit(uhrzeit);
 		fahrt.setGepaeck(gepaeck);
	    fahrt.setKapazitaet(kap);
	    fahrt.setKommentar(comment);
	    
	    fahrt.setS1(s1);
	    fahrt.setP1(p1);
	    fahrt.setS2(s2);
	    fahrt.setP2(p2);
	    fahrt.setS3(s3);
	    fahrt.setP3(p3);
	    fahrt.setS4(s4);
	    fahrt.setP4(p4);
	    fahrt.setS5(s5);
	    fahrt.setP5(p5);
	    fahrt.setS6(s6);
	    fahrt.setP6(p6);
	    
	    session.merge(fahrt);
	   
	    t.commit();
	    
	    System.out.println("success");
 	}
 	
	public Fahrt getFahrtById(int id){
		
		return (Fahrt) session.load(Fahrt.class, id);
	}
	
	public User getFahrerByFahrtId(int fahrtid){
		org.hibernate.Query q= session.createQuery("from Fahrt as u where u.fahrtID =" + " " + fahrtid + "");

		List<Fahrt> lf;
		
		lf=q.list();
		
		return  (User) session.load(User.class, lf.get(0).getFahrerID().getUserID());	
	}
	
	public List<Fahrt> getListWithAllAngeboteneFahrtenOfUserByUserId(int userid){
		
		org.hibernate.Query q= session.createQuery("from Fahrt as u where u.fahrerID =" + " " + userid + "");
	
		List result = q.list();
		
		return result;
	}
	
	public void updateFahrt(Fahrt f){
		session.update(f); 
		t.commit();
	}
	
//Passwörter//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
	public void newPasswort(User userid, String value){

 		passwort = new Passwort();
 		passwort.setUserID(userid);
 		passwort.setPasswortValue(value);
 		
 		session.persist(passwort);
 		
 		t.commit();
 		
 		System.out.println("passwort success");
 	}
	
	public void updatePasswort(Passwort f){
		session.update(f); 
		t.commit();
	}
	
//Fahrzeuge//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 	public void newFahrzeug(String ftyp, String fBez, String nschild, String fFarbe, String url){
 		
 		
 		fahrzeug = new Fahrzeug();
 		
 		fahrzeug.setFahrzeugTyp(ftyp);
 		fahrzeug.setFahrzeugBezeichnung(fBez);
 		fahrzeug.setNummernschild(nschild);
 		fahrzeug.setFarzeugFarbe(fFarbe);
 		fahrzeug.setFahrzeugBildURL(url);
 		
 		session.merge(fahrzeug);
 		
 		t.commit();
 		
 		System.out.println("fahrzeug success");
 	}
 	
 	public Fahrzeug getFahrzeugByUserId(int userid){
		
		
		org.hibernate.Query q= session.createQuery("from UserFahrzeug as u where u.userID =" + " " + userid + "");

		List<UserFahrzeug> luf;
		
		luf=q.list();
		
		return  (Fahrzeug) session.load(Fahrzeug.class, luf.get(0).getFahrzeugID().getFahrzeugID());
	}
 	
 	public void updateFahrzeug(Fahrzeug f){
		session.update(f); 
		t.commit();
	}
//Orte//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	public void newOrt(String bez, String plz){

 		ort = new Ort();
 		
 		ort.setOrtBezeichnung(bez);
 		ort.setPLZ(plz);

 		session.merge(ort);
 		
 		t.commit();
 	} 	
//Passagier-Fahrt-Relations//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	
 	public void newPassagierFahrt(User userid, Fahrt fahrtid, String uStart, String uZiel){
 		
 		passagierFahrt = new PassagierFahrt();
 		
 		passagierFahrt.setFahrtID(fahrtid);
 		passagierFahrt.setUserID(userid);
 		passagierFahrt.setUserStart(uStart);
 		passagierFahrt.setUserZiel(uZiel);
 		
 		session.merge(passagierFahrt);
 		
 		t.commit();
 		
 		System.out.println("success");
 	}
 	
//User-Fahrzeug-Relations//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 	public void newUserFahrzeug(Fahrzeug fahrzid, User userid){

 		userFahrzeug = new UserFahrzeug();
 		userFahrzeug.setFahrzeugID(fahrzid);
 		userFahrzeug.setUserID(userid);
 		
 		session.merge(userFahrzeug);
 		
 		t.commit();
 		
 		System.out.println("success");
 	}
}
