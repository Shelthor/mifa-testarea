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
<script type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Facade fNewUserCar = new Facade();
	
	int zaehlen=0;
	int flag=0;
	Fahrzeug kfz;
	String kfzTyp;
	String kfzBez;
	String kfzPlate;
	String kfzFarbe;
	String kfzBild;
	
	
	kfz = fNewUserCar.getFahrzeugByUserId(userIdAusCookie);
	
	kfzTyp = kfz.getFahrzeugTyp();
	kfzBez = kfz.getFahrzeugBezeichnung();
	kfzPlate = kfz.getNummernschild();
	kfzFarbe = kfz.getFahrzeugFarbe();
	kfzBild = kfz.getFahrzeugBildURL();
	
	
	
	
	
	if(request.getParameter("send")!= null)
	{
		String newCarBezeichnung = request.getParameter("bez");
		String newCarTyp = request.getParameter("typ");
		String carPlate = request.getParameter("kennz_vorn").toUpperCase()+"-"+request.getParameter("kennz_mitte").toUpperCase()+"-"+request.getParameter("kennz_hinten");
		String newCarColor = request.getParameter("color");
		String newCarPicture = "img/1.png";
		String carOwner = "CurrentUser";
		
		try
		{
			
						
		}
		catch (Exception ex)
		{
			out.print("Fahrzeug nicht gefunden");
		}
		
		
		try
		{
			//Ändern Fahrzeug Bezeichnung
			if (request.getParameter("bez")!="")
			{
				flag++;	
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugBezeichnung(newCarBezeichnung);
			}
			
			
			//Ändern Fahrzeug Typ
			if (request.getParameter("typ")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugTyp(newCarTyp);
			}
			
			//Ändern Kennzeichen
			if (request.getParameter("kennz_vorn")!="" | request.getParameter("kennz_mitte")!="" | request.getParameter("kennz_hinten")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setNummernschild(carPlate);
			}
			//Farbe ändern
			if (request.getParameter("color")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugFarbe(newCarColor);
			}
			//Bild ändern
			if (request.getParameter("picture")!="")
			{
				flag++;
				fNewUserCar.getFahrzeugByUserId(userIdAusCookie).setFahrzeugBildURL(newCarPicture);
			}
			
			//out.print(flag+" Änderungen vorgenommen");
			//Update DB
			if (flag > 0)
			{
				fNewUserCar.updateFahrzeug(kfz);
				//Optional Ausgabefenster erstellen mit Gegenüberstellung der Werte
				out.print("<div class='container'>");
				out.print("<p>"+flag+" Änderungen vorgenommen</p>");
				out.print("</div>");
				
			}
			else
			{
				out.print("keine Datensätze werden geändert");
			}
			
		}
		catch(Exception e)
		{
			out.print("Änderungen nicht möglich");
		}
		
	}	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//Felderhandling

if(userIdAusCookie==0)
	{
		out.print("<script>document.getElementById('old').style.display = 'none';</script>");
		out.print("<script>document.getElementById('form').style.display = 'block';</script>");
	}	
%>

<div id="head">
	<h1>Mein Fahrzeug</h1>
</div>

<div id="old" align="center" class="container-fluid">
	<p id=>Mein aktuelles Auto</p>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2" style="background-color:#C0CA33">
				<p id="myCar"><%=kfzBez %></p>
			</div>
			<div class="col-sm-2">	
				<p id="myCar">Text</p>
			</div>	
			<div class="col-sm-2" style="background-color:#C0CA33">
				<p id="myCarTyp"><%=kfzTyp %></p>
			</div>
			<div class="col-sm-2">	
				<p id="myKennz"><%=kfzPlate %></p>
			</div>	
				<!-- Format: AA-BB_xxxx -->
			<div class="col-sm-2" style="background-color:#C0CA33">	
				<p id="myCarColor"><%=kfzFarbe %></p>
			</div>	
			<div class="col-sm-2">	
				<p id="myCarPicture"><%=kfzBild %></p>
				<p>Hier wird das Bild von deinem Fahrzeug erscheinen</p>
					<!--  <form action="m_fileUpload.jsp" enctype="multipart/form-data" method="post"> -->
					<div id="carImage">
						<img src="#" width="10%" height="10%"/>
					</div>
					</form>
			</div>
				
		</div>		
	</div>
</div>

<p align="center">Was möchtest du ändern?</p>
<div id="form" align="center">
	<div id="form2">
		<form action="m_fahrzeug_bearbeiten.jsp" method="post" enctype="multipart/form-data">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-2">
						Fahrzeugtyp:
							<div class="container-fluid">
								<div class="col-sm-4" id="newTyp">
									<input type="text" id="typ" name="typ">	
								</div>
							</div>	
					</div>
				</div>	
			<div class="container-fluid">
				
					<div class="col-sm-2">
						Bezeichnung:
							<div class="container-fluid">
								<div class="col-sm-4" id="newBez">
									<input type="text" id="bez" name="bez">	
								</div>
							</div>	
					</div>
				
			</div>
			<div class="container-fluid">
				
					<div class="col-sm-2">
						Kennzeichen:
							<div class="container-fluid">
								<div class="col-sm-4" id="newPlate">
									<input type="text" id="kennz_vorn" name="kennz_vorn" style="text-transform:uppercase" size="1" maxlength="3">-
									<input type="text" id="kennz_mitte" name="kennz_mitte" style="text-transform:uppercase" size="1" maxlength="2">
									<input type="text" id="kennz_hinten" name="kennz_hinten" style="text-transform:uppercase" size="4" maxlength="4" min="1" max="9999">
								</div>
							</div>
					</div>
				
			</div>
			<div class="container-fluid">
				
					<div class="col-sm-2">
						Farbe:
							<div class="container-fluid">
								<div class="col-sm-4" id="newColor">
									<input type="text" id="color" name="color">
								</div>
							</div>
					</div>
				
			</div>
			<div class="container-fluid">
					<div class="col-sm-2">
						Bild:
							<div class="container-fluid">
								
									<div class="col-sm-4">
										<input type="file" id="picture" name="picture">
										<p>Test</p>
									</div>
								
							</div>
					</div>
			</div>
			<div class="container-fluid">
				<input type="submit" id="submit" name="send" value="Änderungen speichern" />
				<input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/>
			</div>	
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