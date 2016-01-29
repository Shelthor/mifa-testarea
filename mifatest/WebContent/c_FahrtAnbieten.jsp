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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INTERN - Fahrtanbieten.jsp</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>

    <script>  
    var request;  
    function sendInfo(x)  
    {  
	    var v=x.value;  
	    var url="aj_vergleicheEingabeMitOrtTabelle.jsp?val="+v;  
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  
	      
	    try{  
	    request.onreadystatechange= function() {
	    	getInfo(x);	  
	    };
	    
	    
	    request.open("GET",url,true);  
	    request.send();  
	    }catch(e){alert("Unable to connect to server");}  
    }  
      
    function getInfo(x){  
	    if(request.readyState==4){  
	    var val=request.responseText;  
	    //document.getElementById('amit').innerHTML=val;  
	    
	    // x.nextElementSibling.innerHTML +='<div style="width:200px;height:20px;background-color:#d3d3d3"></div>';
	    x.nextElementSibling.style.display = "block";
	    x.nextElementSibling.innerHTML = val;
	    }  
    }
    
    function changeFormValue(elem){
    	var par = elem.parentElement;
    	var input = elem.parentElement.previousSibling;
    	
    	par.style.display = "none";
    	input.value = elem.innerHTML;
    }
      
    </script>  

	<script>
	
	function sendSQL(){
		  $( "#whole" ).slideUp();
		}
	
	function suc(){
		$( "#sendSuccess" ).show();
	}
	
	function fail(){
		$( "#sendFail" ).show();
	}
	
	$(function() {
	    $( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy',
	    								onSelect: function()
	    									{
	    									ueberfuehreDatum();
	    									}
	    });
	});
	  
	function ueberfuehreDatum(){
		var Datestring = document.getElementById('datepicker').value;
		
		var byr = Datestring.substr(6, 4);
		var bmo = Datestring.substr(0, 2);
		var bday = Datestring.substr(3, 2);
		
		//abspeichern der Werte in Hiddenfields, die später wieder von der JSP benutzt werden
		document.getElementById('hiddenJahr').value = byr;
		document.getElementById('hiddenMonat').value = bmo;
		document.getElementById('hiddenTag').value = bday;
	}
	
	function checkKap(){
		var data = document.getElementById("formkap").value;
		if(isNaN(data)){
		  alert("bitte nur Ziffern eingeben");
		}else {
		}
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
		
			<div class="jumbotron">
			    <h1>Terminal</h1>
			    <p>Wo willst du hin?</p>
			</div>
		</div>
	
		<div class="row">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation"><a href="#">Fahrt suchen</a></li>
			  <li role="presentation" class="active"><a href="#">Fahrt anbieten</a></li>
			  <li role="presentation"><a href="#">Historie</a></li>
			  <li role="presentation"><a href="#">Settings</a></li>
			  <li role="presentation"><a href="#">Mailbox</a></li>
			</ul>
		</div>
		
		<br/>
		
		<div class="row">
			<div id="whole">
				<div class="col-md-12">
			   		 <div id="map"></div>
			   		 <div id="directions-panel" class="blau"></div>
				</div>
				<div id="sqlForm">
					<form action="c_FahrtAnbieten.jsp" method="post">
						<div class="col-xs-12 col-md-4 abstandNachOben">
							Datum?: 
							<br/>
							<input type="text" id="datepicker" style="width:100%"><br/>
							 
							    <input type="hidden" id="hiddenJahr" name="hJahr" />
						    	<input type="hidden" id="hiddenMonat" name="hMonat" />
						        <input type="hidden" id="hiddenTag" name="hTag" />
							 
							Uhrzeit?: 
							<br/>
								<select name="formStunden" style="width:49%">
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
								<select name="formMinuten" style="width:49%">
									<option value="0">00</option>
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="45">45</option>
								</select>
								<br/>
							Wieviele Mitfahrer möchtest du mitnehmen?: 
							<br/>
							<input type="text" name="formKapazitaet" id="formkap" onblur="checkKap()" required/><br/>
							Angaben zum Gepäck?: 
							<br/>
							
							 <select name="formGepaeck" style="width:100%">
							    <option value="ausreichend Platz vorhanden">ausreichend Platz vorhanden</option>
							    <option value="mittleres Gepäck">mittleres Gepäck</option>
							    <option value="nur Handgepäck">nur Handgepäck</option>
							  </select>
							<br/>
						</div>
						<div class="col-xs-12 col-md-4 abstandNachOben">
							Von?: 
							<br/>
							<input type="text" name="formStart" id="inS1" style="width:100%" onkeyup="sendInfo(this)" autocomplete="off"/><ul class="list-group a"></ul><br/>     
							Nach?: 
							<br/>
							<input type="text" name="formZiel" onblur="aktualisiereMap()" id="inS6" onkeyup="sendInfo(this)" style="width:100%" autocomplete="off"/><ul class="list-group a"></ul><br/>
						</div>
						<div class="col-xs-12 col-md-4 abstandNachOben">  
							Über?:
							<br/>
							<input type="button" style="width: 100%;" onclick="zeigen()" value="füge Zwischenstation hinzu"/>
							<div id="s2-s5" style="display:none;">
								<input type="text" name="formS2" onkeyup="sendInfo(this)" onblur="aktualisiereMap()" id="inS2" style="width:100%; display:none;"/><ul class="list-group a"></ul><br/><br/>
								<input type="text" name="formS3" onkeyup="sendInfo(this)" onblur="aktualisiereMap()" id="inS3" style="width:100%; display:none;"/><ul class="list-group a"></ul><br/><br/>
								<input type="text" name="formS4" onkeyup="sendInfo(this)" onblur="aktualisiereMap()" id="inS4" style="width:100%; display:none;"/><ul class="list-group a"></ul><br/><br/>
								<input type="text" name="formS5" onkeyup="sendInfo(this)" onblur="aktualisiereMap()" id="inS5" style="width:100%; display:none;"/><ul class="list-group a"></ul><br/>				
							</div>
							</div>
							<div class="col-xs-12 col-md-12 abstandNachOben">
								Kommentar?: 
								<br/>
								<input type="text" name="formKommentar" style="width: 100%; height: 75px;"/><br/>
								<br/>
								<br/>
								<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/>
							</div>
					</form>
				</div>
				<br/>	
			</div>
			<div id="sendSuccess" style="display:none">
					<p>SUCCESS</p>
			</div>
			<div id="sendFail" style="display:none">
					<p>FAIL</p>
			</div>
		</div>
	</div>
</body>

<%! 
	Facade f;
	Fahrt fa;
	
	int id;
	
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
	f = new Facade();
	if (request.getParameter("ok") != null){
		try{
			//FAHRER
			id = 7; //VERFEINERN: soll aus coockie kommen
			
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
			
			f.newFahrt(fahrtDatum, id, startZeit, gepaeck, kap, kommentar, s1, sList.get(0),sList.get(1), sList.get(2), sList.get(3), s6, kap, kap, kap, kap, kap, kap);
			
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