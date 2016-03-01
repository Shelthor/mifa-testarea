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

<title>Insert title here</title>

</head>
<body>

	<div class="container">
		<div class="jumbotron"><h1>DOKU</h1></div>
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
						
						out.print("<div class='panel panel-default'>");
						out.print("<div class='panel-heading'>");
							out.print("<h1 class='panel-title'><b>");
							out.print(fuList.get(i).getFunktionBezeichnung() + "(");
							
							for(int j = 0; j < parList.size(); j++){
										out.print(parList.get(j).getParameterBezeichnung() + ",");
									}
							
							out.print(")");
									
							out.print("</b></h1>");
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
									out.print("Parametertyp: " + parList.get(j).getParameterTyp() + "<br>");
									out.print("Parameterbeschreibung: " + parList.get(j).getParameterBeschreibung());
								out.print("</div>");
								out.print("</div>");
							}
						
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