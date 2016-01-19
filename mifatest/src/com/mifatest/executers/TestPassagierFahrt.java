package com.mifatest.executers;

import java.util.*;
import java.sql.Time;

import org.hibernate.Hibernate;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

import com.mifatest.entities.Fahrt;
import com.mifatest.entities.PassagierFahrt;
import com.mifatest.entities.User;  

public class TestPassagierFahrt {

	public static void main(String[] args) {
		
		//creating configuration object  
	    Configuration cfg=new Configuration();  
	    cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
	      
	    //creating session factory object  
	    SessionFactory factory=cfg.buildSessionFactory();  
	      
	    //creating session object  
	    Session session=factory.openSession();
	      
	    //creating transaction object  
	    Transaction t=session.beginTransaction(); 
	    
	    // hilfsobjekte für Datum und Uhrzeit
	// Date datum = new Date(90, 9, 16);
	// Time uhrzeit = new Time(12, 44, 0);
	    
	    
	    //bis hierhin immer erforderlich
	    /////////////////////////////////////////////////////////////////////////
	    /////////////////////////////////////////////////////////////////////////
	    //ab hier eigentliche Persistierung
	    
	    /*
	    //1. neuen User anlegen
	    User fahrer = new User();
	    
	    fahrer.seteMail("duschen@dusche.de");
	    fahrer.setGeburtsDatum(datum);
	    fahrer.setnName("Ich bin");
	    fahrer.setTelNummer("03438472301");
	    fahrer.setvName("Passagier 3");
	    fahrer.setIsAdmin("false");
	    fahrer.setIsActivated("true");
	    
	    session.persist(fahrer);//persisting the User
	    
	    */
	    
	    //1. User via ID aus DB laden --> session.load(User.class, ----fahrerID);
	    User user = (User) session.load(User.class, 4);
	    Fahrt fahrt = (Fahrt) session.load(Fahrt.class, 1);
	    
	    //2. neue Fahrt anlegen
	    
	   /* Fahrt bihh = new Fahrt();
	    
	    bihh.setFahrtDatum(datum);
	    bihh.setFahrerID(fahrer);
	    bihh.setFahrtStartZeit(uhrzeit);
	    bihh.setGepaeck("groß");
	    bihh.setKapazitaet(2);
	    bihh.setKommentar("keine nilpferde");
	    bihh.setS1("Bielefeld");
	    bihh.setP1(3);
	    bihh.setS6("Hamburg");
	    bihh.setP6(3);
	    
	    session.persist(bihh);//persisting the Fahrt
	    
	    */
	    
	  //2. neue Passagier_Fahrt anlegen
	    
		    PassagierFahrt dusche = new PassagierFahrt();
		    
		    dusche.setFahrtID(fahrt);
		    dusche.setUserID(user);
		    dusche.setUserStart(fahrt.getS1());
		    dusche.setUserZiel(fahrt.getS6());
		    
		    session.persist(dusche);//persisting the Fahrt
	    
	    //3. abschließend commitend, damit eigentliches SQL ausgeführt wird
	    t.commit();//transaction is committed
	    
	    System.out.println("success");

	}

}
