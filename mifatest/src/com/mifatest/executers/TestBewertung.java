package com.mifatest.executers;

import java.util.*;
import java.sql.Time;

import org.hibernate.Hibernate;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

import com.mifatest.entities.Bewertung;
import com.mifatest.entities.Fahrt;
import com.mifatest.entities.PassagierFahrt;
import com.mifatest.entities.User;  

public class TestBewertung {

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
		Date datum = new Date(90, 9, 16);
		Time uhrzeit = new Time(12, 44, 0);
	    
	    /////////////////////////////////////////////////////////////////////////
	    /////////////////////////////////////////////////////////////////////////
	   
		
	    //1. User via ID aus DB laden --> session.load(User.class, ----fahrerID);
	    User von = (User) session.load(User.class, 1);
	    User an = (User) session.load(User.class, 2);
	    Fahrt fahrt = (Fahrt) session.load(Fahrt.class, 1);
	  
	    
	    //2. neue Bewertung anlegen (fahrer bewertet passagier1)
	    
	    	Bewertung b = new Bewertung();
	    	b.setBewertungDatum(datum);
	    	b.setBewertungSenderID(von);
	    	b.setBewertungEmpfaengerID(an);
	    	b.setFahrtID(fahrt);
	    	b.setBewertungText("deine fette mudd0r");
	    	b.setFahrstilRating(5);
	    	b.setFreundlichkeitRating(5);
	    	b.setPuenktlichkeitRating(5);
		   	    
		    session.persist(b);//persisting the Bewertung
	    
	    //3. abschließend commitend, damit eigentliches SQL ausgeführt wird
		    
	    t.commit();//transaction is committed
	    
	    System.out.println("success");

	}

}
