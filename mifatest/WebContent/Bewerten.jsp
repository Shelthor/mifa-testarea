<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INTERN - Bewerten</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>

<% out.print("Todays Date: "); %>


<%=new java.util.Date() %>


<%! 
	Fahrt fahrtid;
	String text;
	int fahrs, freundli, punkt;
	User empf, send;
	Date heute;
%>

<br /><br />

<!-- I create a form that will talk to this page -->

<form action="Bewerten.jsp" method="post">

Enter 2 Numbers:
<input type="text" name="numone" />

<input type="text" name="numtwo" />

<input type="submit" value="Calculate" />

</form>

The Answer:

<!-- JSP expression code that prints the values of the fields -->

<%= request.getParameter("numone") %>
+
<%= request.getParameter("numtwo") %>

<!-- Another Scriplet block of code -->

<% 
	Facade f = new Facade();

	heute = new java.util.Date();
	text = "hi";
	fahrs = 2;
	freundli = 2;
	punkt = 2;
	fahrtid = f.getFahrtById(1);
	
	empf = f.getUserById(1);
	send = f.getUserById(2);
	
try{
	
	f.newBewertung(text, fahrs, punkt, freundli, empf, send, heute, fahrtid);
	
}
catch (Exception ex)
{
  out.print(ex.toString());
}
%>
</body>
</html>