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
	<title>Neues Fahrzeug erstellen</title>
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
<div id="head">
	<h1>Mein neues Auto</h1>
</div>

<div id="form">
	<div id="form2">
		<form action="m_neues_auto.jsp" method="post">
			<table align="center">
				<tr>
					<td>Fahrzeugtyp:</td>
					<td><input type="text" id="typ" name="typ"/><td>
				</tr>
				<tr>
					<td>Bezeichnung:</td>
					<td><input type="text" id="bez" name="bez"/></td>	
				</tr>
				<tr>
					<td>Kennzeichen:</td>
					<td><input type="text" id="kennz" name="kennz" style="text-transform:uppercase" size="1" maxlength="2"/>-</td>
					<td><input type="text" id="kennz2" name="kennz2" style="text-transform:uppercase" size="1" maxlength="2"/>-</td>
					<td><input type="text" id="kennz3" name="kennz3" style="text-transform:uppercase" size="4" maxlength="4" min="1" max="9999"/></td>
				</tr>
				<tr>
					<td>Farbe:</td>
					<td><input type="text" id="color" name="color"></td>
				</tr>
				<tr>
					<td>Bild:</td>
					<td><input type="file" id="picture" name="picture"></td>
				</tr>
					<td><input type="submit" id="submit" name="submit" value="Änderungen speichern" onclick="move()"/></td>
					<!--<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>-->

			</table>
		</form>
	</div>
</div>

<div id="myProgress" style="display: none;">
  <div id="myBar"></div>
</div>

<div id="footer">
	<a href="m_fahrzeug_landingpage.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="m_hilfe.html">Hilfe</a>
</div>

<%	//Besitzer des jeweiligen Fahrzeugs aus Cookie ID auslesen und zuordnen
	if(request.getParameter("submit")!=null)
	{
		//out.print("Button geht");
		//Variablen
		String myNewCarTyp = request.getParameter("typ");
		String myNewCarBez = request.getParameter("bez");
		String myNewCarPlate = request.getParameter("kennz");
		String myNewCarPlate2 = request.getParameter("kennz2");
		String myNewCarPlate3 = request.getParameter("kennz3");
		String myCarPlateNew = myNewCarPlate+"-"+myNewCarPlate2+"-"+myNewCarPlate3;
		String myNewCarColor = request.getParameter("color");
		//Wie Bild erfassen?
		String myNewCarPicture = "Picture";
		String carOwner = "CurrentUser";
		Boolean changeValid=false;
		
		Facade fcreateNewCar = new Facade();
		
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
			
				String backToMain = "http://localhost:8080/mifatest/m_profil_bearbeiten.jsp";
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", backToMain);
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