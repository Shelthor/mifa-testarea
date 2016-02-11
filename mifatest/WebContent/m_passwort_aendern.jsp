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
	<title>Ändere dein Kennwort</title>
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

        table
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
	<h1>Dein Kennwort</h1>
</div>
<form action="m_passwort_aendern.jsp" method="post"></form>
<div id="form">
	<div id="form2">
		<table align="center">
			<tr>
				<td>aktuelles Kennwort:</td>
				<td><input type="text" id="pwdAkt" name="pwdAkt"/><td>
			</tr>
			<tr>
				<td>Neues Kennwort:</td>
				<td><input type="text" id="pwdNeu" name="pwdNeu"/></td>	
			</tr>
			<tr>
				<td>Neues Kennwort bestätigen:</td>
				<td><input type="text" id="pwdNeuBest" name="pwdNeuBest"/></td>
			</tr>
			<tr>
				<td><input type="submit" name="change" value="Änderungen speichern" /></td>
				<td><input type="submit" id="cancel" name="cancel" value="Änderungen verwerfen"/></td>
			</tr>	
		</table>
	</div>
</div>
</form>
<div id="footer">
	<a href="m_profil_bearbeiten.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="m_hilfe.html">Hilfe</a>
</div>
<%
if(request.getParameter("change")!= null)
{
	Boolean passwordValid = false;
	//wenn aktuelles passwort == in DB hinterlegtes PW
			//-> überprüfe, ob neues PW und PW bestätigen == true bzw. gleich
			//-> änderungen in DB übernehmen
	Facade fCurrentUserChangePW = new Facade();
			try
			{
				//eingegebenes PW
				User currentUser = fCurrentUserChangePW.getUserById(userIdAusCookie);
				String enteredPassword = request.getParameter("pwdAkt");
				int currentUserID = currentUser.getUserID();
				//gespeichertes PW in DB
				Passwort currentUserPassword = fCurrentUserChangePW.getPasswortByUserId(currentUserID);
				String currentUserPWValue = currentUserPassword.getPasswortValue();
				
				
				
				
				Encryptor en = new Encryptor();
				String hash = currentUserPassword.toString();
				
				if(enteredPassword == currentUserPWValue)
				{
					out.print("Passwörter Passen");
					passwordValid = true;
				}
				
			
			}
			catch(Exception e) 
			{
				out.print("Änderung nicht möglich");
			}

}
%>


</body>
</html>
