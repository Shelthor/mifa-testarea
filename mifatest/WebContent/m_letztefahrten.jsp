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
<title>Meine letzten Fahrten</title>
</head>
<body>
<%
	int id = 1;
	Facade fFahrten = new Facade();
	//Fahrt gefahren = fFahrten.getListWithAllAngeboteneFahrtenOfUserByUserId(id);
	
	//Zeigt an, wohin der USer zuletzt gefahren ist (als Mitfahrer)

%>
<div class="container-fluid">
  <h1>Deine letzten Fahrten <%//= %></h1>
  <div class="row">
    <div class="col-sm-4" style="background-color:#CDDC39">
      <p>Datum</p>
      <p><%//=bewDate %></p>
    </div>
    <div class="col-sm-4" style="background-color:#C0CA33">
      <p>Fahrt</p>
      <p><%//= %></p>
    </div>
    <div class="col-sm-4" style="background-color:#CDDC39">
      <p>Uhrzeit</p>
      <p><%//= %></p>
    </div>
  </div>
</div>


</body>
</html>