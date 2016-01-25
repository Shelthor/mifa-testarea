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
<title>INTERN - Fahrt bearbeiten</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

<link rel="stylesheet" href="css/style.css" type="text/css" />


<script>
	function zeigeBearbeitungsFeld(a){
		$('#b'+ a).show();
	}
	
	function glow(a){
		a.style.backgroundImage = "url('img/bearb_glow.png')";
		a.style["background-image"] = "url('img/bearb_glow.png')";
	}
	
	function blass(a){
		a.style.backgroundImage = "url('img/bearb.png')";
		a.style["background-image"] = "url('img/bearb.png')";
	}
	
</script>
</head>
<body>

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
	id = 37;
	fa = f.getFahrtById(id);
		try{		
			fahrtDatum = fa.getFahrtDatum();
			startZeit = fa.getFahrtStartZeit();
			gepaeck = fa.getGepaeck();
			kap = fa.getKapazitaet();
			s1 = fa.getS1();
			s6 = fa.getS6();			
		}
		catch (Exception ex){
			
		}

%>


<div class="container">
  <div class="jumbotron">
    <h1>INTERN</h1>
    <p>Bearbeite die Fahrt nach <%=s6%></p>
  </div>
  <div class="row">
    <div class="col-sm-3">
		<div class="row">
			<div class="col-sm-12">
				<p>Mein Profil -> UserOeffentlich.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Fahrt Suchen -> FahrtSuchen.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Fahrt Anbieten -> FahrtAnbieten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine Fahrten -> MeineFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine angebotenen Fahrten -> MeineFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Historie -> LetzteFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Erhaltene Bewertungen -> Bewertungen.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine Einstellungen -> Settings.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Mailbox -> Mailbox.jsp</p>
   			</div>
		</div>

    </div>
    <div class="col-sm-9">
		<form action="c_FahrtBearbeiten.jsp">
				<div class="row">
					<div class="col-sm-8">
						<p>Datum: <%= fahrtDatum %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('1')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b1" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<p>Startzeit: <%= startZeit %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('2')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b2" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<p>Gepäck: <%= gepaeck %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('3')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b3" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<p>Plätze Frei: <%= kap %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('4')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b4" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<p>Start: <%= s1 %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('5')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b5" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<p>Ziel: <%= s6 %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('6')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b6" style="display:none;">
						<p>TEEST</p>
					</div>
				</div>
		</form>
		<div id="sendSuccess" style="display:none">
			<p>SUCCESS</p>
		</div>
		<div id="sendFail" style="display:none">
			<p>FAIL</p>
		</div>	
				</div>
	</div>
	
	</div>
  </div>
</div>

<%
	try{
		fa.setGepaeck("NEUES UPDATE");
		f.updateFahrt(fa);
	}
	catch (Exception e){
		out.print(e);
	}
%>

</body>
</html>