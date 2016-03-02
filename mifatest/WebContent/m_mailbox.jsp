<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<div class="col-sm-2 col-md-2 col-lg-2" align="right">Empfänger:</div><div class="col-sm-10 col-md-10 col-lg-10" align="left"><input type="text"/></div>
	<div class="col-sm-2 col-md-2 col-lg-2" align="right">Betreff:</div><div class="col-sm-10 col-md-10 col-lg-10" align="left"><input type="text"/></div>
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

</body>
</html>