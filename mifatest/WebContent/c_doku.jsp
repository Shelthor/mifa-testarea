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
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<title>API Schnittstellendokumentation</title>

</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h1>DOKU</h1>
			<p><a href="c_writeToDoku.jsp">F�ge eine Funktion hinzu</a></p>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
				<%				
					Facade f = new Facade();
					
					List<Funktion> fuList = new ArrayList();
					List<Parameter> parList = new ArrayList();
					
					String fuBez;
					String fuBesch;
					String fuTyp;
					
					String parBez;
					String parBesch;
					String parTyp;
					
					
					fuList = f.getListWithAllFunktionen();
					
					
					for(int i = 0; i < fuList.size(); i++){
						
						parList = f.getListWithAllParameterByFunktionsId(fuList.get(i).getFunktionID());
						
						fuBez = fuList.get(i).getFunktionBezeichnung();
						fuBesch = fuList.get(i).getFunktionBeschreibung();
						
						out.print("<div class='panel panel-primary'>");
						out.print("<div class='panel-heading'>");
							out.print("<h1 class='panel-title'>");
							out.print(fuList.get(i).getFunktionBezeichnung() + "<b>(</b>");
							
							for(int j = 0; j < parList.size(); j++){
										if(parList.size() < 2 | j == (parList.size() - 1))
											out.print(parList.get(j).getParameterBezeichnung());
										else
										out.print(parList.get(j).getParameterBezeichnung() + ",");
									}
							
							out.print("<b>)</b>");
							out.print(" - R�ckgabetyp: ");
							out.print("<b>" + fuList.get(i).getFunktionTyp() + "</b>");
									
							out.print("</h1>");
						out.print("</div>");
						out.print("<div class='panel-body'>");
						
							for(int j = 0; j < parList.size(); j++){
								out.print("<div class='panel panel-default'>");
								out.print("<div class='panel-heading'>");
									out.print("<h3 class='panel-title'>");
									out.print(parList.get(j).getParameterBezeichnung());
									out.print("</h3>");
								out.print("</div>");
								out.print("<div class='panel-body'>");
									out.print("<b>Parametertyp:</b> " + parList.get(j).getParameterTyp() + "<br>");
									out.print("<b>Parameterbeschreibung:</b> " + parList.get(j).getParameterBeschreibung());
								out.print("</div>");
								out.print("</div>");
							}
							out.println("<h3>Funktionsbeschreibung</h3>");
							out.println(fuBesch);
							
						out.print("</div>");
						out.print("</div>");
						
						/*
						for(int j = 0; j < parList.size(); j++){
							out.print(parList.get(j).getParameterBezeichnung());
						}
						*/
						
						
						
						
						
						
					}
				%>
			</div>
		</div>
	</div>

	

</body>
</html>