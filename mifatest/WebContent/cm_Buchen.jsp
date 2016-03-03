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
				<h1>Buch dad Shyt</h1>
				<div class="panel panel-default">
					<div class="panel-body">
						<%
							Facade f = new Facade();
						
							Fahrt fahrt = new Fahrt();
							List<String> hilfsListe = new ArrayList();
							
							String userStart;
							String userZiel;
							
							int kap;
							
							int p1;
							int p2;
							int p3;
							int p4;
							int p5;
							int p6;
							
							int zaehlenStart = 0;
							int zaehlenStopp = 0;
							
							//dresden nach Leipzig
							
							fahrt = f.getFahrtById(8);
							
							 userStart = "Dresden";
							 userZiel = "Gera"; //vergleichen
							
							kap = fahrt.getKapazitaet();
							
							p1 = fahrt.getP1();
							p2 = fahrt.getP2();
							p3 = fahrt.getP3();
							p4 = fahrt.getP4();
							p5 = fahrt.getP5();
							p6 = fahrt.getP6();
							///
													
							hilfsListe.add(fahrt.getS1());
							hilfsListe.add(fahrt.getS2());
							hilfsListe.add(fahrt.getS3());
							hilfsListe.add(fahrt.getS4());
							hilfsListe.add(fahrt.getS5());
							hilfsListe.add(fahrt.getS6());
							
							//
							
							for (int i = 0; i < hilfsListe.size(); i++)
							{
								out.print("vorwärts(Start)" + i + "<br>");
								
								if(hilfsListe.get(i)!= null){
									
									int ausgabe = i+1;
									
									if(hilfsListe.get(i).equals(userStart)){
										out.print("Start bei: S" + ausgabe);
										
										zaehlenStart = ausgabe;
									}
								}
							}
							
							for (int i = hilfsListe.size()-1; i >= 1; i--)
							{
								out.print("rückwärts(Ende)" + i + "<br>");
								
								if(hilfsListe.get(i)!= null){
									
									int ausgabe = i;
									if(hilfsListe.get(i).equals(userZiel)){
										out.print("Ende bei: S" + ausgabe);
										
										zaehlenStopp = ausgabe;
									}
								}
							}
							
							out.print("Start " + zaehlenStart);
							out.print("Stop " + zaehlenStopp);
							
							for(int j = zaehlenStart; j <= zaehlenStopp; j++)
							{
								out.print("DUSCHENJJJJJ " + j);
								if(j == 1){
									fahrt.setP1(p1-1);
									
								}
								if(j == 2){
									fahrt.setP2(p2-1);
								}
								if(j == 3){
									fahrt.setP3(p3-1);
								}
								if(j == 4){
									fahrt.setP4(p4-1);
								}
								if(j == 5){
									fahrt.setP5(p5-1);
								}
								
							}

							f.updateFahrt(fahrt);
							
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>