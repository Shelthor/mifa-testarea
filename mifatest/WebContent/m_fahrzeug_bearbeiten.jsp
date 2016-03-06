<!DOCTYPE html>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<script type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Fahrzeug bearbeiten</title>

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
<%	//Cookie USer auslesen
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
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Facade fNewUserCar = new Facade();
	User user = fNewUserCar.getUserById(userIdAusCookie);
	
	int zaehlen=0;
	int flag=0;
	Fahrzeug kfz;
	String kfzTyp;
	String kfzBez;
	String kfzPlate;
	String kfzFarbe;
	String kfzBild;
	
	
	kfz = fNewUserCar.getFahrzeugByUserId(userIdAusCookie);
	
	kfzTyp = kfz.getFahrzeugTyp();
	kfzBez = kfz.getFahrzeugBezeichnung();
	kfzPlate = kfz.getNummernschild();
	kfzFarbe = kfz.getFahrzeugFarbe();
	kfzBild = kfz.getFahrzeugBildURL();
	
	if(request.getParameter("send")!= null)
	{
		String newCarBezeichnung = request.getParameter("bez");
		String newCarTyp = request.getParameter("typ");
		String carPlate = request.getParameter("kennz_vorn").toUpperCase()+"-"+request.getParameter("kennz_mitte").toUpperCase()+"-"+request.getParameter("kennz_hinten");
		String newCarColor = request.getParameter("color");
		String newCarPicture = "img/1.png";
		String carOwner = "CurrentUser";
		
		try
		{
			
						
		}
		catch (Exception ex)
		{
			out.print("Fahrzeug nicht gefunden");
		}
		
		
		try
		{
			//Ändern Fahrzeug Bezeichnung
			if (request.getParameter("bez")!="")
			{
				flag++;	
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugBezeichnung(newCarBezeichnung);
			}
			
			
			//Ändern Fahrzeug Typ
			if (request.getParameter("typ")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugTyp(newCarTyp);
			}
			
			//Ändern Kennzeichen
			if (request.getParameter("kennz_vorn")!="" | request.getParameter("kennz_mitte")!="" | request.getParameter("kennz_hinten")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setNummernschild(carPlate);
			}
			//Farbe ändern
			if (request.getParameter("color")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugFarbe(newCarColor);
			}
			//Bild ändern
			if (request.getParameter("picture")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugBildURL(newCarPicture);
			}
			
			//out.print(flag+" Änderungen vorgenommen");
			//Update DB
			if (flag > 0)
			{
				fNewUserCar.updateFahrzeug(kfz);
				//Optional Ausgabefenster erstellen mit Gegenüberstellung der Werte
				out.print("<div class='container'>");
				out.print("<p>"+flag+" Änderungen vorgenommen</p>");
				out.print("</div>");
				
			}
			else
			{
				out.print("keine Datensätze werden geändert");
			}
			
		}
		catch(Exception e)
		{
			out.print("Änderungen nicht möglich");
		}
		
	}	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//Felderhandling

if(userIdAusCookie==0)
	{
		out.print("<script>document.getElementById('old').style.display = 'none';</script>");
		out.print("<script>document.getElementById('form').style.display = 'block';</script>");
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
		
		
		</div>
		<div class="row">
			<div class="jumbotron">
				<h1>Fahrzeug bearbeiten</h1>
			</div>
		
		
			<div class="col-xs-12">
				
			<div class="panel panel-default">
			  <div class="panel-body">
			 
			 <div class="col-xs-6">
			  	<p><b>Fahrzeug</b></p>
			    <p><%= kfzBez %></p>
			    <p><%= kfzTyp %></p>
			    <p><%= kfzFarbe %></p>
			    <p>Nummernschild: <%= kfzPlate%></p>
			 </div>
			 <div class="col-xs-6">					 
				<img class="userPic" src="<%= kfzBild%>" alt="kein Bild vorhanden"/>
			 </div>  
			    	
			  </div>
			</div>
		
			
		</div>
		
		</div>
	
	
		<p align="center">Was möchtest du ändern?</p>
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
				<form action="m_fahrzeug_bearbeiten.jsp" method="post">
					<div class="col-sm-12">
						<div class="col-sm-6">
							Hersteller:			
						</div>
						
						<div class="col-sm-6" id="newTyp">
							<input type="text" id="typ" name="typ">	
					    </div>
					</div>
					<div class="col-sm-12">
						<div class="col-sm-6">
							Bezeichnung:		
						</div>
						
						<div class="col-sm-6" id="newTyp">
							<input type="text" id="bez" name="bez">	
					    </div>
					</div>
					<div class="col-sm-12">
						<div class="col-sm-6">
							BKennzeichen:		
						</div>
						
						<div class="col-sm-6" id="newTyp">
							<input type="text" id="kennz_vorn" name="kennz_vorn" style="text-transform:uppercase" size="1" maxlength="3">-
							<input type="text" id="kennz_mitte" name="kennz_mitte" style="text-transform:uppercase" size="1" maxlength="2">
							<input type="text" id="kennz_hinten" name="kennz_hinten" style="text-transform:uppercase" size="4" maxlength="4" min="1" max="9999">
					    </div>
					</div>
					<div class="col-sm-12">
						<div class="col-sm-6">
							newPlate:		
						</div>
						
						<div class="col-sm-6" id="newPlate">
							<input type="text" id="kennz_vorn" name="kennz_vorn" style="text-transform:uppercase" size="1" maxlength="3">-
							<input type="text" id="kennz_mitte" name="kennz_mitte" style="text-transform:uppercase" size="1" maxlength="2">
							<input type="text" id="kennz_hinten" name="kennz_hinten" style="text-transform:uppercase" size="4" maxlength="4" min="1" max="9999">
						</div>
					</div>		
					
					<div class="col-sm-12">
						<div class="col-sm-6">
							Farbe:		
						</div>
						
						<div class="col-sm-6" id="newTyp">
							<input type="text" id="color" name="color">
					    </div>
					</div>
					
					<div class="col-sm-12">
						<div class="col-sm-6">
							Bild:		
						</div>
						
						<div class="col-sm-6" id="newTyp">
						<a href="m_upload_car.jsp">Lade ein Bild hoch</a>				
					    </div>
					</div>
					<div class="col-sm-12 abstandNachOben">
						<div class="col-sm-4">
						</div>
						<div class="col-sm-4">
							<input type="submit" id="submit" name="send" value="Änderungen speichern" />
						</div>
						<div class="col-sm-4">
						</div>		
					</div>
			
				</form>			
		</div>
		<div class="col-md-3">
		</div>
		
		
				
</div>		




</body>
</html>