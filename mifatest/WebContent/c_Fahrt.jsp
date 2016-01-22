<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fahrt (Oeffentlich)</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>
</head>
<body>
<div class="container">
	<div class="jumbotron">
	    <h1>Fahrt</h1>
	    <p>von <%= s1 %> nach <%= s6 %></p>
	</div>
	<div class="row">
		<div id="map"></div>
    <div id="right-panel">
    <div>
    <b>Start:</b>
    <select id="start">
      <option value="Dresden">Dresden</option>
      <option value="Chemnitz">Chemnitz</option>
      <option value="Leipzig">Leipzig</option>
    </select>
    <br>
    <b>Waypoints:</b> <br>
    <i>(Ctrl-Click for multiple selection)</i> <br>
    <select multiple id="waypoints">
      <option value="Dresden">Dresden</option>
      <option value="Chemnitz">Chemnitz</option>
      <option value="Leipzig">Leipzig</option>

    </select>
    <br>
    <b>End:</b>
    <select id="end">
      <option value="Dresden">Dresden</option>
      <option value="Chemnitz">Chemnitz</option>
      <option value="Leipzig">Leipzig</option>
    </select>
    <br>
      <input type="submit" id="submit">
    </div>
    <div id="directions-panel"></div>
    </div>

	<div id="meta">
		<h1>Info:</h1>
		<p>gimme more</p>
	</div>
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

</body>
</html>