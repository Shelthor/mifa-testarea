<!DOCTYPE html>
<html>
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

<div id="footer">
	<a href="m_profil_bearbeiten.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="#">Hilfe</a>
</div>

</body>
</html>