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
	 	//Kontrolle
	 	//out.print("UserID: " + userIdAusCookie + "<br/>");
}

%>
<div id="head">
	<h1>Mein Profil</h1>
</div>

<div id="form">
    <div id="formnames">

        <table align="center">
            <tr>
                <td >Name ändern:</td>
                <td ><input type="text" id="name" name="nameField"/></td>
                <td><input type="checkbox" name="checkBoxName"></td>
            </tr>
            <tr>
                <td>Profilbild ändern: </td>
                <td><input type="file" id="profilbildupload" name="picture"/></td>
                <td><input type="checkbox" name="checkBoxBild" ></td>
            </tr>
            <tr>
                <td>Wohnort ändern: </td>
                <td><input type="text" id="wohnort" name="wohnField"/></td>
                <td><input type="checkbox" name="checkBoxOrt" ></td>
            </tr>
            <tr>
                <td><input type="submit" id="submit" name="submit" value="Änderungen speichern" /></td>
                <td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>
            </tr>
        </table>

    </div>
</div>

<div id="footer">
    <a href="m_profil_bearbeiten.jsp">zurück</a>
    <a href="c_User.jsp">Startseite</a>
    <a href="#">Hilfe</a>
</div>
<%
	
	
	if(request.getParameter("submit")!= null)
	{
		//Überprüfung, in welchen Feldern Eintragungen getätigt wurden
		//wenn Felder leer -> alte Eintragungen lassen
		//wenn Felder befüllt -> entsprechende Werte ändern
		//danach in DB
		if (request.getParameter("nameField") != null & request.getParameter("checkBoxName") != null)
		{
			
			out.print("Name wird geändert");
		}
		
		
		if (request.getParameter("wohnField") != null & request.getParameter("checkBoxOrt") != null)
		{
			
			out.print("Ort wird geändert");
		}
		
		
		
	}



%>


</body>
</html>