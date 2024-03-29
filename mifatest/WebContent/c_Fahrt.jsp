<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Fahrt</title>
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
	        async defer></script>
	        

</head>
<body>
<%
	/*
		Hole userId aus Cookie heraus
	*/

	Cookie[] cookies = request.getCookies();

	int userIdAusCookie = 0;
	
	if( cookies != null)
	{
		 for (int i = 0; i < cookies.length; i++){
			 if(cookies[i].getName().equals("c_userId")){
				 userIdAusCookie = Integer.parseInt(cookies[i].getValue());
			 }
		 }
	}
%>
<%! 
	Facade f;
	Fahrt fa;
	
	int id, userId, fahrerId ;
	
	String  kommentar;
	
	String 	s1,s2,s3,s4,s5,s6;
	int 	p1,p2,p3,p4,p5,p6;
	
	String 	fahrtDatum;
	String 	gepaeck;
	String	startZeit;
	String 	fahrer;
	
	int kap;
	
	User user;
	int kontrolle = 0;
%>
<%
	if(kontrolle == 0){
		try{
			id = Integer.parseInt(request.getParameter("fahrtid"));
			userId = userIdAusCookie;
	//
			
			f = new Facade();	
			
			user = f.getUserById(userId);
			
			fa = f.getFahrtById(id);
			
			kommentar = fa.getKommentar();
			
			fahrtDatum = fa.getFahrtDatum().toString();
			gepaeck = fa.getGepaeck();
			startZeit = fa.getFahrtStartZeit().toString();
			
			fahrer = f.getFahrerByFahrtId(id).getvName() + " " + f.getFahrerByFahrtId(id).getnName();
			
			fahrerId = f.getFahrerByFahrtId(id).getUserID();
			
			kap = fa.getKapazitaet();
		
			s1 = fa.getS1();
			s2 = fa.getS2();
			s3 = fa.getS3();
			s4 = fa.getS4();
			s5 = fa.getS5();
			s6 = fa.getS6();
			
			p1 = fa.getP1();
			p2 = fa.getP2();
			p3 = fa.getP3();
			p4 = fa.getP4();
			p5 = fa.getP5();
			p6 = fa.getP6();
			
			//
			
			
			
		}
		catch (Exception e){
			out.print(e);
		}
	}

	Fahrzeug fahrz = new Fahrzeug();

	try{
		fahrz = f.getFahrzeugByUserId(fa.getFahrerID().getUserID());
	}catch(Exception x){
		
		fahrz.setFahrzeugFarbe("");
		fahrz.setFahrzeugTyp("");
		fahrz.setFahrzeugBezeichnung("");
		fahrz.setNummernschild("kein Fahrzeug vorhanden");
		
		out.print(x);
	}
