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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Fahrt bearbeiten</title>
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
	int kontrolle = 0;
	
	Facade f;
	Fahrt fa;
	
	User user;
	
	int id, userId;
	
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
	if(kontrolle == 0){
		try{
			id = Integer.parseInt(request.getParameter("fahrtid")); 	
		}
	
		catch (Exception ex) {
		}
	}


	f = new Facade();
	
	userId = userIdAusCookie;
	
	user = new User();
	user = f.getUserById(userId);
	
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


<div class="container" id="container-1">

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
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userId%>">Mein �ffentliches Profil</a></li>
		            <li><a href="c_User.jsp">Terminal</a></li>
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
		
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Datum</h3>
			  </div>
			  <div class="panel-body">
			    <div class="col-sm-8">
						<p><%= fahrtDatum %></p>
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
			</div>
			
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Uhrzeit</h3>
			  </div>
			  <div class="panel-body">
			   <div class="col-sm-8">
						<p><%= startZeit %></p>
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
			</div>
			
			
			
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Gep�ck</h3>
			  </div>
			  <div class="panel-body">
					<div class="col-sm-8">
						<p><%= gepaeck %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('3')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b3" style="display:none;">
						Angaben zum Gep�ck?: 
							<br/>
							 <select name="formGepaeck">
								<option value="Z">bitte w�hlen..</option>
							    <option value="unbegrenzt Platz vorhanden">unbegrenzt Platz vorhanden</option>
							    <option value="mittleres Gep�ck">mittleres Gep�ck</option>
							    <option value="nur Handgep�ck">nur Handgep�ck</option>
							  </select>
							<br/>
					</div>
			  </div>
			</div>
			
			
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Pl�tze frei</h3>
			  </div>
			  <div class="panel-body">
					<div class="col-sm-8">
						<p><%= kap %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('4')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b4" style="display:none;">
						<input type=text" name="formKapazitaet" autocomplete="off"/>
					</div>
			  </div>
			</div>
			
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Kommentar</h3>
			  </div>
			  <div class="panel-body">
					<div class="col-sm-8">
						<p><%= kommentar %></p>
					</div>
					<div class="col-sm-4">
						<div class="bearbeitenPNG" onclick="zeigeBearbeitungsFeld('7')" onmouseover="glow(this)" onmouseout="blass(this)"></div>
					</div>
					<div class="col-sm-12" id="b7" style="display:none;">
						<input type=text" name="formKommentar" style="width: 100%; height: 75px;"autocomplete="off"/>
					</div>
			  </div>
			</div>		
			<br/>
			<input type="submit" name="ok" value="senden" style="width:100%">
		</form>
		</div>
		<div id="sendSuccess" style="display:none">
			<div class='alert alert-success text-center' role='alert'>
				<h1>Fahrt erfolgreich ge�ndert!</h1>
			</div>
			<div class="col-md-12">
				<h1>�nderungen: </h1><br/>
				<p id="Absatz"></p>
			</div>		
		</div>
		<div id="sendFail" style="display:none">
			<p>FAIL</p>
		</div>	
	</div>
	
	</div>
	
	<div id="container-2" style="display:none;">
	<p>noch nicht Mitglied?</p>
	<a href=m_index.jsp>jetzt einloggen</a> oder <a href=m_registrieren.jsp>registrieren</a>
	</div>
	
	<div id="container-3" style="display:none;">
		<div class='alert alert-danger text-center' role='alert'>
					<h1>Du bist nicht der Fahrer dieser Fahrt!</h1>
		</div>
	</div>
	

<%
	if(userIdAusCookie==0)
	{
		out.print("<script>document.getElementById('container-1').style.display = 'none';</script>");
		out.print("<script>document.getElementById('container-2').style.display = 'block';</script>");
	}

	if(fa.getFahrerID().getUserID() != userIdAusCookie)
	{
		out.print("<script>document.getElementById('whole').style.display = 'none';</script>");
		out.print("<script>document.getElementById('container-3').style.display = 'block';</script>");
	}

%>
	
<%
kontrolle = 0;
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
			
			//GEP�CK
			if(request.getParameter("formGepaeck").equals("Z") != true){
				gepaeck = request.getParameter("formGepaeck");
				fa.setGepaeck(gepaeck);
				
				zaehlen++;
				
				alertList.add("Gep�ck: " + gepaeck);
			}
			
			//Kapazit�t
			
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
				alertList.add("Pl�tze frei: " + kap);
			}
			
			//Stationen
			
			/*
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
			
			*/
			
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
					kontrolle = 1;
				}
				catch (Exception e){
					out.print("<script>fail();</script>" + "Fehler w�hrend des Updates: " + e);	
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