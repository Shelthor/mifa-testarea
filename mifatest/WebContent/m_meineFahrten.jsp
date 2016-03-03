<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Meine Fahrten</title>

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
<!-- Seite zeigt die letzten angebotenen Fahrten des Users an -->

	<div class="container">
	<div class="jumbotron">
		<h1>Meine Fahrten als Mitfahrer</h1>
	</div>
	
			<%
				Cookie[] cookies = request.getCookies();
				int userIdAusCookie = 0;
				if( cookies != null)
				{
					for (int i = 0; i < cookies.length; i++)
					{
						if(cookies[i].getName().equals("c_userId"))
						{
							userIdAusCookie = Integer.parseInt(cookies[i].getValue());
					 	}
					}
				}
				
					Facade fFahrten = new Facade();	
					PassagierFahrt fahrt;
					Fahrt fahrtElem = new Fahrt();
					User passagiereOfFahrt;
				
					
					String fahrerName;
					int fahrerID;

					int fahrtID = 0;
					
					List<PassagierFahrt> passagierOfFahrt = fFahrten.getListWithAllPassagierFahrtRelationsByUserId(userIdAusCookie);
										
					for(int i = 0; i < passagierOfFahrt.size(); i++)
					{
						fahrtElem = passagierOfFahrt.get(i).getFahrtID();
						fahrerName = fahrtElem.getFahrerID().getvName() + " " +  fahrtElem.getFahrerID().getnName();
						fahrerID = fahrtElem.getFahrerID().getUserID();
						
						
						out.print("<div class='panel panel-default col-xs-4 col-sm-4 col-md-12'>");
						
							out.print("<div class='panel-body'>");
							
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print("<a href='c_UserOeffentlich.jsp?userid=" + fahrerID + "'>" + fahrerName +"</a>" );
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print(passagierOfFahrt.get(i).getUserStart());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print(passagierOfFahrt.get(i).getUserZiel());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print(fahrtElem.getFahrtDatum());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print(fahrtElem.getFahrtStartZeit());
								out.print("</div>");
								out.print("<div class='col-xs-12 col-md-2'>");
									out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrtElem.getFahrtID() + "'>zur Fahrt</a>");
								out.print("</div>");
							
							out.print("</div>");
							
						out.print("</div>");
					}
				
				%>
	
	</div>
	

<div class="container-fluid" id="footer" align="center">
	<div class="row">
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#CDDC39" align="center"><a href="c_User.jsp">zurück</a></div>
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#9CCC65" align="center"><a href="c_User.jsp">Startseite</a></div>
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#CDDC39" align="center"><a href="m_hilfe.html">Hilfe</a></div>
	</div>
</div>

</body>
</html>