<!DOCTYPE html>
<html>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>
<head>
<meta charset="UTF-8">
	<title>Wohin als nächstes?</title>
<style>
         a:link {color:black}
         a:visited{color:black}
         a:hover{color:black}
         a:active{color:black}

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

        table
        {
        	font-family: verdana;
        }

       
</style>



</head>
<body>
<div id="head">
	<h1>Wohin als nächstes?</h1>
</div>
<!--  
<div id="form">
	<div id="form2">
		<table align="center">
			<tr>
				<td align="center">Mein neues Auto</td>
				<td align="center">Mein Auto bearbeiten</td>
			</tr>
			<tr>
				<td align="center" ><a href="m_neues_auto.jsp">Neues Fahrzeug erstellen</a></td>
				<td align="center" ><a href="m_fahrzeug_bearbeiten.jsp">Fahrzeug bearbeiten</a></td>
			</tr>
			<tr>
				<td align="center"><img src="#"></td> 
				<td align="center"><img src="#"></td>
			</tr>
		</table>
	</div>
</div>
-->

<%
//ID aus Cookie holen
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
//Prüfe, ob Fahrzeug zur zugehörigen UserID existiert
//wenn nein --> nur "neues Fahrzeug erstellen" möglich
//wenn ja   --> nur Fahrzeug bearbeiten möglich (1:1-Beziehung in DB)

 int kontrolle = 1;
 String link = "http://localhost:8080/mifatest/";

 int fahrzeugid,fahrzeuguserid;
 Facade fahrzeugOwnerDB = new Facade();
 Boolean fahrzeugvorhanden=false;
 
 Fahrzeug fahrzeug,kfz;
 
 fahrzeugid = fahrzeugOwnerDB.getFahrzeugByUserId(userIdAusCookie).getFahrzeugID(); 
 
try
{
 
 if (fahrzeugid == userIdAusCookie)
 {
	 //out.print("true");
	 fahrzeugvorhanden=true;
 }
 else
 {
	 fahrzeugvorhanden=false;
 }
 
 if (fahrzeugvorhanden==true)
 {
	 out.print("<div class='container' align='center'>");
	 out.print("Dein Fahrzeug existiert bereits. Für Änderungen ");
	 String linkToUpdateCar = ("m_fahrzeug_bearbeiten.jsp");
	 out.print("<a href='http://localhost:8080/mifatest/"+linkToUpdateCar+"'>bitte hier entlang.</a>");
	 out.print("</div>");
 }
 else
 {
	 out.print("<div class='container' align='center'>");
	 out.print("Du hast noch kein Fahrzeug hinterlegt. ");
	 String linkToNewCar = ("m_neues_auto.jsp");
	 out.print("<a href='http://localhost:8080/mifatest/"+linkToNewCar+"'>Das kannst du aber hier.</a>");
	 out.print("</div>");
 }
}
catch (Exception e)
{
	//fahrzeugid=0;
}
 
 
 


 if(kontrolle == 0)
 {
		try
		{
			fahrzeuguserid = userIdAusCookie;
			
		}
	
		catch (Exception ex) 
		{
			
		}
	}



%>

<div id="footer">
	<a href="m_profil_bearbeiten.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="m_hilfe.html">Hilfe</a>
</div>

</body>
</html>