<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Success</title>
</head>
<body>
<% 
	String userName = null;
	Cookie[] cookies = request.getCookies();
	
	if (cookies!=null)
	{
		for (Cookie cookie:cookies)
		{
			if (cookie.getName().equals("username")) userName = cookie.getValue();
		}
	}
	//Wenn versucht wird, die jsp direkt anzusteuern --> Weiterleitung zu NewIndex.html
	//(loginPage)
	if (userName == null) response.sendRedirect("NewIndex.html");
%>
<h3>Hallo <%=userName %>, Login erfolgreich</h3><br>

<form action="LogoutServlet" method="post">

	<input type="submit" value="Logout"/>
	
</form>

</body>
</html>