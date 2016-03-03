package com.mifatest.executers;
import com.mifatest.entities.*;

import java.util.*;
import java.math.*;

import javax.management.Query;

import java.sql.Time;

import org.hibernate.Criteria;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;


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
	
	private int aktuelleFunktionsID;
	private int aktuellesFahrzeugID;

	public int getAktuelleFunktionsID() {
		return aktuelleFunktionsID;
	}

	public void setAktuelleFunktionsID(int aktuelleFunktionsID) {
		this.aktuelleFunktionsID = aktuelleFunktionsID;
	}
	
	public int getAktuellesFahrzeugID() {
		return aktuellesFahrzeugID;
	}

	public void setAktuellesFahrzeugID(int aktuellesFahrzeugID) {
		this.aktuellesFahrzeugID = aktuellesFahrzeugID;
	}

	Funktion funktion;

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
        
        return Math.round(100.0 *mittelwert) / 100.0;
	}
	
	/* Clemens 26.1.2016 */
	
	public List<User> getUsersWhoAreRatedByUserId(int fahrtID, int userID){
		//gib Liste mit Bewerteten Usern zurück, zugehörig zur Fahrt *fahrtID und zum Sender *userID
		org.hibernate.Query q= session.createQuery("select bewertungEmpfaengerID from Bewertung as u where u.bewertungSenderID =" + " " + userID + " and u.fahrtID = " + fahrtID);
		
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
//DOKU//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public void newFunktion(String bez, String typ, String besch){
		funktion = new Funktion();
		
		funktion.setFunktionBeschreibung(besch);
		funktion.setFunktionBezeichnung(bez);
		funktion.setFunktionTyp(typ);

 		session.persist(funktion);
 		
 		t.commit();
 		
 		aktuelleFunktionsID = funktion.getFunktionID();
 		
 		System.out.println("new Funktion success");
 	}
	
	public Funktion getFunktionById(int id){
		return (Funktion) session.load(Funktion.class, id);
	}
	
	public void newParameter(String bez, String typ, String besch,int fId){
		Parameter par = new Parameter();
		
		par.setParameterBeschreibung(besch);
		par.setParameterBezeichnung(bez);
		par.setParameterTyp(typ);
		par.setFunktionID(getFunktionById(fId));

 		session.persist(par);
 		
 		t.commit();
 		
 		System.out.println("success");
 	}
	
	public List<Funktion> getListWithAllFunktionen(){

		org.hibernate.Query q= session.createQuery("from Funktion");
	
		List result = q.list();
		
		return result;
	}
	
	public List<Parameter> getListWithAllParameterByFunktionsId(int fId){

		org.hibernate.Query q= session.createQuery("from Parameter as u where u.funktionID = " + fId);
	
		List result = q.list();
		
		return result;
	}
	
//Users//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	public void newUser(String mail, Date bDate, String nachn, String vorn, String tel, String pw){
 		
 		String admin = "false", act = "false", bild = "img/1.png";
 		
	    user.seteMail(mail);
	    user.setGeburtsDatum(bDate);
	    user.setnName(nachn);
	    user.setTelNummer(tel);
	    user.setvName(vorn);
	    user.setIsAdmin(admin);
	    user.setIsActivated(act);
	    user.setUserBildURL(bild);
	    
	    //session.merge(user); 	//diese Zeile hat bei mir Probleme gemacht, scheint als würde er
	    						//den user automatisch mit "mergen", weil user=fremdschlüssel in passwort
	    
	    Passwort pass = new Passwort();
	    pass.setPasswortValue(pw);
	    pass.setUserID(user);
	    
	    session.merge(pass);
	    
	    t.commit();
	    
	    System.out.println("success");
	}
 	
 	public User getUserById(int id){ 
		return (User) session.load(User.class, id);
	}
 	public User getUserByEmail(String eMail)
 	{
 	//from mifatest.user where eMail = 'hallo@tschüss.de';
 	org.hibernate.Query q= session.createQuery("from User as u where u.eMail =" + " '" + eMail + "'");
	
	List<User> result = q.list();   //nur noch anpassen
 	return result.get(0);
 	}
 	public void updateUser(User f){
		session.update(f); 
		t.commit();
	}
