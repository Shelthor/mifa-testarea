<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>MifaTest</title>
</head>
<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">
<%
	String email=request.getParameter("email");
	String passwd=request.getParameter("password");
	Boolean formLogin=true;
	
	if (email=="")
	{
	
		out.println("E-Mail darf nicht leer sein.");		
		formLogin=false;
		email="";
	}
	if (passwd=="")
	{
	
		out.println("Kennwort darf nicht leer sein.");
		formLogin=false;
		passwd="";
	}
	
	if (formLogin==false)
	{
		out.println("Login fehlgeschlagen");
	}
	
	if (email != null & formLogin != false)
	{
		out.print("Der Benutzer mit der E-Mail "+email+" wird angemeldet");
	}
	//wenn formlogin==true dann check mit registrierten eingaben der DB ob user angemeldet werden kann
	//danach öffnen der Profilseite, andernfalls LoginScreen wieder aufrufen!
	

	

%>

<script>
function duschen(){
	
}

duschen();


</script>

</body>
</html>