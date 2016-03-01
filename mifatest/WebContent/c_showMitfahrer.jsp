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
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userIdAusCookie%>">Mein öffentliches Profil</a></li>
		            <li><a href="c_User.jsp">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	
	
	
	
		<div class="jumbotron"><h1>Meine Angebotenen Fahrten</h1></div>
		<div class="panel panel-default">
			<div class="panel-body">

			<%
				
			
				List<Fahrt> faList = new ArrayList();
				List<User> mitfahrerList = new ArrayList();
				
				int userId = userIdAusCookie;
				
				User mitfahrer;
				Fahrt fahrt;
				
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
								out.print("<h3 class='panel-title col-xs-6'>");
									out.print("<a href='c_Fahrt.jsp?fahrtid=" + fahrt.getFahrtID() + "'>");
									out.print("von " + fahrt.getS1() + " ");
									out.print("nach " + fahrt.getS6() + "<br>");
									out.print("</a></h3>");
								out.print("<div class='col-xs-6'>");
									out.print("am " + fahrt.getFahrtDatum().toString() + " um " + fahrt.getFahrtStartZeit() + " Uhr");
								out.print("</div>");
								out.print("</div>");
								out.print("<div class='panel-body'>");	
							
									for(int j = 0; j < mitfahrerList.size();j++){
										mitfahrer = mitfahrerList.get(j);
										mifaName = mitfahrer.getvName() + " " + mitfahrer.getnName();
										
										dusche = f.getPassagierFahrtByFahrtAndMitfahrerId(fahrt.getFahrtID(), mitfahrer.getUserID());
										out.print("<div class='col-md-6'>");
											out.print("<a href='c_UserOeffentlich.jsp?userid=" + mitfahrer.getUserID() + "'>" + mifaName + "</a>");
										out.print("</div>");
										out.print("<div class='col-md-6'>");
											out.print("von <b>" + dusche.getUserStart() +  "</b> ");
											out.print("nach <b>" + dusche.getUserZiel() +  "</b>");
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

</body>
</html>