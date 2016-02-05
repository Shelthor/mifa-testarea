<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INTERN</title>
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
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
		 
		 out.print("UserID: " + userIdAusCookie + "<br/>");
	}
%>

<%! 
	Facade f;
	int userId;
	User user;
%>

<%
	//userId = 7;//VERFERINERN -> siehe unten
	userId = userIdAusCookie;
	
	f = new Facade();
	user = f.getUserById(userId);
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
		            <li><a href="c_UserOeffentlich.jsp">Mein öffentliches Profil</a></li>
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
		  <li role="presentation"><a href="#">Fahrt suchen</a></li>
		  <li role="presentation"><a href="c_FahrtAnbieten.jsp">Fahrt anbieten</a></li>
		  <li role="presentation"><a href="#">Historie</a></li>
		  <li role="presentation"><a href="#">Settings</a></li>
		  <li role="presentation"><a href="#">Mailbox</a></li>
		</ul>
		
		<div class="col-xs-12 col-md-6" style="background-color:#ee82ee;">
			<h1>Meine gebuchten Fahrten</h1>
			<p>[Martin]</p>
			<p>[Martin]</p>
			<p>[Martin]</p>
			<p>[Martin]</p>
		</div>
		
		<div class="col-xs-12 col-md-6" style="background-color:#ee92ee;">
			<h1>Von mir angebotene Fahrten</h1>
			<p>[Martin]</p>
			<p>[Martin]</p>
			<p>[Martin]</p>
			<p>[Martin]</p>
		</div>
	</div>
  </div>
</div>



</body>
</html>