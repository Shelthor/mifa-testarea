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

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>

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
	
	function sendSQL(){
		  $( "#whole" ).slideUp();
		}

	function suc(){
		$( "#sendSuccess" ).show();
	}

	function fail(){
		$( "#sendFail" ).show();
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
	id = 1; //id von Fahrt die zu bearbeiten ist, VERFEINERN: soll aus Parameter kommen (AJAX Möglich)
	fa = f.getFahrtById(id);
		try{		
			fahrtDatum = fa.getFahrtDatum();
			startZeit = fa.getFahrtStartZeit();
			gepaeck = fa.getGepaeck();
			kap = fa.getKapazitaet();
			
			kommentar = fa.getKommentar();
			
			s1 = fa.getS1();
			s6 = fa.getS6();			
		}
		catch (Exception ex){
			
		}

%>


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

  <div class="jumbotron">
    <h1>INTERN</h1>
    <p>Bearbeite die Fahrt nach <%=s6%></p>
  </div>
  <div class="row">

    <div class="col-md-12" id="whole">
		<form action="c_FahrtBearbeiten.jsp" method="post">
				<div class="row hellgrau">
					<div class="col-sm-8">
						<p>Datum: <%= fahrtDatum %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('1')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b1" style="display:none;">
						<input type="text" id="datepicker" name="formDatum" size="30" autocomplete="off"><br/>
							 
							    <input type="hidden" id="hiddenJahr" name="hJahr" />
						    	<input type="hidden" id="hiddenMonat" name="hMonat" />
						        <input type="hidden" id="hiddenTag" name="hTag" />
					</div>
				</div>
				<div class="row grau">
					<div class="col-sm-8">
						<p>Startzeit: <%= startZeit %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('2')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b2" style="display:none;">
							<br/>
								<select name="formStunden">
									<option value="Z">h</option>
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
									<option value="13">3</option>
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
								:
								<select name="formMinuten">
									<option value="Z">min</option>
									<option value="0">00</option>
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="45">45</option>
								</select>
								<br/>
					</div>
				</div>
				<div class="row hellgrau">
					<div class="col-sm-8">
						<p>Gepäck: <%= gepaeck %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('3')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b3" style="display:none;">
						Angaben zum Gepäck?: 
							<br/>
							 <select name="formGepaeck">
								<option value="Z">bitte wählen..</option>
							    <option value="unbegrenzt Platz vorhanden">unbegrenzt Platz vorhanden</option>
							    <option value="mittleres Gepäck">mittleres Gepäck</option>
							    <option value="nur Handgepäck">nur Handgepäck</option>
							  </select>
							<br/>
					</div>
				</div>
				<div class="row grau">
					<div class="col-sm-8">
						<p>Plätze Frei: <%= kap %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('4')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b4" style="display:none;">
						<input type=text" name="formKapazitaet" autocomplete="off"/>
					</div>
				</div>
				<div class="row hellgrau">
					<div class="col-sm-8">
						<p>Start: <%= s1 %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('5')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b5" style="display:none;">
						<input type=text" name="formS1" autocomplete="off"/>
					</div>
				</div>
				<div class="row grau">
					<div class="col-sm-8">
						<p>Ziel: <%= s6 %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('6')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b6" style="display:none;">
						<input type=text" name="formS6" autocomplete="off"/>
					</div>
				</div>
				<div class="row hellgrau">
					<div class="col-sm-8">
						<p>Kommentar: <%= kommentar %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('7')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b7" style="display:none;">
						<input type=text" name="formKommentar" style="width: 100%; height: 75px;"autocomplete="off"/>
					</div>
				</div>
				<input type="submit" name="ok" value="senden" style="width:100%">
		</form>
		</div>
		<div id="sendSuccess" style="display:none">
			<p>SUCCESS</p><br/><br/>
			<h1>Änderungen: </h1><br/>
			<p id="Absatz"></p>
		</div>
		<div id="sendFail" style="display:none">
			<p>FAIL</p>
		</div>	
	</div>
	
	</div>
  </div>
</div>

<%

/* 
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
*/
	if (request.getParameter("ok") != null){
		try{
			//DATUM
			int zaehlen = 0;
			List<String> alertList = new ArrayList();
	
			if(request.getParameter("hTag").equals("") != true && request.getParameter("hMonat").equals("") != true && request.getParameter("hJahr").equals("") != true){
				tag = Integer.parseInt(request.getParameter("hTag"));
				monat = Integer.parseInt(request.getParameter("hMonat"));
				jahr = Integer.parseInt(request.getParameter("hJahr"));	
	
				fahrtDatum= new Date(jahr-1900, tag-1, monat);
				fa.setFahrtDatum(fahrtDatum);
				
				zaehlen++;
				
				alertList.add("Datum: " + fahrtDatum);
			}
			//UHRZEIT
	
			if(request.getParameter("formStunden").equals("Z") != true && request.getParameter("formMinuten").equals("Z") != true){	
					stunde = Integer.parseInt(request.getParameter("formStunden"));
					minute = Integer.parseInt(request.getParameter("formMinuten"));
					
					startZeit = new Time(stunde, minute, 0);
					fa.setFahrtStartZeit(startZeit);
					
					zaehlen++;
					
					alertList.add("Zeit: " + startZeit);
			}
			
			//GEPÄCK
			if(request.getParameter("formGepaeck").equals("Z") != true){
				gepaeck = request.getParameter("formGepaeck");
				fa.setGepaeck(gepaeck);
				
				zaehlen++;
				
				alertList.add("Gepäck: " + gepaeck);
			}
			
			//Kapazität
			
			if(request.getParameter("formKapazitaet").equals("") != true){
				kap = Integer.parseInt(request.getParameter("formKapazitaet"));
				fa.setKapazitaet(kap);
				fa.setP1(kap);
				fa.setP2(kap);
				fa.setP3(kap);
				fa.setP4(kap);
				fa.setP5(kap);
				fa.setP6(kap);
				zaehlen++;
				alertList.add("Plätze frei: " + kap);
			}
			
			//Stationen
			
			if(request.getParameter("formS1").equals("") != true){
				s1 = request.getParameter("formS1");
				fa.setS1(s1);
				
				zaehlen++;
				
				alertList.add("Start: " + s1);
			}
			
			if(request.getParameter("formS6").equals("") != true){
				s6 = request.getParameter("formS6");
				fa.setS6(s6);
				
				zaehlen++;
				
				alertList.add("Ziel: " + s6);
			}
			
			if(request.getParameter("formKommentar").equals("") != true){
				kommentar = request.getParameter("formKommentar");
				fa.setKommentar(kommentar);
				zaehlen++;
				
				alertList.add("Kommentar: " + kommentar);
			}
			
			
			// abschicken
			
			if(zaehlen > 0){
				try{
					f.updateFahrt(fa);
					
					out.print("<script>sendSQL();</script>");
					out.print("<script>suc();</script>");
										
					for(int i = 0; i < alertList.size(); i++){

						out.print("<script>var text = document.createTextNode('" + alertList.get(i) + "');");
						out.print("var linebreak = document.createElement('br');");
						out.print("document.getElementById('Absatz').appendChild(text);");
						out.print("document.getElementById('Absatz').appendChild(linebreak);</script>");
					}
					
				}
				catch (Exception e){
					out.print("<script>fail();</script>" + "Fehler während des Updates: " + e);	
				}
			}
	
		}
		catch (Exception e)
		{
			out.print("FEHLER: " + e);
		}
	}
%>

</body>
</html>