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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>MifaTest</title>
</head>

<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">

<table width="50%" border="1" cellpadding="0" cellspacing="2">
 <caption>Login</caption>
 <tr>
 	<form action="m_index.jsp" method="post">
 	 	<td align="right" font-family="verdana">E-Mail</td>
  		<td><input type="text" name="email" required id="emailID"/></td>
 	
 </tr>
 <tr>
 	
  		<td align="right">Kennwort</td>
  		<td><input type="password" name="password" required id="pwdID"/></td>
 	
 </tr>
 <table width="50%" border="1" cellpadding="0" cellspacing="2">
  <tr>
   <tr>
   <form action="c_User.jsp" method="post">
  		<td align="center"><input type="submit" name="submit" value="Login" onclick="setCookie()" />
  		<!-- <input type="submit" name="cancel" value="Abbrechen"/> -->
  		<script>
  			
  		</script>
  		</td>
	</form>
	
	</form>
 </tr>
  </tr>
 </table>
</table>

<p>Neu bei uns?
<a href="m_registrieren.html">Jetz registrieren!</a>
</p>
<%

if(request.getParameter("submit")!= null)
{
	String email=request.getParameter("email");
	String passwd=request.getParameter("password");
	String passwdDB;
	String loginPage="http://localhost:8080/mifatest/c_User.jsp";
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
	
	System.out.println("BIS HIER" + uPasswort.getPasswortValue());
	if (uPasswort.getPasswortValue().equals(passwd))
	{
		//Cookie Handling
		

		
		Cookie userIdCookie = new Cookie("c_userId",Integer.toString(uLogId));

		userIdCookie.setMaxAge(60*60*24);

		response.addCookie(userIdCookie);
		
		//db abfrage
		
		
		
		//cookie-action
		//u  = getuserbyemail -> u.getUserId(); -> das in cookie mit übergeben
		
		out.print("Passwort stimmt");
		//Seiten redirect auf Profil
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", loginPage);
		
	}else{
		out.println("Login nicht möglich!");
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