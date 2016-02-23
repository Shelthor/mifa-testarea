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
<title>Meine Bewertungen</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>
<body>

<div class='container' align="center"><h1>Deine Bewertungen</h1></div>  

<%
Cookie[] cookies = request.getCookies();

int userIdAusCookie = 0;

if( cookies != null)
{
	 for (int i = 0; i < cookies.length; i++){
		 if(cookies[i].getName().equals("c_userId")){
			 userIdAusCookie = Integer.parseInt(cookies[i].getValue());
		 }
	 }
	 
	 out.print("UserID: " + userIdAusCookie + "<br/>");
}



	Facade fShowBewertung = new Facade();
	String aktueller_Benutzer="[aktueller Benutzer]"; //später ersetzen durch Cookie UserID Name
	
	//Datum aus DB holen
	//Mit FahrtID Fahrt von wo nach wo
	//Bewerter -> ableiten aus Bewerter ID
	//Bewertungstext aus DB
	//Ratings
	String dateOfBewertung;
	String senderOfBewertung;
	String textOfBewertung;
	float fahrstil;
	float freundlichkeit;
	float puenktlichkeit;
	Fahrt fahrt;
	Bewertung fahrtBewertungElem;
	
	List<Bewertung> aktUserBew = fShowBewertung.getListWithAllBewertungenToUserByUserId(userIdAusCookie);
	for(int i = 0; i < aktUserBew.size(); i++)
	{
		fahrtBewertungElem = aktUserBew.get(i);
		dateOfBewertung = fahrtBewertungElem.getBewertungDatum().toString();
		senderOfBewertung = fahrtBewertungElem.getBewertungSenderID().getvName()+" "+fahrtBewertungElem.getBewertungSenderID().getnName();
		textOfBewertung = fahrtBewertungElem.getBewertungText();
		fahrstil = fahrtBewertungElem.getFahrstilRating();
		freundlichkeit = fahrtBewertungElem.getFreundlichkeitRating();
		puenktlichkeit = fahrtBewertungElem.getPuenktlichkeitRating();
		fahrt = fahrtBewertungElem.getFahrtID();
		
		out.print("<div class='container-fluid' align='center'>");
		out.print("<div class='row'>");
		out.print("<div class='col-sm-1' style='background-color:#CDDC39'>");
		out.print("<p>Datum</p>");
		out.print("<p>"+dateOfBewertung+"</p>");
		out.print("</div>");
		out.print("<div class='col-sm-1' style='background-color:#C0CA33'>");
		out.print("<p>Bewerter</p>");
		out.print("<p>"+senderOfBewertung+"</p>");
		out.print("</div>");
		out.print("<div class='col-sm-2' style='background-color:#CDDC39'>");
		out.print("<p>Fahrt</p>");
		out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrt.getFahrtID()+"'>zur Fahrt</a>");
		out.print("</div>");
		out.print("<div class='col-sm-2' style='background-color:#C0CA33'>");
		out.print("<p>Bewertungstext</p>");
		out.print("<p>"+textOfBewertung+"</p>");
		out.print("</div>");
		out.print("<div class='col-sm-1' style='background-color:#CDDC39'>");
		out.print("<p>Pünktlichkeit</p>");
		out.print("<p>"+puenktlichkeit+"</p>");
		out.print("</div>");
		out.print("<div class='col-sm-1' style='background-color:#C0CA33'>");
		out.print("<p>Fahrstil</p>");
		out.print("<p>"+fahrstil+"</p>");
		out.print("</div>");
		out.print("<div class='col-sm-1' style='background-color:#CDDC39'>");
		out.print("<p>Freundlichkeit</p>");
		out.print("<p>"+freundlichkeit+"</p>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("<br>");
		//link
		//out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrt.getFahrtID()+"'>zur Fahrt</a>");
	}
%>


<div id="footer" align="center">
	<a href="m_fahrzeug_landingpage.jsp">zurück</a>
	<a href="c_User.jsp">Startseite</a>
	<a href="m_hilfe.html">Hilfe</a>
</div>

</body>
</html>