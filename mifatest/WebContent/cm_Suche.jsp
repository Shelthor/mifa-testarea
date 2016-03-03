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

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<p>Suchleiste</p>
			</div>
			<div class="col-sm-12">
				<h1>Ergebnisse</h1>
				<div class="panel panel-default">
					<div class="panel-body">
						<%
							Facade f = new Facade();
						
							//Liste mit Fahrten wo User-Start-Eingabe passt
							List<Fahrt> fahrtListe = new ArrayList();
							
							//Liste mit Fahrten wo User-Start-Eingabe UND DARAUFHIN User Ziel Eingabe passt
							List<Fahrt> fahrtListeFinal = new ArrayList();							
							
							String userEingabeZiel = "Leipzig";//aktuell noch hart
							
							//füttere >>fahrtListe<< mit Fahrt-Elementen die zur Ziel-Eingabe passen
							fahrtListe = f.getListWithAllFahrtenWhichContainStart("Grimma"); //aktuell noch hart
							
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
							
							for(int i = 0; i < fahrtListeFinal.size() ; i++ ){
								//Zeige Endergebnisse >>fahrtListeFinal<< an
																
								out.print(fahrtListeFinal.get(i).getFahrtID() + "<br>");
								
								out.print(fahrtListeFinal.get(i).getFahrerID().getnName() + "fährt von" + "<br>");
								
								out.print(fahrtListeFinal.get(i).getS1() + "<br>");
								out.print("nach " + fahrtListeFinal.get(i).getS6() + "<br>");
							}
							
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>