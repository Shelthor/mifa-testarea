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

<script>

	var zwischenStZaehler = 2;

	function zeigen(){
		//document.getElementById('s2-s5').show();
		//$("#paraBox").slideDown();
			
		if(zwischenStZaehler < 11){
			$("#para"+zwischenStZaehler).slideDown();
			
			if(zwischenStZaehler == 10){
				$('#zeigePara').slideUp();
			}
			
			zwischenStZaehler++;
		}
	}
	
</script>

<div class=container>
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h1>Erweitere unsere Doku!</h1>
				<p><a href="c_doku.jsp">Zur Doku</a></p>
			</div>
		
			<div class="panel panel-default" id="whole">
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
							<h3>Funktionstyp</b></h3>
							</div>
						    <div class="col-md-6 col-sm-12">
						    	<h4>Primitiv + String</h4>
								<select name="formFunktionTypJava" style="width:100%">
										<option value="">bitte wählen Sie..</option>
									    <option value="boolean">boolean</option>
									    <option value="double">double</option>								    
									    <option value="float">float</option>
									    <option value="int">int</option>
									    <option value="String">String</option>
									    <option value="void">void</option>
								</select>
							</div>
							<div class="col-md-6 col-sm-12">
								<h4>Entitäten</h4>
								<select name="formFunktionTypEntity" style="width:100%">
										<option value="">bitte wählen Sie..</option>
									    <option value="Bewertung">Bewertung</option>
									    <option value="Fahrt">Fahrt</option>
									    <option value="Fahrzeug">Fahrzeug</option>
									    <option value="Funktion">Funktion</option>
									    <option value="Nachricht">Nachricht</option>
									    <option value="Ort">Ort</option>
									    <option value="Parameter">Parameter</option>
									    <option value="PassagierFahrt">PassagierFahrt</option>
									    <option value="Passwort">Passwort</option>
									    <option value="User">User</option>
									    <option value="UserFahrzeug">UserFahrzeug</option>
								</select>
							</div>
							<div class="col-sm-12">
								<h4>
									<input type="checkbox" name="formFunktionTypListe"/> Liste?
								</h4>
							</div>
				    	</div>
				    	
						<div class="row" id="para1">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung1" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava1" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity1" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung1" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para2" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung2" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava2" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity2" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung2" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para3" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung3" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava3" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity3" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung3" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para4" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung4" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava4" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity4" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung4" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para5" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung5" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava5" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity5" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung5" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para6" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung6" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava6" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity6" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung6" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para7" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung7" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava7" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity7" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung7" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para8" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung8" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava8" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity8" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung8" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para9" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung9" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava9" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity9" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung9" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<div class="row" id="para10" style="display: none;">
				    	    <div class="col-md-12 col-sm-12">
								<h3>Parameter</h3>
							</div>
							    <div class="col-sm-12">
						    	    <div class="col-md-3 col-sm-12">
										<p><b>ParameterBezeichnung</b></p>
									</div>
								    <div class="col-md-3 col-sm-12">
										<input type=text" name="formParameterBezeichnung10" style="width: 100%;" autocomplete="off"/>
									</div>
									<div class="col-sm-6">
									
									</div>
				    			</div>
				    			<div class="col-sm-12 hellgrau randObenRund randUntenRund">
									<div class="col-sm-12">
										<p><b>ParameterTyp</b></p>
									</div>
									<div class="col-md-6 col-sm-12">
								    	<p>Primitiv + String</p>
										<select name="formParameterTypJava10" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="boolean">boolean</option>
											    <option value="double">double</option>								    
											    <option value="float">float</option>
											    <option value="int">int</option>
											    <option value="String">String</option>
										</select>
									</div>
									<div class="col-md-6 col-sm-12">
										<p>Entitäten</p>
										<select name="formParameterTypEntity10" style="width:100%">
												<option value="">bitte wählen Sie..</option>
											    <option value="Bewertung">Bewertung</option>
											    <option value="Fahrt">Fahrt</option>
											    <option value="Fahrzeug">Fahrzeug</option>
											    <option value="Funktion">Funktion</option>
											    <option value="Nachricht">Nachricht</option>
											    <option value="Ort">Ort</option>
											    <option value="Parameter">Parameter</option>
											    <option value="PassagierFahrt">PassagierFahrt</option>
											    <option value="Passwort">Passwort</option>
											    <option value="User">User</option>
											    <option value="UserFahrzeug">UserFahrzeug</option>
										</select>
									</div>
								</div>
				    			<div class="col-sm-12 abstandNachOben">
						    	    <div class="col-sm-12">
										<p><b>ParameterBeschreibung</b></p>
									</div>
								    <div class="col-sm-12">
										<input type=text" name="formParameterBeschreibung10" style="width: 100%;" autocomplete="off"/>
									</div>
				    			</div>
				    	</div>
				    	
				    	<input id="zeigePara" class="abstandNachOben" type="button" style="width: 100%;" onclick="zeigen()" value="füge Parameter hinzu"/>
				    	
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
			<div id="sendSuccess" style="display:none">
				<div class='alert alert-success text-center' role='alert'>
					<h1>Funktion erfolgreich angelegt!</h1>
				</div>
				<p><a href="c_writeToDoku.jsp">Füge eine weitere Funktion hinzu</a></p>
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
			
			List<String> pBezList = new ArrayList<String>();
			List<String> pBeschList = new ArrayList<String>();
			List<String> pTypList = new ArrayList<String>();

			
			for(int i = 1; i < 11;i++){
				if(request.getParameter("formParameterBezeichnung"+i) == ""){
					//für jedes feld wo nichts eingetragen worden ist, tu nichts
				}else{
					//wenn jedoch etwas eingetragen worden ist, addiere ein Element zur Liste mit dem eingetragenen Wert
					pBezList.add(request.getParameter("formParameterBezeichnung"+i));
				}
				
				if(request.getParameter("formParameterBeschreibung"+i) == ""){
					//für jedes feld wo nichts eingetragen worden ist, tu nichts
				}else{
					//wenn jedoch etwas eingetragen worden ist, addiere ein Element zur Liste mit dem eingetragenen Wert
					pBeschList.add(request.getParameter("formParameterBeschreibung"+i));
				}
				
				if(request.getParameter("formParameterTypJava"+i) == ""){
					//für jedes feld wo nichts eingetragen worden ist, tu nichts
				}else{
					//wenn jedoch etwas eingetragen worden ist, addiere ein Element zur Liste mit dem eingetragenen Wert
					pTypList.add(request.getParameter("formParameterTypJava"+i));
				}
				
				if(request.getParameter("formParameterTypEntity"+i) == ""){
					//für jedes feld wo nichts eingetragen worden ist, tu nichts
				}else{
					//wenn jedoch etwas eingetragen worden ist, addiere ein Element zur Liste mit dem eingetragenen Wert
					pTypList.add(request.getParameter("formParameterTypEntity"+i));
				}
				
			}
			
			
			////////////
			String fBez = request.getParameter("formFunktionBezeichnung");
			String fTyp;
			
			String tJava = request.getParameter("formFunktionTypJava");
			String tEntity = request.getParameter("formFunktionTypEntity");
							
			
			if(tJava.equals("")){
				fTyp = request.getParameter("formFunktionTypEntity");
			}
			else{
				fTyp = request.getParameter("formFunktionTypJava");
			}
			
			if(request.getParameter("formFunktionTypListe")==null){

			}
			else{
				fTyp = "List&lt;" + fTyp + "&gt;";
			}	

			
			String fBesch = request.getParameter("formFunktionBeschreibung");
			
			f.newFunktion(fBez, fTyp, fBesch);
			// for schleife ab hier - für jeden Parameter
			
			Facade f2 = new Facade();
			/*
			pBez = pBezList.get(3);
			pTyp = pTypList.get(3);
			pBesch = pBeschList.get(3);
			fuId = f.getAktuelleFunktionsID();
					
			f2 = new Facade();
					
			f2.newParameter(pBez, pTyp, pBesch, fuId);
			*/
					
			for(int i = 0; i < pBezList.size();i++){
			
			pBez = pBezList.get(i);
			pTyp = pTypList.get(i);
			pBesch = pBeschList.get(i);
			fuId = f.getAktuelleFunktionsID();
					
			f2 = new Facade();
					
			f2.newParameter(pBez, pTyp, pBesch, fuId);
			}
					
			out.print("<script>sendSQL();</script>");
			out.print("<script>suc();</script>");
		}
		catch (Exception ex){
			out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
		}
	}
%>

</body>
</html>