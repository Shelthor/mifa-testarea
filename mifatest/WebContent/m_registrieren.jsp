<?xml version="1.0" encoding="ISO-8859-1" ?>
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
	String vorname = request.getParameter("vorname");
	String nachname = request.getParameter("nachname");
	String day = request.getParameter("Tag");
	String emailR = request.getParameter("email");
	String telefon = request.getParameter("telefon");
	
	
	out.println("Vorname: "+vorname);
	out.println(nachname);
	out.println(day);
	out.println(emailR);
	out.println(telefon);
	
	








%>


</body>
</html>