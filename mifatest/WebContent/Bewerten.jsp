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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
<div id="holz">
	<form action="Bewerten.jsp" method="post">
	
	Fahrstil?:
	<input type="text" name="formfahrstil" />
	Pünktlichkeit?:
	<input type="text" name="formPuenktlichkeit" />
	Freundlichkeit?:
	<input type="text" name="formFreundlichkeit" />
	Kommentar?:
	<input type="text" name="formKommentar" />
	<input id="knopf" type="submit" name="ok" value="OK"/>
	
	</form>
</div>

<script>
function duschen(){
	  $( "#holz" ).slideUp();
	}
		
</script>
<% 
	Facade f = new Facade();

if (request.getParameter("ok") != null){
	try{
		heute = new java.util.Date();
		text = request.getParameter("formKommentar");
		fahrs = Integer.parseInt(request.getParameter("formfahrstil"));
		freundli = Integer.parseInt(request.getParameter("formFreundlichkeit"));;
		punkt = Integer.parseInt(request.getParameter("formPuenktlichkeit"));;
		fahrtid = f.getFahrtById(1);
		
		empf = f.getUserById(1);
		send = f.getUserById(2);
		
		f.newBewertung(text, fahrs, punkt, freundli, empf, send, heute, fahrtid);

	    out.print("<script>duschen();</script>");
	    out.print("SUCCESS");
		
	}
	catch (Exception ex)
	{
	  out.print(ex.toString());
	}
}
%>

</body>
</html>