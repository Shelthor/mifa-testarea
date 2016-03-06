<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>

<%@ page import="java.text.*"%>

<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	
	
	Facade f = new Facade();
	
	User user = f.getUserById(userIdAusCookie);
%>

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
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo <%= user.getvName() %>!<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="c_UserOeffentlich.jsp?userid=<%=user.getUserID()%>">Mein öffentliches Profil</a></li>
				            <li><a href="c_User.jsp">Terminal</a></li>
				          </ul>
				        </li>
			      	</ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
			</nav>
			
			<div class="jumbotron">
				<h1>Wohin möchtest du?</h1>
			</div>
		</div>
		
		
		<div class="row">
			<ul class="nav nav-pills nav-justified">
			  <li role="presentation" class="active"><a href="cm_Suche.jsp">Fahrt suchen</a></li>
			  <li role="presentation"><a href="c_FahrtAnbieten.jsp">Fahrt anbieten</a></li>
			</ul>
		</div>
	
		<div class="row">			
			<div class="col-sm-12 verlauf-graublau randObenRund randUntenRund abstandNachOben">
				<form>
					<div class="abstandNachOben">
						<div class="col-md-6">
							<p>Von</p>
							<input type="text" name="formStart" style="width:100%" id="inS1" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" required autocomplete="off"/><ul class="list-group a"></ul><br/>
						</div>
						<div class="col-md-6">
							<p>Nach</p>
							<input type="text" name="formZiel" style="width:100%" id="inS1" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" required autocomplete="off"/><ul class="list-group a"></ul><br/>
						</div>
						
						<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/><br/><br/>
						
					</div>   	
				</form>
			</div>
			
			<div class="col-sm-12">
				<h1>Ergebnisse</h1>
				<div class="panel panel-default">
					<div class="panel-body">
						<%
						if (request.getParameter("ok") != null){
							try{
								//Liste mit Fahrten wo User-Start-Eingabe passt
								List<Fahrt> fahrtListe = new ArrayList();
								
								//Liste mit Fahrten wo User-Start-Eingabe UND DARAUFHIN User Ziel Eingabe passt
								List<Fahrt> fahrtListeFinal = new ArrayList();							
								
								String userEingabeZiel = request.getParameter("formZiel"); //aktuell noch hart
								String userEingabeStart = request.getParameter("formStart");  
								
								//füttere >>fahrtListe<< mit Fahrt-Elementen die zur Start-Eingabe passen
								fahrtListe = f.getListWithAllFahrtenWhichContainStart(userEingabeStart); //aktuell noch hart
								
								for(int i = 0; i < fahrtListe.size() ; i++ ){
									//gehe durch >>fahrtListe<< und durchsuche sie nach Stationen, die zur User-Ziel-Eingabe passen

									if(fahrtListe.get(i).getS6().equals(userEingabeZiel)){
										fahrtListeFinal.add(fahrtListe.get(i));
									}
									
									if(fahrtListe.get(i).getS5() != null){
										if(fahrtListe.get(i).getS5().equals(userEingabeZiel)){
											fahrtListeFinal.add(fahrtListe.get(i));
										}
									}

									if(fahrtListe.get(i).getS4() != null){
										if(fahrtListe.get(i).getS4().equals(userEingabeZiel)){
											fahrtListeFinal.add(fahrtListe.get(i));
										}
									}
									
									if(fahrtListe.get(i).getS3() != null){
										if(fahrtListe.get(i).getS3().equals(userEingabeZiel)){
											fahrtListeFinal.add(fahrtListe.get(i));
										}
									}
									
									if(fahrtListe.get(i).getS2() != null){
										if(fahrtListe.get(i).getS2().equals(userEingabeZiel)){
											fahrtListeFinal.add(fahrtListe.get(i));
										}
									}

								}
								
								String fahrerName;
								int fahrerID;
								/*
								for(int i = 0; i < fahrtListeFinal.size() ; i++ ){
									fahrerName = fahrtListeFinal.get(i).getFahrerID().getvName() + " " + fahrtListeFinal.get(i).getFahrerID().getnName() ;
									fahrerID = fahrtListeFinal.get(i).getFahrerID().getUserID();
									//Zeige Endergebnisse >>fahrtListeFinal<< an
										
									out.print("<a href='c_UserOeffentlich.jsp?userid=" + fahrerID + "'>" + fahrerName + "</a>" + " fährt von " );
									
									out.print(fahrtListeFinal.get(i).getS1());
									out.print(" nach " + fahrtListeFinal.get(i).getS6());									
									out.print(" <a href='c_Fahrt.jsp?fahrtid="+ fahrtListeFinal.get(i).getFahrtID() + "'>zur Fahrt</a>");
								}
								*/
								
								
								for(int i = 0; i < fahrtListeFinal.size(); i++)
								{
									fahrerName = fahrtListeFinal.get(i).getFahrerID().getvName() + " " + fahrtListeFinal.get(i).getFahrerID().getnName() ;
									fahrerID = fahrtListeFinal.get(i).getFahrerID().getUserID();
									
									out.print("<div class='panel panel-default col-xs-4 col-sm-4 col-md-12'>");
									
										out.print("<div class='panel-body'>");
										
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print("Fahrer: <a href='c_UserOeffentlich.jsp?userid=" + fahrerID + "'>" + fahrerName +"</a>" );
											out.print("</div>");
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print("von: " + fahrtListeFinal.get(i).getS1());
											out.print("</div>");
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print("nach: " + fahrtListeFinal.get(i).getS6());
											out.print("</div>");
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print(fahrtListeFinal.get(i).getFahrtDatum());
											out.print("</div>");
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print(fahrtListeFinal.get(i).getFahrtStartZeit());
											out.print("</div>");
											out.print("<div class='col-xs-12 col-md-2'>");
												out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrtListeFinal.get(i).getFahrtID() + "'>zur Fahrt</a>");
											out.print("</div>");
										
										out.print("</div>");
									
									out.print("</div>");
								}
								
							}
							catch(Exception ex){
								out.print(ex);
							}
							
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>