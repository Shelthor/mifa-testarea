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
					<td><input type="text" id="kennz" name="kennz"/></td>
				</tr>
				<tr>
					<td>Farbe:</td>
					<td><input type="text" id="color" name="color"></td>
				</tr>
				<tr>
					<td>Bild:</td>
					<td><input type="file" id="picture" name="picture"></td>
				</tr>
					<td><input type="submit" id="submit" name="submit" value="Änderungen speichern" /></td>
					<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>

			</table>
		</form>
	</div>
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
		String myNewCarColor = request.getParameter("color");
		//Wie Bild erfassen?
		String myNewCarPicture = "Picture";
		String carOwner = "CurrentUser";
		
		Facade fcreateNewCar = new Facade();
		
		try
		{
			//fNewUserCar.newFahrzeug(ftyp, fBez, nschild, fFarbe, url)
			//Erzeugt neues Fahrzeug
			fcreateNewCar.newFahrzeug(myNewCarTyp, myNewCarBez, myNewCarPlate, myNewCarColor, myNewCarPicture);
			out.print("Fahrzeug anlegen erfolgreich.");
		}
		catch(Exception e)
		{
			e.toString();
			out.print("Fahrzeug anlegen fehlgeschlagen!");
		}
				
	}

%>

</body>
</html>