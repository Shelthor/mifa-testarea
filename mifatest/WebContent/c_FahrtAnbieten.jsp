<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>

<%@ page import="java.text.*"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Fahrt inserieren</title>
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
        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	User user;
	int userId;
	
	int tag, monat, jahr;
	int stunde, minute;
	
	String  kommentar;
	
	String 	s1,s2,s3,s4,s5,s6;
	
	Date 	fahrtDatum;
	String 	gepaeck;
	Time	startZeit;
	String 	fahrer;
		
	int kap;
%>

<%
	//FAHRER
	//userId = 7; //VERFERINERN -> Aus Cookie -> siehe unten
	userId = userIdAusCookie;
	
	f = new Facade();
	user = f.getUserById(userId);
%>

	<div class="container" id="container-1">
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
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userId%>">Mein öffentliches Profil</a></li>
		            <li><a href="c_User.jsp">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		
			<div class="jumbotron">
			    <h1>Terminal</h1>
			    <p>Wo willst du hin?</p>
			</div>
		</div>
	
		<div class="row">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation"><a href="cm_Suche.jsp">Fahrt suchen</a></li>
			  <li role="presentation" class="active"><a href="c_FahrtAnbieten.jsp">Fahrt anbieten</a></li>
			</ul>
			

		</div>
		
		<br/>
		<div id="whole">
		<div class="row">
			<div id="map"></div>
			<div id="directions-panel" class="blau randUntenRund"></div>
		</div>
			
		<div class="row">								
				<div id="sqlForm" class="abstandNachOben col-md-12">
					<form action="c_FahrtAnbieten.jsp" method="post">
						<div class="panel panel-default col-xs-12 col-md-6"> 
							<div class="panel-body ">
								<div class=" abstandNachOben">
									<h4>Von?</h4> 
									<input type="text" name="formStart" id="inS1" style="width:100%" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" required autocomplete="off"/><ul class="list-group a"></ul><br/>     
									<h4>Nach?</h4> 
									<input type="text" name="formZiel"  id="inS6" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" style="width:100%" required autocomplete="off"/><ul class="list-group a"></ul><br/>
								</div>
							</div>
						</div>
						<div class="panel panel-default col-xs-12 col-md-6"> 
							<div class="panel-body ">
								<div class=" abstandNachOben"> 
									<h4>Über?</h4>
									<input id="zeigeZwischenSt"type="button" style="width: 100%;" onclick="zeigen()" value="füge Zwischenstation hinzu"/>
									<div id="s2-s5" style="display:none;">
										<input type="text" name="formS2" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" id="inS2" style="width:100%; display:none;" autocomplete="off"/><ul class="list-group a"></ul>
										<input type="text" name="formS3" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" id="inS3" style="width:100%; display:none;" autocomplete="off"/><ul class="list-group a"></ul>
										<input type="text" name="formS4" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" id="inS4" style="width:100%; display:none;" autocomplete="off"/><ul class="list-group a"></ul>
										<input type="text" name="formS5" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" id="inS5" style="width:100%; display:none;" autocomplete="off"/><ul class="list-group a"></ul>			
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-default col-xs-12 col-md-12"> 
							<div class="panel-body">
								<div class="col-xs-12 col-md-6">
									<h4>Datum?</h4> 
									<input type="text" id="datepicker" style="width:100%" autocomplete="off" required><br/>
									 
									    <input type="hidden" id="hiddenJahr" name="hJahr" />
								    	<input type="hidden" id="hiddenMonat" name="hMonat" />
								        <input type="hidden" id="hiddenTag" name="hTag" />
								</div>
								<div class="col-xs-12 col-md-6">
									<h4>Uhrzeit?</h4>
										<select name="formStunden" style="width:49%" required>
											<option value="">h</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
										</select>
										<select name="formMinuten" style="width:49%" required>
											<option value="">min</option>
											<option value="0">00</option>
											<option value="15">15</option>
											<option value="30">30</option>
											<option value="45">45</option>
										</select>
										<br/>
							</div>
							</div>
						</div>
						<div class="panel panel-default col-xs-12 col-md-12"> 
							<div class="panel-body">
								<div class="col-xs-12 col-md-6">
									<h4>Wieviele Mitfahrer möchtest du mitnehmen?</h4>
									<input type="text" style="width:100%" name="formKapazitaet" id="formkap" onblur="checkKap()" required autocomplete="off"/><br/>									
								</div>
								<div class="col-xs-12 col-md-6">
									<h4>Angaben zum Gepäck</h4>
									 <select name="formGepaeck" style="width:100%">
									    <option value="ausreichend Platz vorhanden">ausreichend Platz vorhanden</option>
									    <option value="mittleres Gepäck">mittleres Gepäck</option>
									    <option value="nur Handgepäck">nur Handgepäck</option>
									  </select>
								</div>
							</div>
							</div>
						<div class="col-xs-12 col-md-12 abstandNachOben">
							<h4>Kommentar?</h4> 
							<input type="text" name="formKommentar" style="width: 100%; height: 75px;" autocomplete="off"/><br/>
							<br/>
							<br/>
							<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/>
						</div>
					</form>
					</div>
				</div>
				<br/>	
			
			</div>
		</div>
		<div id="sendSuccess" style="display:none">
				<div class='alert alert-success text-center' role='alert'>
					<h1>Inserat erfolgreich erstellt!</h1>
				</div>
			</div>
			<div id="sendFail" style="display:none">
				<div class='alert alert-danger text-center' role='alert'>
					<h1>Fehler! Inserat wurde nicht erstellt!</h1>
				</div>
			</div>
	
	<div id="container-2" style="display:none;">
	<p>noch nicht Mitglied?</p>
	<a href=m_index.jsp>jetzt einloggen</a> oder <a href=m_registrieren.jsp>registrieren</a>
	</div>

