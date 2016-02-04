<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Setting Cookies</title>
</head>
<body>
<form action="cookies_set.jsp" method="POST">
userId Eingeben: <input type="text" name="fc_userId">
</form>

<div>
	<h1>Funktionsweise</h1>
	<p>
		Wir starten in der cookies_set.jsp. In diesem Beispiel soll der Wert, der in das Inputfeld eingetragen wird direkt in das Cookie gespeichert werden.
	</p>
	<p>
		Der User gibt also die Id (z.B. 1) ein. Mit Druck auf Enter wird der Wert aus dem inputfeld "fc_userId" ins Java
		(siehe unten) übergeben. Es wird ein neues Objekt der Klasse Cookie namens "co_userId" erstellt, der den Cookie name "c_userId" bekommt,
		sowie den Wert "fc_userId" aus dem Formular.
	</p>
	<p>
		Dieser Cookie ist nun im System hinterlegt und kann nun von jeder Seite aus geladen werden (siehe cookies_get.jsp). Er wird
		nach 24h gelöscht.
	</p>
	<p>
		Zum Testen also einfach mal eine Zahl ins form eingeben und danach die cookies_get.jsp laden. Ruft man die cookies_get.jsp auf,
		 wird direkt der Wert aus dem Cookie geladen und angezeigt.
	</p>
</div>

<div style="border: 1px solid;">
<h3>Code</h3>

// Create cookies for first and last names.<br/>      
Cookie co_userId = new Cookie("c_userId",<br/>  
request.getParameter("fc_userId"));<br/><br/>    

// Set expiry date after 24 Hrs for both the cookies.<br/>  
co_userId.setMaxAge(60*60*24); <br/><br/>  

// Add both the cookies in the response header.<br/>  
response.addCookie( co_userId );<br/><br/>  
	   
//printIt<br/>  
out.print("UserID: " + co_userId.getValue());<br/>  
</div>

<%
   // Create cookies for first and last names.      
   Cookie co_userId = new Cookie("c_userId",
 			  request.getParameter("fc_userId"));

   // Set expiry date after 24 Hrs for both the cookies.
   co_userId.setMaxAge(60*60*24); 

   // Add both the cookies in the response header.
   response.addCookie( co_userId );
		   
	//printIt
	out.print("UserID: " + co_userId.getValue());
	
%>

</body>
</html>