//Fahrten//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	public void newFahrt(Date fDatum, int fahrerid, Time uhrzeit, String gepaeck, int kap, String comment, String s1, String s2, String s3, String s4, String s5, String s6, int p1, int p2, int p3, int p4, int p5, int p6) {
 		
 		fahrt = new Fahrt();
	    
 		fahrt.setFahrtDatum(fDatum);
 		fahrt.setFahrerID(getUserById(fahrerid));
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
	
	public List<Fahrt> getListWithAllFahrtenWhichContainStart(String userEingabe){
		
		org.hibernate.Query q= session.createQuery("from Fahrt as u where u.s1 like '" + userEingabe + "' or u.s2 like '" + userEingabe + "' or u.s3 like '" + userEingabe + "' or u.s4 like '" + userEingabe + "' or u.s5 like '" + userEingabe + "'");
	
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
	
	public Passwort getPasswortByUserId(int userid)
	{
		org.hibernate.Query q= session.createQuery("from Passwort as u where u.userID =" + " " + userid + "");
		List<Passwort> result = q.list();
		
		return result.get(0);
		
	}
	
//Fahrzeuge//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 	public void newFahrzeug(String ftyp, String fBez, String nschild, String fFarbe, String url){
 		//public void newFahrzeug(String ftyp, String fBez, String nschild, String fFarbe, String url,int besitzer)
 		
 		fahrzeug = new Fahrzeug();
 		
 		fahrzeug.setFahrzeugTyp(ftyp);
 		fahrzeug.setFahrzeugBezeichnung(fBez);
 		fahrzeug.setNummernschild(nschild);
 		fahrzeug.setFahrzeugFarbe(fFarbe);
 		fahrzeug.setFahrzeugBildURL(url);
 		//fahrzeug.setBesitzer(besitzerID);
 		session.persist(fahrzeug);
 		
 		t.commit();
 		
 		aktuellesFahrzeugID = fahrzeug.getFahrzeugID();
 		
 		System.out.println("fahrzeug success");
 	}
 	
 	public Fahrzeug getFahrzeugById(int fId){
 		org.hibernate.Query q= session.createQuery("from Fahrzeug as u where u.fahrzeugID =" + " " + fId + "");
		List<Fahrzeug> result = q.list();
		
		return result.get(0);
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
 	
 	public List<String> getListWithAllOrteLike(String searchKeyword){
	    org.hibernate.Query q= session.createQuery("select distinct u.ortBezeichnung from Ort as u where u.ortBezeichnung like '"+ searchKeyword + "%'");

	    List result = q.list();
	    
	    return result;
	}
 	
 	public List<Ort> getListWithAllOrteAusStrecke(String searchKeyword, int tour){
	    org.hibernate.Query q= session.createQuery("from Fahrt as u where u.ortBezeichnung like '"+ searchKeyword + "%'");
		
		List result = q.list();
		
		return result;
	}
//Passagier-Fahrt-Relations//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	
 	public void newPassagierFahrt(int userid, int fahrtid, String uStart, String uZiel){
 		
 		passagierFahrt = new PassagierFahrt();
 		
 		passagierFahrt.setFahrtID(getFahrtById(fahrtid));
 		passagierFahrt.setUserID(getUserById(userid));
 		passagierFahrt.setUserStart(uStart);
 		passagierFahrt.setUserZiel(uZiel);
 		
 		session.merge(passagierFahrt);
 		
 		t.commit();
 		
 		System.out.println("success");
 	}
 	
 	public List<User> getListWithAllPassagiereOfFahrtByFahrtId(int fId){
 		org.hibernate.Query q= session.createQuery("select userID from PassagierFahrt as u where u.fahrtID =" + " " + fId + "");

		List<User> luf;
		
		luf=q.list();
		
		return  luf;
 	}
 	
 	public List<PassagierFahrt> getListWithAllPassagierFahrtRelationsByFahrtId(int fId){
 		org.hibernate.Query q= session.createQuery("from PassagierFahrt as u where u.fahrtID =" + " " + fId + "");

		List<PassagierFahrt> luf;
		
		luf=q.list();
		
		return  luf;
 	}
 	
 	public PassagierFahrt getPassagierFahrtByFahrtAndMitfahrerId(int fahrtId, int mitfahrerId){
 		/*
 		org.hibernate.Query q= session.createQuery("from PassagierFahrt as u where u.userID =" + " " + mitfahrerId + " and fahrtID = " + fahrtId + "");

		List<PassagierFahrt> luf;
		
		luf=q.list();
		
		return  (PassagierFahrt) session.load(PassagierFahrt.class, luf.get(0));
		
		
		/*
		 * 
		 */
		
		org.hibernate.Query q= session.createQuery("from PassagierFahrt as u where u.userID =" + " " + mitfahrerId + " and fahrtID = " + fahrtId + "");
		List<PassagierFahrt> result = q.list();
		
		return result.get(0);
 	}
 	
//User-Fahrzeug-Relations//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 	public void newUserFahrzeug(int fahrzid, int userid){

 		userFahrzeug = new UserFahrzeug();
 		userFahrzeug.setFahrzeugID(getFahrzeugById(fahrzid));
 		userFahrzeug.setUserID(getUserById(userid));
 		
 		session.merge(userFahrzeug);
 		
 		t.commit();
 		
 		System.out.println("user_fahrzeug success");
 	}
}