%>     
	        
	        
<script>
	function initMap() {
		  var directionsService = new google.maps.DirectionsService;
		  var directionsDisplay = new google.maps.DirectionsRenderer;
		  var map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 7,
		    center: {lat: 51.00, lng: 9.00} //Deutschland
		  });
		  directionsDisplay.setMap(map);
	
		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		}
	
	function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		  var waypts = [];
		  var stationsAusDB = new Array("<%= s2%>", "<%= s3%>", "<%= s4%>", "<%= s5%>");
		  ////Strecke mit Waypoints / Zwischenstationen füttern
		  
				// Define the callback function.
				function setzePoints(value, index, ar) {
				    if(value != "null"){
				    	waypts.push({
					        location: value + ", Deutschland",
					        stopover: true
					      });
				    }			    
				}
				
				stationsAusDB.forEach(setzePoints);
	 	  
		  ////
			  directionsService.route(
					 	{
						    origin: "<%=s1%>" + ", Deutschland",
						    destination: "<%=s6%>" + ", Deutschland",
						    waypoints: waypts,
						    optimizeWaypoints: true,
						    travelMode: google.maps.TravelMode.DRIVING
						}, 
						function(response, status) {
						  	  if (status === google.maps.DirectionsStatus.OK) {
						      directionsDisplay.setDirections(response);
						      var route = response.routes[0];
						      var summaryPanel = document.getElementById('directions-panel');
						      summaryPanel.innerHTML = '';
						      
						      //gesamtpreis
						      var gesPreis = 0;
						      
						      // For each route, display summary information.
						      for (var i = 0; i < route.legs.length; i++) {
						        var routeSegment = i + 1;
						        summaryPanel.innerHTML += '<b>Streckenabschnitt: ' + routeSegment +
						            '</b><br>';
						        summaryPanel.innerHTML += route.legs[i].start_address + ' nach ';
						        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
						       
						        //berechne Preis
						        var preis = 1.3 * 8 * (route.legs[i].distance.value / 1000) / 200;
						        preis = Math.ceil(preis);
						        gesPreis += preis;
						        
						        summaryPanel.innerHTML += route.legs[i].distance.text + '<br>Preis: <b>' + preis + '</b> Euro<br><br>';  
						      }
						      //gib Gesamtpreis aus
						      summaryPanel.innerHTML += '<br><h3>Gesamtpreis: <b>' + gesPreis + '</b> Euro</h3><br>';
						      
						    } else {
						      window.alert('Directions request failed due to ' + status);
						    }
				  		}
			);
		}
	
		
		function zeigen(x){
			document.getElementById("buchenKnopf").style.display = "none";
			document.getElementById(x).style.display = "block";
		}
	</script>




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
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo <%=user.getvName() %>!<span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="c_UserOeffentlich.jsp?userid=<%=userId%>">Mein öffentliches Profil</a></li>
			            <li><a href="c_User.jsp">Terminal</a></li>
			          </ul>
			        </li>
		      	</ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
		
			<div class="jumbotron">
			    <h1>Fahrt</h1>
			    <p>von <%= s1 %> nach <%= s6 %></p>
			</div>
		</div>
		<div class="row" id="google">
	   		 <div id="map"></div>
	   		 <div id="directions-panel" class="blau randUntenRund"></div>
		</div>
		<div class="row">
			<div class="abstandNachOben" id="anzeige">
				<div class="col-xs-12 col-md-6">
				
					<div class="panel panel-default">
					  <div class="panel-body">
					    <p>	<a href="c_UserOeffentlich.jsp?userid=<%= fahrerId %>"><b><%= fahrer %></b></a> fährt von <b><%= s1 %></b> nach <b><%= s6 %></b></p>
		
						<p>	Angaben zum Gepäck: <b><%= gepaeck %></b></p>
					  </div>
					</div>
				
					
				</div>
				<div class="col-xs-12 col-md-6">
				
					<div class="panel panel-default">
					  <div class="panel-body">
						<p>Startzeit: <b><%= startZeit %></b></p>
						<p>Datum: <b><%= fahrtDatum %></b></p>
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
				<div class="col-xs-12 col-md-12">					
					<div class="panel panel-default">
					  <div class="panel-heading">
					    <h3 class="panel-title">Bemerkungen vom Fahrer</h3>
					  </div>
					  <div class="panel-body">
						<%= kommentar %>
					  </div>
					</div>
				</div>
			</div>

			<div class="col-sm-12" id="buchenFeld">
				<button id="buchenKnopf" style="width:100%" onclick="zeigen('buchenForm')">BUCHEN</button>
				
				<div class="panel panel-default" style="display:none" id="buchenForm">
				  <div class="panel-heading">
				    <h3 class="panel-title">Buchen</h3>
				  </div>
				  <div class="panel-body">
				    
				    <form action="c_Fahrt.jsp">
					 Von:<br/> 
					 <input type="text" name="buchenStart" onclick="sendInfo(this, 'aj_vergleicheEingabeMitStrecke.jsp', <%= id %>)" autocomplete="off" required/><ul class="list-group a"></ul><br/>
					 Nach:<br/>
					 <input type="text" name="buchenZiel" onclick="sendInfo(this, 'aj_vergleicheEingabeMitStrecke.jsp', <%= id %>)" autocomplete="off" required/><ul class="list-group a"></ul><br/>
					<input type="submit" name="buchen" value="Senden">
					</form>
				    
				    
				  </div>
				</div>
			</div>
		</div>
	</div>

<%
	//VERFEINERN: wenn user WEDER fahrer NOCH in passagier_fahrt Tabelle, Dann zeige Buchen-Feld an
	if(userId != f.getFahrerByFahrtId(id).getUserID()){
		out.print("<script>document.getElementById('buchenFeld').style.display = 'block'</script>");
	}else{
		out.print("<script>document.getElementById('buchenFeld').style.display = 'none'</script>");
	}
	
	Facade f2 = new Facade();
	if (request.getParameter("buchen") != null){
		try{
			String uStart, uZiel;
			//VERFEINERN: nur Orte zur Auswahl anzeigen, die auch auf Strecke liegen
			uStart = request.getParameter("buchenStart");
			uZiel = request.getParameter("buchenZiel");
			
			f2.newPassagierFahrt(userId, id, uStart, uZiel);
			
			Buchen finish = new Buchen();
			finish.passengerBooksHimselfIn(id, uStart, uZiel);
			
			out.print("<script>document.getElementById('directions-panel').style.display = 'none'</script>");

			out.print("<script>document.getElementById('anzeige').style.display = 'none'</script>");
			out.print("<script>document.getElementById('buchenKnopf').style.display = 'none'</script>");
			out.print("<div class='alert alert-success text-center' role='alert'><h1>Fahrt erfolgreich gebucht!</h1></div>");
			
			//VERFEINERN: Je nach Einstiegs- und Ausstiegs-Station müssen die P's (Und damit freie Plätze) angepasst werden
			//			  Möglicherweise lassen wir die Anzeige der freien plätze auf der Fahrt.jsp auch komplett weg, da
			//		      Meist nicht eindeutig sobald mehrere Stationen
		}
		catch (Exception ex){

			out.print("<script>document.getElementById('anzeige').style.display = 'none'</script>");
			out.print("<script>document.getElementById('buchenKnopf').style.display = 'none'</script>");
			out.print("<div class='alert alert-danger text-center' role='alert'><h1>Fehler! Die Fahrt wurde bereits von dir gebucht</h1></div>");
		}
	}
	
%>

</body>
</html>