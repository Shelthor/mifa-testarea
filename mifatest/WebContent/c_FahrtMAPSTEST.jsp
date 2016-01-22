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
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

<script>

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
	  waypts.push({
	        location: "Nossen, Deutschland",
	        stopover: true
	      });
	  
	  directionsService.route({
	    origin: "Dresden, Deutschland",
	    destination: "Leipzig, Deutschland",
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
	        summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
	            '</b><br>';
	        summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
	        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
	        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
	      }
	    } else {
	      window.alert('Directions request failed due to ' + status);
	    }
	  });
	}


</script>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>

<%! 
		Facade f;
		Fahrt fa;
		
		int id;

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
		id = 1; //kommt aus cookie ODER link (mal sehen)
					
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

	
	<div class="container">
	
	<div class="jumbotron">
		
	    <h1>Fahrt</h1>
	    <p>von <%= s1 %> nach <%= s6 %></p>
	    
	   
	    
	</div>
	
	<div class="row">
   		 <div id="map" style="width:100%; height:200px;"></div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		<p>	von :<%= s1 %> </p>
		<p>	nach: <%= s6 %></p>
		<p>	gepäck: <%= gepaeck %></p>
		<p>	startzeit: <%= startZeit %></p>
		<p>	fahrer: <%= fahrer %></p>
		<p>	komm: <%= kommentar %></p>
		<p>	freie plätze: <%= kap %></p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		</div>
	</div>
</div>
	
	
</body>
</html>