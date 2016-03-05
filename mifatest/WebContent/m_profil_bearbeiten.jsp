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

	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

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

<div class="container">
		<div class="row">
		
			<nav class="navbar navbar-default navbar-fixed-top">
				  <div class="container-fluid">
				    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="c_index.jsp"><img src="img/logo_ba_dresden.png" style="height:100%;"/></a>
				    </div>
					    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				    
				    <ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo <%= user.getvName() %>!<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="c_UserOeffentlich.jsp?userid=<%=user.getUserID()%>">Mein öffentliches Profil</a></li>
				            <li><a href="c_User.jsp">Terminal</a></li>
				          </ul>
				        </li>
			      	</ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
			</nav>
		
		<div class="row">
			<div class="jumbotron">
				<h1>Bearbeite dein Profil</h1>
			</div>
			<div class="col-md-2">
			</div>				
			<div id="form" class="col-cs-12 col-md-8">
			    <div id="formnames">
			    	<form class="col-md-12" action="m_profil_bearbeiten.jsp" method="post">
			    	
			    		<div class="panel panel-default">
			    			<div class="panel-body">
				    		<div class="col-xs-12">
					    		<div class="col-xs-6">
					    			<p>Vorname ändern:</p>
					    		</div>
					  
					    		<div class="col-xs-6">
					    			<input type="text" id="name" name="nameField"/>
					    		</div>
					    	</div>
					    	<div class="col-xs-12">
					    		<div class="col-xs-6">
					    			<p>Telefonnummer ändern:</p>
					    		</div>
					    		<div class="col-xs-6">
					    			<input type="text"  name="telNr"/>
					    		</div>
					    	</div>
					    	<div class="col-xs-12">
					    		<div class="col-xs-6">
					    			<p>E-Mail Adresse ändern:</p>
					    		</div>
					    		<div class="col-xs-6">
					    			<input type="text" name="emailAdr"/>
					    		</div>
					    	</div>
					    	</div>
				 	   </div>
				    	
				    	<div class="col-xs-12 abstandNachOben">
				    		<div class="col-xs-6">
				    			<input type="submit" id="submit" name="submit" value="Änderungen speichern" />
				    		</div>
				    		<div class="col-xs-6">
				    			<input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/>
				    		</div>
				    	</div>
				    	
				    	<a href="m_upload_user.jsp">Bild hochladen</a>
       		
			     </form>  
			    </div>
  			</div>
  			<div class="col-md-2">
			</div>
		</div>
			
		</div>
</div>
</body>
</html>