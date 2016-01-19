package com.mifatest.executers;

import java.sql.Time;
import java.util.*;

import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

import com.mifatest.entities.Nachricht;
import com.mifatest.entities.User;  

public class TestNachricht {

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
	   	  
	    
	    //2. neue Bewertung anlegen (fahrer bewertet passagier1)
	    Nachricht n = new Nachricht();
	    n.setNachrichtEmpfaengerID(an);
	    n.setNachrichtSenderID(von);
	    n.setNachrichtText("hi na");
	    n.setNachrichtZeit(uhrzeit);
		   	    
		    session.persist(n);//persisting the Bewertung
	    
	    //3. abschließend commitend, damit eigentliches SQL ausgeführt wird
		    
	    t.commit();//transaction is committed
	    
	    System.out.println("success");

	}

}
