<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
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
		 
	}
%>

<%
	if(userIdAusCookie!=0)
	{
		//falls schon ein user eingeloggt ist -> redirect ins terminal
		//SeitenPfad
		String domain = "http" + "://" +   
	   		request.getServerName() +       // "myhost"
	  		":" + request.getServerPort() + // ":" + "8080"
	    	"/mifa";
		
		
		//String url = ((HttpServletRequest)request).getRequestURL().toString();
		String loginPage= domain + "/c_User.jsp";
		
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", loginPage);
	}

%>

<div class="container">
	<div class="jumbotron">
		<h1>Willkommen</h1>
		<p>auf der Mitfahrzentrale der BA Dresden</p>
	</div>
	<div class="row">
	
		<div class="panel panel-default col-xs-12">
		<div class="panel-body">
			<p><a href=m_index.jsp>Login</a></p>
			<p><a href=m_registrieren.jsp>Register</a></p>
		</div>
	</div>
	</div>
</div>

</body>
</html>