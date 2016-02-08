<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Persönliche Änderungen</title>
<style>
         a:link {color:white}
         a:visited{color:white}
         a:hover{color:white}
         a:active{color:white}

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

        td
        {
            font-family: verdana;
        }
</style>

</head>
<body>
<div id="head">
	<h1>Mein Profil</h1>
</div>

<div id="form">
    <div id="formnames">

        <table align="center">
            <tr>
                <td>Name ändern: </td>
                <td><input type="text" id="name" name="nameField"/></td>
            </tr>
            <tr>
                <td>Profilbild ändern: </td>
                <td><input type="file" id="profilbildupload" name="picture"/></td>
            </tr>
            <tr>
                <td>Wohnort ändern: </td>
                <td><input type="text" id="wohnort" name="wohnField"/></td>
            </tr>
            <tr>
                <td><input type="submit" id="submit" name="submit" value="Änderungen speichern" /></td>
                <td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>
            </tr>
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