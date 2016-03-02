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
<title>Meine Fahrten</title>
</head>
<body>
<!-- Seite zeigt die letzten angebotenen Fahrten des Users an -->

<div align="center"><h1>Meine Fahrten als Mitfahrer</h1></div>
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

	Facade fFahrten = new Facade();	
	PassagierFahrt fahrt;
	Fahrt fahrtElem;
	User passagiereOfFahrt;

	List<PassagierFahrt> passagierOfFahrt = fFahrten.getListWithAllPassagierFahrtRelationsByFahrtId(fahrt);
	//String letzteFahrtDatum = fahrt.getFahrtDatum().toString();
	for(int i = 0; i < fahrtenOfUserAsMitfahrer.size(); i++)
	{
		//Zeigt an, wohin der USer zuletzt gefahren ist (als Mitfahrer)
		out.print("<div class='container-fluid' align='center'>");
		out.print("<div class='row'>");
		out.print("<div class='col-sm-1' style='background-color:#CDDC39'>");
		out.print("<p>Fahrt</p>");
		//out.print("<p>"+letzteFahrtDatum+"</p>");
		out.print("</div>");
		out.print("<div class='container-fluid' align='center'>");
		out.print("<div class='row'>");
		out.print("<div class='col-sm-1' style='background-color:#C0CA33'>");
		out.print("<p>Fahrtdetails</p>");
		//out.print("<a href='c_Fahrt.jsp?fahrtid="+ fahrt.getFahrtID()+"'>zur Fahrt</a>");
		out.print("</div>");
	}
	
	if (fahrtenOfUserAsFahrer.size()==0)
	{
		out.print("<div class='container-fluid' style='background-color:#FFB300' style='font-color:#FFFFFF'>");
		out.print("<p>Du warst bisher noch kein Mitfahrer einer Fahrt.</p>");
		out.print("</div>");
	}
	
%>

<div id="footer">
<a href="m_hilfe.html#thema_letzteFahrt">Hilfe</a>	 <!-- So wird auf Anker in anderen Seiten verwiesen -->
</div>

</body>
</html>