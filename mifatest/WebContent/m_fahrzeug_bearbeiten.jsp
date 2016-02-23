<!DOCTYPE html>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">

	<title>Fahrzeug bearbeiten</title>

<style>
         a:link {color:white}
         a:visited{color:white}
         a:hover{color:white}
         a:active{color:white}

         p
         {
         	font-family: verdana;
         	color: black;
         }

         #head
         {
            background-color: #CDDC39;
            color: white;
            text-align: center;
            font-family: verdana;
            padding: 5px;
        }

        #tools
        {
            line-height: 30px;
            background-color: #CDDC39;
            height: 300px;
            width: 100px;
            float: left;
            padding: 5px; 
            font-family: verdana;
            color: white; 
            font-size: 100%;
        }

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

        #section
        {
            width: 330px;
            float: left;
            padding: 10;
            font-family: verdana;
           font-size: 100%;
        }

        ul
        {
        	display: inline;
        	padding: 2px;
        	text-align: center;
        	float: left;
        	list-style-type: none;
        }

        #form
        {
        	overflow: auto;
        }

        #old
        {
        	background-color: #CDDC39;
            color:white;
            clear: both;
            font-family: verdana;
            font-size: 80%;
        }

        li
        {
        	font-family: verdana;
        }

        hr
        {
        	color: white;
        }

         td
        {
            font-family: verdana;
        }

</style>

</head>
<body>
<%	//Cookie USer auslesen
		Cookie[] cookies = request.getCookies();

		int userIdAusCookie = 0;

		if( cookies != null)
			{
				for (int i = 0; i < cookies.length; i++)
					{
 						if(cookies[i].getName().equals("c_userId"))
 								{
	 								userIdAusCookie = Integer.parseInt(cookies[i].getValue());
	 								out.print("UserID: " + userIdAusCookie + "<br/>");
 								}
					}

			}
%>
<%	
	//Fahrzeughandling
	//aktuelle Fahrzeuginformationen anzeigen
	Facade UserVehicle = new Facade();
	
	//Fahrzeug currentVehicle = UserVehicle.getFahrzeugByUserId(userIdAusCookie);
	//feste Zahl durch cookieValue ersetzen, damit aktueller user sein Auto sieht
	Fahrzeug currentVehicle = UserVehicle.getFahrzeugByUserId(1);
	String currentUserCarBezeichnung = currentVehicle.getFahrzeugBezeichnung();
	String currentUserCarTyp = currentVehicle.getFahrzeugTyp();
	String currentUserCarPlate = currentVehicle.getNummernschild();
	String currentUserCarColor = currentVehicle.getFahrzeugFarbe();
	
	
	if(currentUserCarColor==null)
	{
		currentUserCarColor="Farbe nicht angegeben";
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if(request.getParameter("send")!= null)
	{
		String newCarBezeichnung = request.getParameter("bez");
		String newCarTyp = request.getParameter("typ");
		String newCarPlate = request.getParameter("kennz");
		String newCarColor = request.getParameter("color");
		String newCarPicture = "EMPTY";
		String carOwner = "CurrentUser";
		
		Facade fNewUserCar = new Facade();
		
		try
		{
			//neue Fahrzeugdaten erfassen und an DB übermitteln
			//fNewUserCar.newFahrzeug(ftyp, fBez, nschild, fFarbe, url)
			//Erzeugt neues Fahrzeug
			//fNewUserCar.newFahrzeug(newCarTyp, newCarBezeichnung, newCarPlate, newCarColor, newCarColor);
			
			//Änderung der Attribute zur zugehörigen FahrzeugID
			
			out.print("Übermittlung läuft");
		}
		catch(Exception e)
		{
			out.print("Änderungen nicht möglich");
		}
		
	}	
%>


<div id="head">
	<h1>Mein Fahrzeug</h1>
</div>

<div id="old" align="center">
	<p id=>Mein aktuelles Auto</p>
	<hr>
	<div>
		<table>
			<tr>
				<td><p id="myCar"><%=currentUserCarBezeichnung %></p></td>
				<td><p id="myCar"></p></td>
			</tr>
			<tr>
				<td><p id="myCarTyp"><%=currentUserCarTyp %></p></td>
			</tr>
			<tr>
				<td><p id="myKennz"><%=currentUserCarPlate %></p></td>
				<!-- Format: AA-BB_xxxx -->
			</tr>
			<tr>
				<td><p id="myCarColor"><%=currentUserCarColor %></p></td>
			</tr>
			
		</table>
	</div>
</div>




<p align="center">Was möchtest du ändern?</p>
<div id="form">
	<div id="form2">
		<form action="m_fahrzeug_bearbeiten.jsp" method="post">
			<table align="center">
				<tr>
					<td>Fahrzeugtyp:</td>
					<td><input type="text" id="typ" name="typ"></td>	
				</tr>
				<tr>
					<td>Bezeichnung:</td>
					<td><input type="text" id="bez" name="bez"></td>	
				</tr>
				<tr>
					<td>Kennzeichen:</td>
					<td><input type="text" id="kennz" name="kennz"></td>
					<!-- Format: AA-BB_xxxx -->
				</tr>
				<tr>
					<td>Farbe:</td>
					<td><input type="text" id="color" name="color"></td>
				</tr>
				<tr>
					<td>Bild:</td>
					<td><input type="file" id="picture" name="picture"></td>
				</tr>
				<tr>
					<td><input type="submit" id="submit" name="send" value="Änderungen speichern" /></td>
					<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>
				</tr>
			</table>
		</form>		
	</div>	
</div>

<div id="footer">
	<a href="m_fahrzeug_landingpage.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="#">Hilfe</a>
</div>

</body>
</html>