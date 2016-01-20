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
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>Hi</h1>
    <p>Gib eine Bewertung ab!</p> 
  </div>
  <div class="row">
    <div class="col-sm-3 gruen">
		<div class="row">
			<div class="col-sm-12">
				<p>Mein Profil -> UserOeffentlich.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Fahrt Suchen -> FahrtSuchen.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Fahrt Anbieten -> FahrtAnbieten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine Fahrten -> MeineFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine angebotenen Fahrten -> MeineFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Historie -> LetzteFahrten.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Erhaltene Bewertungen -> Bewertungen.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Meine Einstellungen -> Settings.jsp</p>
   			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p>Mailbox -> Mailbox.jsp</p>
   			</div>
		</div>

    </div>
    <div class="col-sm-9">
		<div id="sqlForm" class="grau">
				<form class="row" action="Bewerten.jsp" method="post">
					<div class="col-sm-4">
						Fahrstil?:
						<input type="text" name="formfahrstil" />
					</div>
					<div class="col-sm-4">
						P�nktlichkeit?:
						<input type="text" name="formPuenktlichkeit" />
					</div>
					<div class="col-sm-4">
						Freundlichkeit?:
						<input type="text" name="formFreundlichkeit" />
					</div>
					<br/>
					<br/>
					<div class="col-sm-12">
						Kommentar?: 
						<br/>
						<br/>
						<input type="text" name="formKommentar" style="width: 100%; height: 75px;"/>
						<br/>
						<br/>
						<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/>
					</div>

				</form>
	
			
		</div>
		<br/>
		<div id="sendSuccess" style="display:none">
			<p>SUCCESS</p>
		</div>
		<div id="sendFail" style="display:none">
			<p>FAIL</p>
		</div>
	</div>
  </div>
</div>

<%! 
	Fahrt fahrtid;
	String text;
	int fahrs, freundli, punkt;
	User empf, send;
	Date heute;
	
	String status;
%>

<script>
function sendSQL(){
	  $( "#sqlForm" ).slideUp();
	}

function suc(){
	$( "#sendSuccess" ).show();
}

function fail(){
	$( "#sendFail" ).show();
}
		
</script>
<% 
	Facade f = new Facade();

if (request.getParameter("ok") != null){
	
	if (empf == null & send == null){
		try
		{
			heute = new java.util.Date();
			text = request.getParameter("formKommentar");
			fahrs = Integer.parseInt(request.getParameter("formfahrstil"));
			freundli = Integer.parseInt(request.getParameter("formFreundlichkeit"));;
			punkt = Integer.parseInt(request.getParameter("formPuenktlichkeit"));;
			fahrtid = f.getFahrtById(1);
			
			empf = f.getUserById(1);// nur zu testzwecken, sp�ter dann->  f.getUserById(request.getParameter("empfid"))
			send = f.getUserById(2);// nur zu testzwecken, sp�ter dann->  f.getUserById(request.getParameter("senderid"))
			
			// VERGLEICHE AUCH DEN LINK
			// http://stackoverflow.com/questions/1890438/how-to-get-parameters-from-the-url-with-jsp
			
			f.newBewertung(text, fahrs, punkt, freundli, empf, send, heute, fahrtid);
			
		    out.print("<script>sendSQL();</script>");
		    out.print("<script>suc();</script>");
		    
		}
		catch (Exception ex)
		{
			out.print("<script>fail();</script>" + "Fehler: " + ex.toString());

		}
	}
	
}
%>

</body>
</html>