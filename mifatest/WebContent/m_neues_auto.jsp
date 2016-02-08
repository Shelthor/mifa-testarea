<!DOCTYPE html>
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
	</div>
</div>

<div id="footer">
	<a href="#">zurück</a>
	<a href="#">Startseite</a>
	<a href="#">Hilfe</a>
</div>

</body>
</html>