<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>

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

<%! 
	Facade f;
	Fahrt fa;
	
	int id;
	
	String  kommentar;
	
	String 	s1,s2,s3,s4,s5,s6;
	
	String 	fahrtDatum;
	String 	gepaeck;
	String	startZeit;
	String 	fahrer;
	
	int kap;
%>
<%
	f = new Facade();
	/*
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
	*/

	if (request.getParameter("ok") != null){
		try{
		//	kommentar = request.getParameter("formDatum");	DATE
		//	kommentar = request.getParameter("formUhrzeit");	TIME
			kap = Integer.parseInt(request.getParameter("formKapazitaet"));
			gepaeck = request.getParameter("formGepaeck");
			s1 = request.getParameter("formStart");
			s6 = request.getParameter("formZiel");
			
			//Liste mit Zwischenstops
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
			
			f.newFahrt(new Date(), f.getUserById(1), new Time(0,0,0), gepaeck, kap, kommentar, s1, sList.get(0),sList.get(1), sList.get(2), sList.get(3), s6, kap, kap, kap, kap, kap, kap);
		}
		catch (Exception ex){
			out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
			out.print("möglicherweise keine IDs übergeben?");
		}
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


</script>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>
	<div class="container">
	
		<div class="jumbotron">
		    <h1>Fahrt</h1>
		    <p>von <%= s1 %> nach <%= s6 %></p>
	
		</div>
		
		<div class="row">
	   		 <div id="map" style="width:100%; height:200px;"></div>
	   		 <div id="directions-panel"></div>
		</div>
		<div class="row">
			<form class="row" action="c_FahrtAnbieten.jsp" method="post">
					<div class="col-sm-12">
						Datum?: 
						<br/>
						<input type="text" name="formDatum"/><br/>
						Uhrzeit?: 
						<br/>
						<input type="text" name="formUhrzeit"/><br/>
						Wieviele Mitfahrer möchtest du mitnehmen?: 
						<br/>
						<input type="text" name="formKapazitaet"/><br/>
						Angaben zum Gepäck?: 
						<br/>
						<input type="text" name="formGepaeck"/><br/>
						Von?: 
						<br/>
						<input type="text" name="formStart"/><br/>
						Nach?: 
						<br/>
						<input type="text" name="formZiel"/><br/>
						s2: 
						<br/>
						<input type="text" name="formS2"/><br/>	
						s3: 
						<br/>
						<input type="text" name="formS3"/><br/>	
						s4: 
						<br/>
						<input type="text" name="formS4"/><br/>	
						s5: 
						<br/>
						<input type="text" name="formS5"/><br/>				
						Kommentar?: 
						<br/>
						<input type="text" name="formKommentar" style="width: 100%; height: 75px;"/><br/>
						<br/>
						<br/>
						<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/>
					</div>
				</form>
		</div>
		<div class="row">
			<div class="col-sm-12">
			</div>
		</div>
	</div>

</body>
</html>