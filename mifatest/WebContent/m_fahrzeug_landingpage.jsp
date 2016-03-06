<!DOCTYPE html>
<html>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Wohin als nächstes?</title>
	
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
</head>
<body>


<%
//ID aus Cookie holen
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
//Prüfe, ob Fahrzeug zur zugehörigen UserID existiert
//wenn nein --> nur "neues Fahrzeug erstellen" möglich
//wenn ja   --> nur Fahrzeug bearbeiten möglich (1:1-Beziehung in DB)
 int kontrolle = 0;
 String link = "213.187.73.194/mifa/";

 int fahrzeugid,fahrzeuguserid;
 Facade fahrzeugOwnerDB = new Facade();
 Boolean fahrzeugvorhanden=false;
 int fahrzeugNeu = 0;
 
 User user = fahrzeugOwnerDB.getUserById(userIdAusCookie);
 
 Fahrzeug fahrzeug;
	//
 Fahrzeug fahrz = fahrzeugOwnerDB.getFahrzeugByUserId(userIdAusCookie);
 %>
 
<div class='container'>
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
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userIdAusCookie%>">Mein öffentliches Profil</a></li>
		            <li><a href="#">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	
	
		<div class="jumbotron">
			<h1>Wohin als nächstes?</h1>
		</div>
		<div class="col-md-3">
		</div>
 
 		<div class="col-md-6">
 			<div class="panel panel-default">
 				<div class="panel-body">

					<% 
					 
					try
					{
							fahrzeugid = fahrzeugOwnerDB.getFahrzeugByUserId(userIdAusCookie).getFahrzeugID(); 
						
					 
					 		if (fahrzeugid > 0)
					 		{
						 		
						 		fahrzeugvorhanden=true;
					 		}
					 		
					 		if (fahrzeugid <= 0)
					 		{
					 			fahrzeugvorhanden=false;
					 		}
					
					 			if (fahrzeugvorhanden==true)
					 			{
									out.print("<div class='col-md-12'>");
						 			out.print("Dein Fahrzeug existiert bereits. Für Änderungen ");
						 			String linkToUpdateCar = ("m_fahrzeug_bearbeiten.jsp");
						 			out.print("<a href='"+linkToUpdateCar+"'>bitte hier entlang.</a>");
									out.print("</div>");
					 			}
					
					}
					catch (Exception e)
					{
							e.toString();
							if (fahrzeugvorhanden==false)
							{
								fahrzeugNeu=1;
								if(fahrzeugNeu==1)
								 {
								 	out.print("<div class='container' align='center'>");
									out.print("Du hast noch kein Fahrzeug hinterlegt. ");
									String linkToNewCar = ("m_neues_auto.jsp");
									out.print("<a href='"+linkToNewCar+"'>Das kannst du aber hier.</a>");
									out.print("</div>");
								 }
							}
					}
					
					if(kontrolle == 0)
					{
							try
							{
								fahrzeuguserid = userIdAusCookie;
								
							}
						
							catch (Exception ex) 
							{
								
							}
						}
					%>
				</div>
			</div>
		</div>
		
		<div class="col-xs-12">
				
			<div class="panel panel-default">
			  <div class="panel-body">
			 
			 <div class="col-xs-6">
			  	<p><b>Fahrzeug</b></p>
			    <p><%= fahrz.getFahrzeugBezeichnung() %></p>
			    <p><%= fahrz.getFahrzeugTyp() %></p>
			    <p>Nummernschild: <%= fahrz.getNummernschild()%></p>
			 </div>
			 <div class="col-xs-6">					 
				<img class="userPic" src="<%= fahrz.getFahrzeugBildURL()%>" alt="kein Bild vorhanden"/>
			 </div>  
			    
	
			  </div>
			</div>
		
			
		</div>
		
	</div>
</div>

</body>
</html>