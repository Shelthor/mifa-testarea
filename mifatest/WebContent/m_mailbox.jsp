<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Meine Mailbox</title>
<style type="text/css">
	textarea
	{
		resize:none;
	}
</style>
</head>
<body>

<% //Mailbox API von Google einbinden %>

<div align="center" style="background-color:#CDDC39"><h1>Dein E-Mail Postfach</h1></div>

<div class="row">
	<div align="center" style="background-color:#CDDC39" class="col-sm-6 col-md-6 col-lg-6">
	<h3>Neue E-Mail schreiben</h3>
	<form action="#">
	<div class="col-sm-2 col-md-2 col-lg-2" align="right"><input type="submit" name="senden" value="senden"/></div>
	<div class="col-sm-2 col-md-2 col-lg-2" align="right">Empfänger:</div><div class="col-sm-10 col-md-10 col-lg-10" align="left"><input type="text" name="empf" required/></div>
	<div class="col-sm-2 col-md-2 col-lg-2" align="right">Betreff:</div><div class="col-sm-10 col-md-10 col-lg-10" align="left"><input type="text" name="betreff"/></div>
	<div class="col-sm-2 col-md-2 col-lg-2" align="right"><textarea rows="15" cols="100" ></textarea></div>
	</form>
	</div>
			
	<div align="center" style="background-color:#CDDC39" class="col-sm-6 col-md-6 col-lg-6"><h3>Postfach</h3>
	<form action="#">
	<div class="col-sm-4 col-md-4 col-lg-4" align="center">Von</div>
	<div class="col-sm-4 col-md-4 col-lg-4" align="center">Betreff</div>
	<div class="col-sm-4 col-md-4 col-lg-4" align="center">Datum</div>
	</form>
	</div>
</div>

<div class="container-fluid" id="footer" align="center">
	<div class="row">
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#CDDC39" align="center"><a href="c_User.jsp">zurück</a></div>
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#9CCC65" align="center"><a href="c_User.jsp">Startseite</a></div>
	<div class="col-sm-4 col-md-4 col-lg-4" style="background-color:#CDDC39" align="center"><a href="m_hilfe.html">Hilfe</a></div>
	</div>
</div>

<%
String result;
// Recipient's email ID needs to be mentioned.
String to = "abcd@gmail.com";

// Sender's email ID needs to be mentioned
String from = "mcmohd@gmail.com";

// Assuming you are sending email from localhost
String host = "localhost";

// Get system properties object
Properties properties = System.getProperties();

// Setup mail server
properties.setProperty("mail.smtp.host", host);

// Get the default Session object.
Session mailSession = Session.getDefaultInstance(properties);

try{
   // Create a default MimeMessage object.
   MimeMessage message = new MimeMessage(mailSession);
   // Set From: header field of the header.
   message.setFrom(new InternetAddress(from));
   // Set To: header field of the header.
   message.addRecipient(Message.RecipientType.TO,
                            new InternetAddress(to));
   // Set Subject: header field
   message.setSubject("This is the Subject Line!");
  
   // Send the actual HTML message, as big as you like
   message.setContent("<h1>This is actual message</h1>",
                         "text/html" );
   // Send message
   Transport.send(message);
   result = "Sent message successfully....";
}catch (MessagingException mex) {
   mex.printStackTrace();
   result = "Error: unable to send message....";
}
%>

</body>
</html>