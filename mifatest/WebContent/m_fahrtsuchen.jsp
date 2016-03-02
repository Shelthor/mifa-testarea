<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.awt.Button"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Fahrt suchen</title>
<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>

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
 
 out.print("UserID: " + userIdAusCookie + "<br/>");
} 

%>
<!-- Hier aktuelles Datum anzeigen (versteckt) -->
<p id="jahr" name="jahr" hidden></p>
<p id="monat" name="monat" hidden></p>
<p id="tag" name="tag" hidden></p>
<script>
var jahr = new Date();
var monat = new Date();
var tag = new Date();

function getHeute()
{
	document.getElementById("jahr").innerHTML = jahr.getFullYear();
	document.getElementById("monat").innerHTML = monat.getMonth()+1; //getMonth() liefert Wert zwischen 0-11 zurück
	document.getElementById("tag").innerHTML = tag.getDate();
}
</script>



<div class="container-fluid">

<div class="row">								
				<div id="sqlForm" class="abstandNachOben col-md-12">
					<form action="#" method="#">
						<div class="panel panel-default col-xs-12 col-md-6"> 
							<div class="panel-body ">
								<div class=" abstandNachOben">
									<h4>Von?</h4> 
									<input type="text" name="formStart" id="inS1" style="width:100%" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" required autocomplete="off"/><ul class="list-group a"></ul><br/>     
									<h4>Nach?</h4> 
									<input type="text" name="formZiel"  id="inS6" onkeyup="sendInfo(this, 'aj_vergleicheEingabeMitOrtTabelle.jsp', '')" style="width:100%" required autocomplete="off"/><ul class="list-group a"></ul><br/>
								</div>
							</div>
						</div>
						
						<div class="panel panel-default col-xs-12 col-md-12"> 
							<div class="panel-body">
								<div class="col-xs-12 col-md-6">
									<h4>Datum?</h4> 
									<input type="text" id="datepicker" style="width:100%" autocomplete="off" required><br/>
									 
									    <input type="hidden" id="hiddenJahr" name="hJahr" />
								    	<input type="hidden" id="hiddenMonat" name="hMonat" />
								        <input type="hidden" id="hiddenTag" name="hTag" />
								</div>
								<div class="col-xs-12 col-md-6">
									<h4>Uhrzeit?</h4>
										<select name="formStunden" style="width:49%" required>
											<option value="">h</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
										</select>
										<select name="formMinuten" style="width:49%" required>
											<option value="">min</option>
											<option value="0">00</option>
											<option value="15">15</option>
											<option value="30">30</option>
											<option value="45">45</option>
										</select>
										<br/>
							</div>
							</div>
						</div>
						<div class="panel panel-default col-xs-12 col-md-12"> 
							<div class="panel-body">
								<div class="col-xs-12 col-md-6">
									<h4>Wie viele Personen?</h4>
									<input type="text" style="width:100%" name="formKapazitaet" id="formkap" onblur="checkKap()" required autocomplete="off"/><br/>									
								</div>
								<div class="col-xs-12 col-md-6">
									<h4>Angaben zum Gepäck</h4>
									 <select name="formGepaeck" style="width:100%">
									    <option value="mittleres Gepäck">mittleres Gepäck</option>
									    <option value="nur Handgepäck">nur Handgepäck</option>
									  </select>
								</div>
							</div>
							</div>
						<div class="col-xs-12 col-md-12 abstandNachOben">
							<h4>Kommentar?</h4> 
							<input type="text" name="formKommentar" style="width: 100%; height: 75px;" autocomplete="off"/><br/>
							<br/>
							<br/>
							<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK" onclick="getHeute()"/>
						</div>
					</form>
					</div>
				</div>
</div>
<%

if (request.getParameter("ok")!=null)
{
String reiseDatumJahr = request.getParameter("hJahr");
String reiseDatumMonat = request.getParameter("hMonat");
String reiseDatumTag = request.getParameter("hTag");
String reiseDatum = reiseDatumJahr+"-"+reiseDatumMonat+"-"+reiseDatumTag;

String startOrt = request.getParameter("formStart");
String zielOrt = request.getParameter("formZiel");

String benoetigteKap = request.getParameter("formKapazitaet");

//aktuelles Datum
String jahrHeute = request.getParameter("jahr");
String monatHeute = request.getParameter("monat");
String tagHeute = request.getParameter("tag");
String heute = jahrHeute+"-"+monatHeute+"-"+tagHeute;

out.print("<div class='container-fluid' style='background-color:#FFC400'><h3>Zusammenfassung</h3></div>");
out.print("<div class='container-fluid'>");
out.print("<p>Start:"+startOrt+"</p>");
out.print("<p>Ziel:"+zielOrt+"</p>");
out.print("<p>Datum:"+reiseDatum+"</p>");
out.print("<p>Personen:"+benoetigteKap+"</p>");
out.print("<p>Datum heute:"+heute+"</p>");
out.print("</div>");

}

%>

<div id="footer" align="center">
<a href="c_User.jsp">zurück</a>
<a href="m_hilfe.html#thema_fahrtsuchen">Hilfe</a>	 <!-- Link zu Anker -->
</div>

</body>
</html>