package com.mifatest.executers;

import java.util.*;
import java.sql.Time;

import org.hibernate.Hibernate;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

import com.mifatest.entities.Fahrt;
import com.mifatest.entities.Fahrzeug;
import com.mifatest.entities.User;
import com.mifatest.entities.UserFahrzeug;  

public class TestUserFahrzeug {

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
	    User user = (User) session.load(User.class, 1);
	    Fahrzeug f = new Fahrzeug();
	    
	    //
	    
	    f.setFahrzeugBezeichnung("VW Golf");
	    f.setFahrzeugBildURL("dd");
	    f.setFahrzeugTyp("kombi");
	    f.setFarzeugFarbe("blau");
	    f.setNummernschild("XFDD162");
	    
	    session.persist(f);
	    //2. neue Fahrt anlegen
	    
	    UserFahrzeug u = new UserFahrzeug();
	    
	    u.setFahrzeugID(f);
	    u.setUserID(user);
	    
	    session.persist(u);
	    
	    //3. abschließend commitend, damit eigentliches SQL ausgeführt wird
	    t.commit();//transaction is committed
	    
	    System.out.println("success");

	}

}
