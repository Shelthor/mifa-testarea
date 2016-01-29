<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />


<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

<script>

<%! 
	Facade f;
	Fahrt fa;
	
	int id, userId;
	
	String  kommentar;
	
	String 	s1,s2,s3,s4,s5,s6;
	int 	p1,p2,p3,p4,p5,p6;
	
	String 	fahrtDatum;
	String 	gepaeck;
	String	startZeit;
	String 	fahrer;
	
	int kap;
%>
<%
	f = new Facade();
	id = 6; //kommt aus cookie ODER link (mal sehen)
		
	try{
		fa = f.getFahrtById(id);
		
		kommentar = fa.getKommentar();
		
		fahrtDatum = fa.getFahrtDatum().toString();
		gepaeck = fa.getGepaeck();
		startZeit = fa.getFahrtStartZeit().toString();
		
		fahrer = f.getFahrerByFahrtId(id).getvName() + " " + f.getFahrerByFahrtId(id).getnName() ;
		
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
		
		List<Bewertung> bList = f.getListWithAllBewertungenToUserByUserId(id);
		
		List<Integer> fahrstilRating = new ArrayList<Integer>();
		List<Integer> puenktlichkeitRating = new ArrayList<Integer>();
		List<Integer> freundlichkeitRating = new ArrayList<Integer>();
		
		for(int i = 0; i < bList.size(); i++){
			fahrstilRating.add(bList.get(i).getFahrstilRating());
			puenktlichkeitRating.add(bList.get(i).getPuenktlichkeitRating());
			freundlichkeitRating.add(bList.get(i).getFreundlichkeitRating());
		}			
	}
	catch (Exception e){
		out.print(e);
	}
%>


function initMap() {
	  var directionsService = new google.maps.DirectionsService;
	  var directionsDisplay = new google.maps.DirectionsRenderer;
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 7,
	    center: {lat: 51.00, lng: 9.00}
	  });
	  directionsDisplay.setMap(map);

	  calculateAndDisplayRoute(directionsService, directionsDisplay);
	}

	function calculateAndDisplayRoute(directionsService, directionsDisplay) {
	  var waypts = [];
	  var stationsAusDB = new Array("<%= s2%>", "<%= s3%>", "<%= s4%>", "<%= s5%>");
	  ///
	  
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
	  directionsService.route({
	    origin: "<%=s1%>" + ", Deutschland",
	    destination: "<%=s6%>" + ", Deutschland",
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

	
	function zeigen(x){
		document.getElementById("buchenKnopf").style.display = "none";
		document.getElementById(x).style.display = "block";
	}

</script>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>
	<div class="container">
	
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
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo [USERNAME / BILD]!<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Mein öffentliches Profil</a></li>
		            <li><a href="#">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	
		<div class="jumbotron muster">
		    <h1>Fahrt</h1>
		    <p>von <%= s1 %> nach <%= s6 %></p>
	
		</div>
		
		<div class="row">
	   		 <div id="map" style="width:100%; height:200px;"></div>
	   		 <div id="directions-panel"></div>
		</div>
		<div class="row">
			<div class="col-md-12" id="anzeige">
				<div class="col-xs-12 col-md-12">
					<p>	<b><%= fahrer %></b> fährt von <b><%= s1 %></b> nach <b><%= s6 %></b></p>
		
					<p>	Angaben zum Gepäck: <b><%= gepaeck %></b></p>
				</div>
				<div class="col-xs-12 col-md-6 grau">
					<p>Startzeit: <b><%= startZeit %></b></p>
					<p>Datum: <b><%= fahrtDatum %></b></p>
				</div>
				<div class="col-xs-12 col-md-6">
					Bemerkungen vom Fahrer:
					<div class="col-xs-12 well well-sm"><%= kommentar %></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" id="buchenFeld" style="display:none">
			<button id="buchenKnopf" onclick="zeigen('buchenForm')">BUCHEN</button><br/><br/>
				<form id="buchenForm" action="c_Fahrt.jsp" style="display:none">
					<p>Von: <input type="text" name="buchenStart"> Nach: <input type="text" name="buchenZiel"><p><br/>
					<input type="submit" name="buchen" value="Senden">
				</form>
			</div>
		</div>
	</div>

<%
	userId = 1; //VERFEINERN: kommt von cookie

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
			out.print("<script>document.getElementById('anzeige').style.display = 'none'</script>");
			out.print("<script>document.getElementById('buchenFeld').style.display = 'none'</script>");
			out.print("gebucht");
			
			//VERFEINERN: Je nach Einstiegs- und Ausstiegs-Station müssen die P's (Und damit freie Plätze) angepasst werden
			//			  Möglicherweise lassen wir die Anzeige der freien plätze auf der Fahrt.jsp auch komplett weg, da
			//		      Meist nicht eindeutig sobald mehrere Stationen
		}
		catch (Exception ex){
			out.print("FAIL");
		}
	}
	
%>

</body>
</html>