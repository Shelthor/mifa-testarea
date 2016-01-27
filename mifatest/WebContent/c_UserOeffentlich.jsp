<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserOeffentlich</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>

	<%! 
		Facade f;
		User u;
		
		int id;
		
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
		id = 3; //kommt aus cookie
					
		try{
			u = f.getUserById(id);
			
			vorName = u.getvName();
			nachName = u.getnName();
			geburtsDatum = u.getGeburtsDatum().toString();
			bildUrl = u.getUserBildURL();
			telefon = u.getTelNummer();
			mail = u.geteMail();
			
			List<Bewertung> bList = f.getListWithAllBewertungenToUserByUserId(id);
			
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

<script>
	function Age()
	{
		var datee = "<%=geburtsDatum %>";
		
		/*
		var byr = datee.substr(0, 3);
		var bmo = datee.substr(5, 6);
		var bday = datee.substr(8, 9);
		*/
		parseInt(datee.substr(0, 4));
		
		var byr = parseInt(datee.substr(0, 4));
		var bmo = parseInt(datee.substr(5, 2));
		var bday = parseInt(datee.substr(8, 2));
		
		//
		var age;
		var now = new Date();
		tday=parseInt(now.getDate());
		tmo=parseInt(now.getMonth());
		tyr=parseInt(now.getFullYear());
			
			if((tmo > bmo)||(tmo==bmo & tday>=bday))
				{age=byr}
			else
				{age=byr+1}
			
			var result = (tyr-age) + " Jahre alt";
			return result;		
	}

</script>

<div class="container">
	<div class="jumbotron">
	    <h1>Mifahrzentrale</h1>
	    <p>Userprofil</p>
	</div>
	<div class="row">
		<div class="col-sm-12">
	    	<div class="row grau">
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
						document.write(Age());
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