<%
	if(userIdAusCookie==0)
	{
		out.print("<script>document.getElementById('container-1').style.display = 'none';</script>");
		out.print("<script>document.getElementById('container-2').style.display = 'block';</script>");
	}

%>
	
</body>

<%
	f = new Facade();
	if (request.getParameter("ok") != null){
		try{			
			//DATUM
			tag = Integer.parseInt(request.getParameter("hTag"));
			monat = Integer.parseInt(request.getParameter("hMonat"));
			jahr = Integer.parseInt(request.getParameter("hJahr"));
			fahrtDatum= new Date(jahr-1900, tag-1, monat);
			//UHRZEIT
			stunde = Integer.parseInt(request.getParameter("formStunden"));
			minute = Integer.parseInt(request.getParameter("formMinuten"));
			startZeit = new Time(stunde, minute, 0);
			//Mitfahrer + Gepäck
			kap = Integer.parseInt(request.getParameter("formKapazitaet"));
			gepaeck = request.getParameter("formGepaeck");
			//Stationen
			s1 = request.getParameter("formStart");
			s6 = request.getParameter("formZiel");
			
				//Liste mit Zwischenstops [s2 - s5]
				List<String> sList = new ArrayList<String>();
							
				for(int i = 2; i <6;i++){
					if(request.getParameter("formS"+i) == ""){
						//für jedes feld wo nichts eingetragen worden ist, addiere ein Element zur Liste mit dem Wert null
						sList.add(null);
					}else{
						//wenn jedoch etwas eingetragen worden ist, addiere ein Element zur Liste mit dem eingetragenen Wert
						sList.add(request.getParameter("formS"+i));
					}
				}

			kommentar = request.getParameter("formKommentar");
			
			f.newFahrt(fahrtDatum, userId, startZeit, gepaeck, kap, kommentar, s1, sList.get(0),sList.get(1), sList.get(2), sList.get(3), s6, kap, kap, kap, kap, kap, kap);
			
			 out.print("<script>sendSQL();</script>");
			 out.print("<script>suc();</script>");
		}
		catch (Exception ex){
			out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
			out.print("möglicherweise keine IDs übergeben?");
		}
	}
%>

<script>

function initMap() {
	  var directionsService = new google.maps.DirectionsService;
	  var directionsDisplay = new google.maps.DirectionsRenderer;
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 7,
	    center: {lat: 51.00, lng: 9.00}
	  });
	  directionsDisplay.setMap(map);
}

	function calculateAndDisplayRoute(directionsService, directionsDisplay) {
	  var waypts = [];
	  
	  var station1, station2, station3, station4, station5, station6;
	  station1 = document.getElementById('inS1').value;
	  station2 = document.getElementById('inS2').value;
	  station3 = document.getElementById('inS3').value;
	  station4 = document.getElementById('inS4').value;
	  station5 = document.getElementById('inS5').value;
	  station6 = document.getElementById('inS6').value;
	  
	  
	  var stationsAusDB = new Array(station2, station3, station4, station5);
	  ///
	  
			// Define the callback function.
			function setzePoints(value, index, ar) {
			    if(value != ""){
			    	waypts.push({
				        location: value + ", Deutschland",
				        stopover: true
				      });
			    }
			    
			}
			
			stationsAusDB.forEach(setzePoints);
 	  	
	  ////
	  directionsService.route({
	    origin: station1 + ", Deutschland",
	    destination: station6 + ", Deutschland",
	    waypoints: waypts,
	    optimizeWaypoints: true,
	    travelMode: google.maps.TravelMode.DRIVING
	  }, function(response, status) {
	    if (status === google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(response);
	      var route = response.routes[0];
	      var summaryPanel = document.getElementById('directions-panel');
	      summaryPanel.innerHTML = '';
	      // For each route, display summary information.
	      for (var i = 0; i < route.legs.length; i++) {
	        var routeSegment = i + 1;
	        summaryPanel.innerHTML += '<b>Streckenabschnitt: ' + routeSegment +
	            '</b><br>';
	        summaryPanel.innerHTML += route.legs[i].start_address + ' nach ';
	        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
	        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
	      }
	    } else {
	      window.alert('Directions request failed due to ' + status);
	    }
	  });
	}

	var zwischenStZaehler = 2;
	
	function zeigen(){
		//document.getElementById('s2-s5').show();
		$("#s2-s5").slideDown();
			
		if(zwischenStZaehler < 6){
			$("#inS"+zwischenStZaehler).slideDown();
			
			if(zwischenStZaehler == 5){
				$('#zeigeZwischenSt').slideUp();
			}
			
			zwischenStZaehler++;
		}
	}
	
	function aktualisiereMap(){
		 var directionsService = new google.maps.DirectionsService;
		  var directionsDisplay = new google.maps.DirectionsRenderer;
		  var map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 7,
		    center: {lat: 51.00, lng: 9.00}
		  });
		  directionsDisplay.setMap(map);
		  
		calculateAndDisplayRoute(directionsService, directionsDisplay);
	}
</script>

</html>