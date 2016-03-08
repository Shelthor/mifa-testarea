<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
</head>

<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">

<div class="container">
	<div class="jumbotron">
		<h1>Einloggen</h1>
 	</div>
 	<div class="row">
	 	<div class="col-md-4 col-xs-12">

	 	</div>
	 	<div class="panel panel-default col-md-4 col-xs-12">
				<div class="panel-body">
				    <form action="m_index.jsp" method="post">
				  		<h4>Login</h4>
						<p>eMail</p>
					  	<input type="text" name="email" required id="emailID"/><br/>
						<p>Passwort</p>
					  	<input type="password" name="password" required id="pwdID"/><br/><br/>
					  	<input type="submit" name="submit"/>
					 </form>
				 </div>
		</div>
		<div class="col-md-4 col-xs-12">

	 	</div>
 	</div>
	    
	 	<p>Neu bei uns?
			<a href="m_registrieren.jsp">Jetz registrieren!</a>
		</p>
</div>

<%

if(request.getParameter("submit")!= null)
{
	String email=request.getParameter("email");
	String passwd=request.getParameter("password");
	
	//SeitenPfad
	String domain = "http" + "://" +   
   		request.getServerName() +       // "myhost"
  		":" + request.getServerPort() + // ":" + "8080"
    	"/mifatest";
	
	
	//String url = ((HttpServletRequest)request).getRequestURL().toString();
	String loginPage= domain + "/c_User.jsp";
	String theCookieValue = request.getParameter("email");

	Facade fUserLogin = new Facade();
	try{
	//Auf Klick Login überprüfen, ob User bereits in DB vorhanden.
	//über E-Mail und Passwort authentifizieren
	//Über UserID Session managen --> an Cookie übergeben
	//false: --> Ausgabe mit Link zum registrieren
	//true: --> Profilseite des Users öffnen und UserId in Cookie übergeben
		User uLog = fUserLogin.getUserByEmail(email);
		int uLogId = uLog.getUserID();
		Passwort uPasswort = fUserLogin.getPasswortByUserId(uLogId);
		
	
		if(uLog.getIsActivated().equals("true"))
		{
			//HASH
			Encryptor en = new Encryptor();
			String hash = en.inc(passwd);
		//
		
		
		if (uPasswort.getPasswortValue().equals(hash))
		{
			//Cookie Handling

			Cookie userIdCookie = new Cookie("c_userId",Integer.toString(uLogId));

			userIdCookie.setMaxAge(60*60*24);

			response.addCookie(userIdCookie);
			
			//db abfrage
			
			out.print("Passwort stimmt");
			//Seiten redirect auf Profil
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", loginPage);
			
			}else{
				out.println("Login nicht möglich!");
			}
		}
		
		else{
			out.print("Bitte aktiviere zunächst deinen Account. Du hast dazu eine Mail erhalten.");
		}
	
	
	
	//wenn formlogin==true dann check mit registrierten eingaben der DB ob user angemeldet werden kann
	//danach öffnen der Profilseite, andernfalls LoginScreen wieder aufrufen!
	}
	catch(Exception e) 
	{
		out.print("Login nicht möglich!");
	}
}

//Methode noch festlegen, wann Cookie ausgeführt wird --> nach erfolgreichem Login
//wenn LoginForm==true dann UserId in Cookie übergeben	

%>

</body>
</html>