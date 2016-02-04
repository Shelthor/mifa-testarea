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
<title>PUBLIC</title>
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
	User user;
	
	int userId;
	
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
	//userId = 7; //VERFERINERN -> siehe unten
	userId = userIdAusCookie;
				
	try{
		user = f.getUserById(userId);
		
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
			
			Sämtliche Ratings reichen von 1 - 5 (Sterne).
			Eine 0 Beim Fahrstil bedeutet, dass derjenige Passagier war und kein Fahrer,
			daher ignoriere bei der Bildung des Durchschnitts aller Fahrstil-Bewertungen
			alle Einträge mit 0
			
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
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo <%= user.getvName() %>!<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="c_UserOeffentlich.jsp">Mein öffentliches Profil</a></li>
		            <li><a href="c_User.jsp">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

	<div class="jumbotron">
	    <h1>Mitfahrzentrale</h1>
	    <p>Hallo! Du befindest dich auf einem öffentlichen Userprofil :)</p>
	</div>
	<div class="row">
		<div class="col-sm-12">
	    	<div class="row randObenRund blau">
	    		<div class="col-sm-6">
		    		<h1><%=vorName %> <%=nachName %></h1>
	   		 	</div>
	   		 	<div class="col-sm-6">
		    		<img src="<%=bildUrl %>" alt="hierBild">
	   		 	</div> 	
	   		</div>
			<div class="row hellgrau">
	    		<div class="col-sm-3">	
			    	<script>
						document.write(giveAge('<%=geburtsDatum %>'));
					</script>
			    </div>
			    <div class="col-sm-3">
			    	<%=telefon %>
			    </div>
			    <div class="col-sm-3">
			    	<%=mail %>
	   			</div>	    	
		    </div> 
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6" style="background-color:#ee82ee;">
			<h1>MARTINS PART - Letzte Fahrten</h1>
			<p>
				// müssen wir noch überlegen, ob wir das so öffentlich anzeigen, wer wann wohin gefahren ist,
				die DB abfrage und Anpassung der facade.java muss trotzdem erfolgen, da z.B noch für 
				die Meinefahrten.jsp benötigt.
			</p>
			<p>Angeboten</p>
			<div class="verlauf-graublau">
				<p>Martins Part</p>
				<p>Martins Part</p>
				<p>Martins Part</p>
			</div>
			<p>als Passagier</p>
			<div class="verlauf-graublau">
				<p>Martins Part</p>
				<p>Martins Part</p>
				<p>Martins Part</p>
			</div>
		</div>
		<div class="col-sm-6">
			<h1>Erhaltene Bewertungen</h1>
			
			<div class="verlauf-orange">
				<p>durchschnittlich: </p>
				<div class="col-sm-3"><h4>Fahrstil: </h4><p class="verlauf-graublau"><%=drFahrstil %></p></div>
				<div class="col-sm-3"><h4>Pünktlichkeit: </h4><p class="verlauf-graublau"><%=drPuenktlich %></p></div>
				<div class="col-sm-3"><h4>Freundlichkeit: </h4><p class="verlauf-graublau"><%=drFreundlich %></p></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>