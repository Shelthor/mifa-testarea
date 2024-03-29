<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Terminal</title>
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
	
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
	int userId;
	User user;
%>

<%
	userId = userIdAusCookie;
	//
	f = new Facade();
	user = f.getUserById(userId);
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
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userId%>">Mein öffentliches Profil</a></li>
		            <li><a href="#">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

  <div class="jumbotron">
    <h1>Terminal</h1>
    <p>Hallo <%= user.getvName() %>!</p>
    <p>Willkommen in deinem Persönlichen Bereich! von hier aus kannst du alles regeln, was deine Fahrten betrifft :)</p> 
  </div>
  <div class="row">
    <div class="col-xs-12 col-md-12">
		
		<ul class="nav nav-pills nav-justified">
		  <li role="presentation"><a href="cm_Suche.jsp">Fahrt suchen</a></li>
		  <li role="presentation"><a href="c_FahrtAnbieten.jsp">Fahrt anbieten</a></li>
		  <li role="presentation"><a onclick="showSettings();">Einstellungen</a></li>
		  <li role="presentation"><a href="c_deleteCookie.jsp">ausloggen</a></li>
		</ul>
		
		
		
					  
		
		 <div id="settings" class="col-xs-12 col-md-12 panel panel-default abstandNachOben" style="display:none;">
		 	<div class="panel-body">	 	
			 	<ul class="nav nav-pills nav-justified">
				  <li role="presentation"><a href="m_profil_bearbeiten.jsp">profil bearbeiten</a></li>
				  <li role="presentation"><a href="m_fahrzeug_landingpage.jsp">Fahrzeug bearbeiten</a></li>
				  <li role="presentation"><a href="m_passwort_aendern.jsp">passwort ändern</a></li>
				</ul>
			</div>
		 </div>
		
		<div class="col-xs-12 col-md-12 randObenRund">
			<h1>Von mir gebuchte Fahrten</h1>
			<%
			
			
				Facade fFahrten = new Facade();	
				PassagierFahrt pFahrt;
				Fahrt fahrtElem = new Fahrt();
				User passagiereOfFahrt;
				
				List<Bewertung> be1 = new ArrayList();
				List<String> schonBewertet1 = new ArrayList();
			
				
				String fahrerName;
				int fahrerID;
	
				int fahrtID = 0;
				
				List<PassagierFahrt> passagierOfFahrt = fFahrten.getListWithAllPassagierFahrtRelationsByUserId(userIdAusCookie);
				
				if(passagierOfFahrt.size() >0){
					for(int i = 0; i < passagierOfFahrt.size(); i++)
					{
						fahrtElem = passagierOfFahrt.get(i).getFahrtID();
						fahrerName = fahrtElem.getFahrerID().getvName() + " " +  fahrtElem.getFahrerID().getnName();
						fahrerID = fahrtElem.getFahrerID().getUserID();
						
						
						out.print("<div class='panel panel-default col-xs-4 col-sm-4 col-md-12'>");
						
							out.print("<div class='panel-body'>");
							
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print("Fahrer: <a href='c_UserOeffentlich.jsp?userid=" + fahrerID + "'>" + fahrerName +"</a>" );
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print("von: " + passagierOfFahrt.get(i).getUserStart());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print("nach: " + passagierOfFahrt.get(i).getUserZiel());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print(fahrtElem.getFahrtDatum());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-1'>");
									out.print(fahrtElem.getFahrtStartZeit());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-3'>");
								
								
								
								be1 = fFahrten.getListWithAllBewertungenToUserByUserId(fahrerID);
								schonBewertet1 = new ArrayList();
									for(int h = 0; h < be1.size(); h++){
										if(be1.get(h).getBewertungSenderID().getUserID() == userId && be1.get(h).getFahrtID().getFahrtID() == fahrtElem.getFahrtID()){
											schonBewertet1.add("true");
											
										}else{
											schonBewertet1.add("false");
										}
										
									} 
									
									if(schonBewertet1.contains("true")){
										out.print("Bereits bewertet | ");										
									} else{
										out.print("<a href='c_Bewerten.jsp?fahrtid="+ fahrtElem.getFahrtID() + "&empfid="+ fahrtElem.getFahrerID().getUserID() + "'>Fahrer Bewerten</a> | ");
										
									}
								
								
								
									//out.print("<a href='c_Bewerten.jsp?fahrtid="+ fahrtElem.getFahrtID() + "&empfid="+ fahrtElem.getFahrerID().getUserID() + "'>Fahrer Bewerten</a><br/>");
									out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrtElem.getFahrtID() + "'>zur Fahrt</a> | ");
									
									out.print("<a href='bookout.jsp?fahrtid="+ fahrtElem.getFahrtID() + "&start=" + passagierOfFahrt.get(i).getUserStart() + "&ziel=" + passagierOfFahrt.get(i).getUserZiel() + "&del=" + passagierOfFahrt.get(i).getPassagier_fahrtID() + "'>Ausbuchen</a> ");
									
									
									
								out.print("</div>");
							
							out.print("</div>");
							
						out.print("</div>");
					}
				}else{
					out.print("Du hast bisher keine Fahrten gebucht.");
				}
			
			%>
		</div>
		
		<div class="col-xs-12 col-md-12">
			<h1>Von mir angebotene Fahrten</h1>
			
			<%
				Facade f = new Facade();
				User user = f.getUserById(userIdAusCookie);
			
				List<Fahrt> faList = new ArrayList();
				List<User> mitfahrerList = new ArrayList();
				
				int userId = userIdAusCookie;
				Fahrt fahrt;
				
				List<Bewertung> be = new ArrayList();
				List<String> schonBewertet=  new ArrayList();
				
				User mitfahrer;
				
				PassagierFahrt dusche;
				
				String mifaName;
				
				try{
					faList = f.getListWithAllAngeboteneFahrtenOfUserByUserId(userId);
					
					if(faList.size() >0){
						for(int i = 0 ; i < faList.size(); i++){
							fahrt = faList.get(i);
							mitfahrerList = f.getListWithAllPassagiereOfFahrtByFahrtId(fahrt.getFahrtID());

							out.print("<div class='panel panel-default'>");
							out.print("<div class='panel-heading' style='min-height:40px'>");
								out.print("<h3 class='panel-title col-xs-4'>");
									out.print("<a href='c_Fahrt.jsp?fahrtid=" + fahrt.getFahrtID() + "'>");
										out.print("von " + fahrt.getS1() + " ");
										out.print("nach " + fahrt.getS6() + "<br>");
									out.print("</a></h3>");
								out.print("<div class='col-xs-4'>");
									out.print("am " + fahrt.getFahrtDatum().toString() + " um " + fahrt.getFahrtStartZeit() + " Uhr");
								out.print("</div>");
								
								out.print("<h3 class='panel-title col-xs-4'>");
								out.print("<a href='c_FahrtBearbeiten.jsp?fahrtid=" + fahrt.getFahrtID() + "'>");
									out.print("Bearbeiten");
								out.print("</a></h3>");
								
								out.print("</div>");
								out.print("<div class='panel-body'>");
								
								//c_FahrtBearbeiten.jsp?fahrtid=
									
									
									if(mitfahrerList.size() >0){
										out.print("<div class='col-xs-12'>");
										out.print("<b>Mitfahrer</b>");
										out.print("</div>");
										
										for(int j = 0; j < mitfahrerList.size();j++)
										{
											mitfahrer = mitfahrerList.get(j);
											mifaName = mitfahrer.getvName() + " " + mitfahrer.getnName();
											
											dusche = f.getPassagierFahrtByFahrtAndMitfahrerId(fahrt.getFahrtID(), mitfahrer.getUserID());
											out.print("<div class='col-xs-4'>");
												out.print("<a href='c_UserOeffentlich.jsp?userid=" + mitfahrer.getUserID() + "'>" + mifaName + "</a>");
											out.print("</div>");
											out.print("<div class='col-xs-4'>");
												out.print("von <b>" + dusche.getUserStart() +  "</b> ");
												out.print("nach <b>" + dusche.getUserZiel() +  "</b>");
											out.print("</div>");
											out.print("<div class='col-xs-4'>");
											

											be = f.getListWithAllBewertungenFromUserByUserId(userId);
											schonBewertet = new ArrayList();
												for(int h = 0; h < be.size(); h++){
													if(be.get(h).getBewertungEmpfaengerID().getUserID() == mitfahrer.getUserID() && be.get(h).getFahrtID().getFahrtID() == fahrt.getFahrtID()){
														schonBewertet.add("true");
														
													}else{
														schonBewertet.add("false");
													}
												} 
												
												if(schonBewertet.contains("true")){
													out.print("Bereits bewertet |");										
												} else{
													out.print("<a href='c_Bewerten.jsp?fahrtid="+ fahrt.getFahrtID() + "&empfid="+ mitfahrer.getUserID() + "'>Mitfahrer Bewerten</a> |");
													
												}
												
												out.print("<a href='bookout.jsp?fahrtid="+ fahrt.getFahrtID() + "&start=" + dusche.getUserStart() + "&ziel=" + dusche.getUserZiel() + "&del=" + dusche.getPassagier_fahrtID() + "'> Ausbuchen</a> ");
												
											out.print("</div>");
										}
												
												
											
											
											//out.print("<a href='c_Bewerten.jsp?fahrtid="+ fahrtElem.getFahrtID() + "&empfid="+ fahrtElem.getFahrerID().getUserID() + "'>Fahrer Bewerten</a><br/>");
										
									}else{										
										out.print("<div class='col-xs-12'>");
										out.print("Für diese Fahrt gibt es noch keine Mitfahrer.");
										out.print("</div>");		
									}
	
								out.print("</div>");
								out.print("</div>");
							}
						} else{
							out.print("du hast bisher keine Fahrten inseriert.");
						}
					
					}
					catch (Exception ex){
						out.print(ex);
					}
					
					
			
			%>


		</div>
	</div>
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

<script>
	function showSettings(){
		$('#settings').slideDown();
	}
</script>


</body>
</html>