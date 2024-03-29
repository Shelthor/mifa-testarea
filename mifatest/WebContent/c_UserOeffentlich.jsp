<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Userprofil</title>
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

<%! 
	Facade f;
	User uIntern;
	User user;
	
	int userId,userIdPublic;
	
	double drPuenktlich, drFahrstil, drFreundlich;

	String  vorName;
	String 	nachName;
	String 	geburtsDatum;
	String 	bildUrl;
	String	telefon;
	String 	mail;

%>
<%
	f = new Facade();

	userId = userIdAusCookie;
	userIdPublic = Integer.parseInt(request.getParameter("userid"));
	List<Bewertung> bewertungList = new ArrayList();
				
	try{
		user = f.getUserById(userIdPublic);
		uIntern = f.getUserById(userId);
		
		bewertungList = f.getListWithAllBewertungenToUserByUserId(userIdPublic);
		
		vorName = user.getvName();
		nachName = user.getnName();
		geburtsDatum = user.getGeburtsDatum().toString();
		bildUrl = user.getUserBildURL();
		telefon = user.getTelNummer();
		mail = user.geteMail();
		
		List<Bewertung> bList = f.getListWithAllBewertungenToUserByUserId(userId);
		
		List<Integer> fahrstilRating = new ArrayList<Integer>();
		List<Integer> puenktlichkeitRating = new ArrayList<Integer>();
		List<Integer> freundlichkeitRating = new ArrayList<Integer>();
		
		for(int i = 0; i < bList.size(); i++){
			
			/*
			
			S�mtliche Ratings reichen von 1 - 5 (Sterne).
			Eine 0 Beim Fahrstil bedeutet, dass derjenige Passagier war und kein Fahrer,
			daher ignoriere bei der Bildung des Durchschnitts aller Fahrstil-Bewertungen
			alle Eintr�ge mit 0
			
			*/
			
			if(bList.get(i).getFahrstilRating() != 0)
				fahrstilRating.add(bList.get(i).getFahrstilRating());
			
			// Rest normal
			puenktlichkeitRating.add(bList.get(i).getPuenktlichkeitRating());
			freundlichkeitRating.add(bList.get(i).getFreundlichkeitRating());
		}
/////////////////////////////////////////////////////////////////////////////////	  
		drFahrstil = f.durchschnitt(fahrstilRating);
		drPuenktlich = f.durchschnitt(puenktlichkeitRating);
		drFreundlich = f.durchschnitt(freundlichkeitRating);
////////////////////////////////////////////////////////////////////////////////////////////////////////////			
	}
	catch (Exception e){
		out.print(e);
	}
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
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo <%= uIntern.getvName() %>!<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="c_UserOeffentlich.jsp?userid=<%=userId%>">Mein �ffentliches Profil</a></li>
		            <li><a href="c_User.jsp">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

	<div class="jumbotron">
	    <h1>Mitfahrzentrale</h1>
	    <p>Hallo! Du befindest dich auf einem �ffentlichen Userprofil :)</p>
	</div>
	<div class="row">
		<div class="col-sm-12">
	    	<div class="row randObenRund blau">
	    		<div class="col-sm-9">
		    		<h1><%=vorName %> <%=nachName %></h1>
	   		 	</div>
	   		 	   		 	
	   		 	<div class="col-sm-3">
		    		<img class="userPic" src="<%=bildUrl %>" alt="hierBild">
	   		 	</div> 	
	   		</div>
			<div class="row panel-body">
	    		<div class="col-sm-4">	
			    	<script>
						document.write(giveAge('<%=geburtsDatum %>'));
					</script>
			    </div>
			    <div class="col-sm-4">
			    	<p>Telefon: <%=telefon %></p>
			    </div>
			    <div class="col-sm-4">
			    
			    <a href="mailto:<%=mail %>"><%=mail %></a>
	   			</div>	    	
		    </div> 
		</div>
	</div>
	<div class="row blau randUntenRund">
		<div class="col-sm-12">
			<h1>Erhaltene Bewertungen</h1>
			
			<div class="col-sm-12">
				<p>durchschnittlich: </p>
				<div class="col-sm-4"><h4>Fahrstil: </h4><p><%=drFahrstil %></p></div>
				<div class="col-sm-4"><h4>P�nktlichkeit: </h4><p><%=drPuenktlich %></p></div>
				<div class="col-sm-4"><h4>Freundlichkeit: </h4><p><%=drFreundlich %></p></div>
			</div>
			
			<%
				Bewertung bListElem;
				String bewerterName;
				for(int i = 0; i < bewertungList.size(); i++)
				{
					bListElem = bewertungList.get(i);
					bewerterName = bListElem.getBewertungSenderID().getvName() + " " + bListElem.getBewertungSenderID().getnName();
					
					
					out.print("<div class='panel panel-default col-md-12 abstandNachOben' style='color:#000'>");
						out.print("<div class='panel-body'>");
							out.print("<a href='c_UserOeffentlich.jsp?userid=" + bListElem.getBewertungSenderID().getUserID() + "'>" + bewerterName +"</a>" + " schrieb: <br>");
							out.print(bListElem.getBewertungText());
						out.print("</div>");
					out.print("</div>");
				}
			%>
			
		</div>
	</div>
</div>
</body>
</html>