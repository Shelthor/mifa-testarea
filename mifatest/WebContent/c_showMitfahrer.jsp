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
		<div class="jumbotron"><h1>Meine Angebotenen Fahrten</h1></div>
		<div class="panel panel-default">
			<div class="panel-body">

			<%
				Facade f = new Facade();
				List<Fahrt> faList = new ArrayList();
				List<User> mitfahrerList = new ArrayList();
				
				int userId = 1;//kommt künftig aus cookie
				
				User mitfahrer;
				Fahrt fahrt;
				
				String mifaName;
					
				faList = f.getListWithAllAngeboteneFahrtenOfUserByUserId(userId);
				
				
				for(int i = 0 ; i < faList.size(); i++){
					fahrt = faList.get(i);
					mitfahrerList = f.getAllPassagiereOfFahrtByFahrtId(fahrt.getFahrtID());
					out.print("<div class='panel panel-default'>");
					out.print("<div class='panel-heading'>");
						out.print("<h3 class='panel-title'>");
							out.print("<a href='c_Fahrt.jsp?fahrtid=" + fahrt.getFahrtID() + "'>");
							out.print("von " + fahrt.getS1() + " ");
							out.print("nach " + fahrt.getS6() + "<br>");
							out.print("</a><br>" + "</h3>");
						out.print("</div>");
						out.print("<div class='panel-body'>");	
					
							for(int j = 0; j < mitfahrerList.size();j++){
								mitfahrer = mitfahrerList.get(j);
								mifaName = mitfahrer.getvName() + " " + mitfahrer.getnName();
								out.print("<a href='c_UserOeffentlich.jsp?userid=" + mitfahrer.getUserID() + "'>" + mifaName + "</a><br>");
							}
						out.print("</div>");
						out.print("</div>");	
						
				}
			
			%>
			</div>
		</div>
	</div>

</body>
</html>