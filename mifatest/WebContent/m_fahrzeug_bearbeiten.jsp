<!DOCTYPE html>
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

<div id="head">
	<h1>Mein Fahrzeug</h1>
</div>

<div id="old" align="center">
	<p id=>Mein aktuelles Auto</p>
	<hr>
	<div>
		<table>
			<tr>
				<td><p id="myCar">Bezeichnung</p></td>
				<td><p id="myCar"></p></td>
			</tr>
			<tr>
				<td><p id="myCarTyp">Typ</p></td>
			</tr>
			<tr>
				<td><p id="myKennz">Kennzeichen</p></td>
			</tr>
			<tr>
				<td><p id="myCarColor">Farbe</p></td>
			</tr>
			
		</table>
	</div>
</div>

<p align="center">Was möchtest du ändern?</p>
<div id="form">
	<div id="form2">
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
			<td><input type="submit" id="submit" name="submit" value="Änderungen speichern" /></td>
			<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>
			</tr>
		</table>
	</div>	
</div>

<div id="footer">
	<a href="m_fahrzeug_landingpage.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="#">Hilfe</a>
</div>

</body>
</html>