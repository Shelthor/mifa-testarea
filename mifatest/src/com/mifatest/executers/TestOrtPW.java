package com.mifatest.executers;

import java.util.*;
import java.sql.Time;

import org.hibernate.Hibernate;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;  
import org.hibernate.cfg.Configuration;

import com.mifatest.entities.Fahrt;
import com.mifatest.entities.Ort;
import com.mifatest.entities.Passwort;
import com.mifatest.entities.User;  

public class TestOrtPW {

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
	    
	    
	    //1. neuen User anlegen
	    Passwort pw = new Passwort();
	    Ort ort = new Ort();
	    
	    pw.setPasswortValue("hund123");
	    pw.setUserID((User) session.load(User.class, 3));
	    
	    ort.setOrtBezeichnung("Kössern");
	    ort.setPLZ("04668");
	
	    session.persist(pw);//persisting the User
	    session.persist(ort);//persisting the User
	    
	    
	    //3. abschließend commitend, damit eigentliches SQL ausgeführt wird
	    t.commit();//transaction is committed
	    
	    System.out.println("success");

	}

}
