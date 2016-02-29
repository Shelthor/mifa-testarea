<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Time" %>

<%@ page import="java.text.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3f0-lP6PquSnOUBu8j85B5MGM3pDLFx4&signed_in=true&callback=initMap"
        async defer></script>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>

<div class=container>
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h1>INTERN</h1>
	    		<p>Erweitere unsere Doku!</p>
			</div>
		
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Doku!</h3>
			  </div>
			  <div class="panel-body">
			    <form action="c_writeToDoku.jsp" method="post">
				    <div class="col-md-12">
				    	<div class="row">
				    	    <div class="col-md-12 col-sm-12">
							<h3>Funktionsbezeichnung - <b>ohne ()!</b></h3>
							</div>
						    <div class="col-md-12 col-sm-12">
								<input type=text" name="formFunktionBezeichnung" style="width: 100%;" autocomplete="off"/>
							</div>
				    	</div>
				    
						<div class="row">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-md-6 col-sm-12">
						    	    <div class="col-md-6 col-sm-12">
										<p>ParameterBezeichnung</p>
									</div>
								    <div class="col-md-6 col-sm-12">
										<input type=text" name="formParameterBezeichnung" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    			<div class="col-md-6 col-sm-12">
						    	    <div class="col-md-6 col-sm-12">
										<p>ParameterTyp</p>
									</div>
								    <div class="col-md-6 col-sm-12">
										<input type=text" name="formParameterTyp" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    			<div class="col-md-12 col-sm-12">
						    	    <div class="col-md-12 col-sm-12">
										<p>ParameterBeschreibung</p>
									</div>
								    <div class="col-md-12 col-sm-12">
										<input type=text" name="formParameterBeschreibung" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row">
				    	    <div class="col-md-12 col-sm-12">
							<h3>Funktionsbeschreibung</h3>
							</div>
						    <div class="col-md-12 col-sm-12">
								<input type=text" name="formFunktionBeschreibung" style="width: 100%; height:75px;" autocomplete="off"/>
							</div>
				    	</div>
				    	<br/>
				    	<input type="submit" name="ok" value="senden" style="width:100%">
				    </div>
				    
			
			    </form>
			  </div>
			</div>
		
		
		</div>
	</div>
</div>
<%!
	String fBez;
	String fTyp;
	String fBesch;
	
	String pBez;
	String pTyp;
	String pBesch;
	
	int fuId;
%>


<%
	Facade f = new Facade();
	if (request.getParameter("ok") != null){
		try{
			String fBez = request.getParameter("formGepaeck");;
			String fTyp = "16Ente";
			String fBesch = "16duscht regelmäßig";
			
			f.newFunktion(fBez, fTyp, fBesch);
			// for schleife ab hier - für jeden Parameter
			pBez = "16duschen - 1";
			pTyp = "16Ente - 1";
			pBesch = "16duscht regelmäßig - 1";
			fuId = f.getAktuelleFunktionsID();
					
			Facade f2 = new Facade();
					
			f2.newParameter(pBez, pTyp, pBesch, fuId);
			
		}
		catch (Exception ex){
			out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
			out.print("möglicherweise keine IDs übergeben?");
		}
	}
%>

</body>
</html>