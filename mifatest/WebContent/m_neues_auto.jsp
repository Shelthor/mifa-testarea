<!DOCTYPE html>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Neues Fahrzeug erstellen</title>
	
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
	
	
 <style type="text/css">
 #head
        {
            background-color: #CDDC39;
            color: white;
            text-align: center;
            font-family: verdana;
            padding: 5px;
         }

         a:link {color:white}
         a:visited{color:white}
         a:hover{color:white}
         a:active{color:white}

#footer
        {
            background-color: #CDDC39;
            color:white;
            clear: both;
            text-align: center;
            padding: 5px;
            font-family: verdana;
            font-size: 75%;
        }

         ul
        {
        	display: inline;
        	padding: 2px;
        	text-align: center;
        	float: left;
        	list-style-type: none;
        }
         table
        {
        	font-family: verdana;
        }
        #myProgress 
        {
  			width: 50%;
  			height: 20px;
  			position: relative;
  			background-color: #ddd;
  			align: center;
		}

		#myBar 
		{
  			background-color: #CDDC39;
  			width: 10px;
  			height: 30px;
  			position: absolute;
		}
        
        
        
</style>
</head>
<body>

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

Facade f = new Facade();
User user = f.getUserById(userIdAusCookie);


%>

<div id="form" align="center" class="container">
	<div class="row">
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
				            <li><a href="c_UserOeffentlich.jsp?userid=<%=user.getUserID()%>">Mein öffentliches Profil</a></li>
				            <li><a href="c_User.jsp">Terminal</a></li>
				          </ul>
				        </li>
			      	</ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
			</nav>
	</div>

	<div class="row">
		<div class="jumbotron">
					<h1>Lege ein neues Auto an</h1>
		</div>
	</div>
	
	<div class="row" id="form2">
		<form action="m_neues_auto.jsp" method="post">
			<div>
			Hersteller:
			<input type="text" id="typ" name="typ" required/>
			</div>
			<div>
				Bezeichnung:
					<input type="text" id="bez" name="bez" required/>	
			</div>
			<div>
				Kennzeichen:
					<input type="text" id="kennz" name="kennz" style="text-transform:uppercase" size="1" maxlength="3" required/>-
					<input type="text" id="kennz2" name="kennz2" style="text-transform:uppercase" size="1" maxlength="2" required/>-
					<input type="text" id="kennz3" name="kennz3" style="text-transform:uppercase" size="4" maxlength="4" min="1" max="9999" required/>
			</div>
			<div>
				Farbe:
					<input type="text" id="color" name="color">
			</div>
			<div>
				Bild:
					<input type="file" id="picture" name="picture">
				<input type="submit" id="submit" name="submit" value="Änderungen speichern" onclick="move()"/>
			</div>		<!--<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>-->

			
		</form>
	</div>
</div>
<!-- Progressbar einblenden ggf -->
<div id="myProgress" style="display: none;">
  <div id="myBar"></div>
</div>

<%	//Besitzer des jeweiligen Fahrzeugs aus Cookie ID auslesen und zuordnen
//Cookie USer auslesen
	if(request.getParameter("submit")!=null)
	{
		//out.print("Button geht");
		//Variablen
		Facade fcreateNewCar = new Facade();
		Facade fcreateNewUserKfz = new Facade();
		String myNewCarTyp = request.getParameter("typ");
		String myNewCarBez = request.getParameter("bez");
		String myNewCarPlate = request.getParameter("kennz");
		String myNewCarPlate2 = request.getParameter("kennz2");
		String myNewCarPlate3 = request.getParameter("kennz3");
		String myCarPlateNew = myNewCarPlate.toUpperCase()+"-"+myNewCarPlate2.toUpperCase()+"-"+myNewCarPlate3.toUpperCase();
		String myNewCarColor = request.getParameter("color");
		//Wie Bild erfassen?
		String myNewCarPicture = "Picture";
		
		User currentUser;
		currentUser = fcreateNewCar.getUserById(userIdAusCookie);
		Fahrzeug car;
		
		Boolean changeValid=false;
		currentUser.setUserID(userIdAusCookie);
		UserFahrzeug owner;
		
	
		
		
		
		
		if(myNewCarTyp=="" | myNewCarBez=="" | myNewCarPlate=="" | myNewCarPlate2=="" | myNewCarPlate3=="")
		{
			changeValid=false;
			out.print("Bitte Daten eingeben!");
		}
		else
		{
			changeValid=true;
		}
		
		if(changeValid==true)
		{
			try
			{
				//fNewUserCar.newFahrzeug(ftyp, fBez, nschild, fFarbe, url)
				//Erzeugt neues Fahrzeug
				fcreateNewCar.newFahrzeug(myNewCarTyp, myNewCarBez, myCarPlateNew, myNewCarColor, myNewCarPicture);
				out.print("Fahrzeug anlegen erfolgreich.");
				
				out.print(fcreateNewCar.getAktuellesFahrzeugID());
				
				fcreateNewUserKfz.newUserFahrzeug(fcreateNewCar.getAktuellesFahrzeugID(), userIdAusCookie);
				
				
				//fcreateNewUserKfz.
				String backToMain = "http://localhost:8080/mifa/m_profil_bearbeiten.jsp";
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", backToMain);
				
				//UseridausCookie -> owner of created car
				//car ID auf UserID setzen damit die zusammengehören
				//car.setFahrzeugID(userIdAusCookie);
				//owner.setUser_fahrzeugID(userIdAusCookie);
				
			}
			catch(Exception e)
			{
				e.toString();
				out.print("Fahrzeug anlegen fehlgeschlagen!");
			}
		}		
	}

%>

<script>
function move() {
  var elem = document.getElementById("myBar");   
  var width = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (width == 100) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
    }
  }
}

function showProgress()
{
	document.getElementById("myProgress").style.display="show";
	}
</script>


</body>
</html>