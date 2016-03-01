<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Persönliche Änderungen</title>
<style>
         a:link {color:white}
         a:visited{color:white}
         a:hover{color:white}
         a:active{color:white}

         #head
         {
            background-color: #CDDC39;
            color: white;
            text-align: center;
            font-family: verdana;
            padding: 5px;
        }

        #tools
        {
            line-height: 30px;
            background-color: #CDDC39;
            height: 300px;
            width: 100px;
            float: left;
            padding: 5px; 
            font-family: verdana;
            color: white; 
            font-size: 100%;
        }

        #footer
        {
            background-color: #CDDC39;
            color:white;
            clear: both;
            text-align: center;
            padding: 5px;
            font-family: verdana;
            font-size: 75%;
        }

        #section
        {
            width: 330px;
            float: left;
            padding: 10;
            font-family: verdana;
           font-size: 100%;
        }

        ul
        {
        	display: inline;
        	padding: 2px;
        	text-align: center;
        	float: left;
        	list-style-type: none;
        }

        #form
        {
        	overflow: auto;
        }

        td
        {
            font-family: verdana;
        }
</style>

</head>
<body>
<%
	Cookie[] cookies = request.getCookies();

		int userIdAusCookie = 0;

		if( cookies != null)
			{
	 			for (int i = 0; i < cookies.length; i++)
	 			{
		 		if(cookies[i].getName().equals("c_userId"))
		 		{
			 	userIdAusCookie = Integer.parseInt(cookies[i].getValue());
		 		}
	 		}
	 	//Kontrolle
	 	//out.print("UserID: " + userIdAusCookie + "<br/>");
}

%>
<%
	Facade fUpdateUser = new Facade();
	User user;
	
	user = fUpdateUser.getUserById(userIdAusCookie);
	
	String username = user.getvName();
	
	int userID = user.getUserID();
	
	int flag=0;
	
	String usernName;
	String userBildURL;
	String userTelNr;
	String userEMail;
	
	String usernNameEingabe = request.getParameter("nameField");
	String userTelNrEingabe = request.getParameter("telNr");
	//+BildUrl
	String usereMailEingabe = request.getParameter("emailAdr");
	
	
	
	
	if(request.getParameter("submit")!= null)
	{
		//Überprüfung, in welchen Feldern Eintragungen getätigt wurden
		//wenn Felder leer -> alte Eintragungen lassen
		//wenn Felder befüllt -> entsprechende Werte ändern
		//danach in DB
		
		try
		{	
			//Name ändern
			if (request.getParameter("nameField") !="")
			{
				flag++;
				user.setnName(usernNameEingabe);
			}
			//Bild ändern
			/*
			if (request.getParameter("picture") != null)
			{
				flag++;
				user.setBildURL();
			}*/
			
			//Telefonnummer ändern
			if (request.getParameter("telNr") !="")
			{
				flag++;
				user.setTelNummer(userTelNrEingabe);
			}
			
			//EMail ändern
			if (request.getParameter("emailAdr") !="")
			{
				flag++;
				user.setTelNummer(usereMailEingabe);
			}
			if (flag > 0)
			{
				fUpdateUser.updateUser(user);
				//Optional Ausgabefenster erstellen mit Gegenüberstellung der Werte
				out.print("<div class='container'>");
				out.print("<p>"+flag+" Änderungen vorgenommen</p>");
				out.print("</div>");
				
			}
			else
			{
				out.print("keine Datensätze wurden geändert");
			}
			
		
		
		}
		catch(Exception e)
		{
			out.print("Änderungen nicht möglich");
		}
	}

%>

<div id="head">
	<h1>Dein Profil,<%=username %></h1>
</div>

<div id="form">
    <div id="formnames">
    		<form action="m_profil_bearbeiten_profil.jsp" method="post">
        		Name ändern:<input type="text" id="name" name="nameField"/>
                
        		Profilbild ändern:<input type="file" id="profilbildupload" name="picture"/>
                
       			Telefonnummer ändern:<input type="text"  name="telNr"/>
                
        		E-Mail Adresse ändern:<input type="text" name="emailAdr"/>
                
        		<input type="submit" id="submit" name="submit" value="Änderungen speichern" />
        		<input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/>
        </form>    
    </div>
</div>

<div id="footer">
    <a href="m_profil_bearbeiten.jsp">zurück</a>
    <a href="c_User.jsp">Startseite</a>
    <a href="m_hilfe.html">Hilfe</a>
</div>



</body>
</html>