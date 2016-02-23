<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>MifaTest</title>
<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="js/npm.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
</head>
<body>

<%

/// hier noch nachbessern

	/*
		Hole userId aus Cookie heraus
	*/

	Cookie[] cookies = request.getCookies();

	int userIdAusCookie = 0;
	
	if( cookies != null)
	{
		 for (int i = 0; i < cookies.length; i++){
			 if(cookies[i].getName().equals("c_userId")){
				 userIdAusCookie = Integer.parseInt(cookies[i].getValue());
			 }
		 }
	}
%>

<div class="container">
	<div class="jumbotron">
		<h1>Registriere dich!</h1>
		<h3>Um unsere Plattform zu nutzen</h3>
 	</div>
 	<div class="row">
	 	<div id="whole">
			<div class="col-md-4 col-xs-12">
	
		 	</div>
	 	<div class="panel panel-default col-md-4 col-xs-12">
				<div class="panel-body">
				    <form action="m_registrieren.jsp" method="post">
		  		
		  		<h4>Vorname</h4>	
		  		<input type="text" name="vorname" size="33" required/><br/>
		  		
				<h4>Nachname</h4>		
		  		<input type="text" name="nachname" size="33" required/><br/>

				<h4>Geburtsdatum</h4>
				<label align="top">Tag</label>
				<select name="Tag">
				     <option>01</option>
				     <option>02</option>
				     <option>03</option>
				     <option>04</option>
				     <option>05</option>
				     <option>06</option>
				     <option>07</option>
				     <option>08</option>
				     <option>09</option>
				     <option>10</option>
				     <option>11</option>
				     <option>12</option>
				     <option>13</option>
				     <option>14</option>
				     <option>15</option>
				     <option>16</option>
				     <option>17</option>
				     <option>18</option>
				     <option>19</option>
				     <option>20</option>
				     <option>21</option>
				     <option>22</option>
				     <option>23</option>
				     <option>24</option>
				     <option>25</option>
				     <option>26</option>
				     <option>27</option>
				     <option>28</option>
				     <option>29</option>
				     <option>30</option>
				     <option>31</option>
				</select> 
				        
				<label align="top">Monat</label>
					<select name="Monat">
					     <option>01</option>
					     <option>02</option>
					     <option>03</option>
					     <option>04</option>
					     <option>05</option>
					     <option>06</option>
					     <option>07</option>
					     <option>08</option>
					     <option>09</option>
					     <option>10</option>
					     <option>11</option>
					     <option>12</option>
					</select>
			
			  <label align="top">Jahr</label>
					<select name="Jahr">
						<option>1960</option>
						<option>1961</option>
						<option>1962</option>
						<option>1963</option>
						<option>1964</option>
						<option>1965</option>
						<option>1966</option>
						<option>1967</option>
						<option>1968</option>
						<option>1969</option>
						<option>1970</option>
						<option>1971</option>
						<option>1972</option>
						<option>1973</option>
						<option>1974</option>
						<option>1975</option>
						<option>1976</option>
						<option>1977</option>
						<option>1978</option>
						<option>1979</option>
						<option>1980</option>
						<option>1981</option>
						<option>1982</option>
						<option>1983</option>
						<option>1984</option>
						<option>1985</option>
						<option>1986</option>
						<option>1987</option>
						<option>1988</option>
						<option>1989</option>
						<option>1990</option>
						<option>1991</option>
						<option>1992</option>
						<option>1993</option>
						<option>1994</option>
						<option>1995</option>
						<option>1996</option>
						<option>1997</option>
						<option>1998</option>
						<option>1999</option>
						<option>2000</option>
					</select>

				<h4>E-Mail</h4>
				<input type="text" name="email" size="33" required/><br/>
				
				<h4>Telefonnummer</h4>
				<input type="text" name="telefon" size="33" required/><br/>
				
				<h4>Kennwort</h4>
				<input type="password" name="password1" size="33" required/><br/>
		 
		 
				<h4>Kennwort best&auml;tigen</h4>
				<input type="password" name="password2" size="33" required/><br/>
				
				<input type="submit" name="register" value="registrieren"/><br/>
		</form>
				 </div>
		</div>
		
		<div class="col-md-4 col-xs-12">

	 	</div>
	 	</div>
	 	<div id="sendSuccess" style="display:none">
			<div class='alert alert-success text-center' role='alert'>
				<h1>erfolgreich registriert!</h1>
			</div>
			<div class="col-md-12">
				<p>Bitte aktiviere nun dein Benutzerkonto um dich einzuloggen. Wir haben dir dazu eine Mail geschickt</p>
			</div>		
		</div>
 	</div>

</div>



		 	
		  	
		  		


<%

	
if(request.getParameter("register")!= null)
{
	String vorname = request.getParameter("vorname");
	String nachname = request.getParameter("nachname");
	String day = request.getParameter("Tag");
	String month = request.getParameter("Monat");
	String year = request.getParameter("Jahr");
	String emailR = request.getParameter("email");
	String telefon = request.getParameter("telefon");
	String password =request.getParameter("password1");
	String passwordB =request.getParameter("password2");
	
	Boolean formRegister=false;
	//Date d = new Date(YearInt-1900,DayInt-1,month); 
	int YearInt = Integer.parseInt(year);
	int DayInt = Integer.parseInt(day);
	int MonthInt = Integer.parseInt(month);
	Date d = new Date(YearInt-1900,DayInt-1,MonthInt);                  
    ////////////////		
	Facade fUser = new Facade();
	/*
		suche mir erst den user (userID) wo user.email = eingegebene.email
		diese userid dann in die Funktion fUser.newPasswort
	*/
	
/////////////////////////////////////////////////////////////////////////////////////////					
	if(telefon.matches("[0-9]+"))
	{
		//lieber über javaScript lösen (siehe c_FahrtAnbieten.jsp)
	}
	else
	{
		out.print("Bitte Telefonnummer korrekt eingeben!");
		formRegister=false;	
	}
				
	if (password.equals(passwordB))
	{
		formRegister=true; //lieber über javaScript lösen (siehe c_FahrtAnbieten.jsp)
	}
	else
	{
		out.print("Die Kennwörter stimmen nicht überein!");
		formRegister=false;
	}
	
	if(formRegister==false)
	{
		out.print("Registrierung fehlgeschlagen.");
	}
	
	//Fehler bis hier her abfangen
	//////////////////////////////////////////////////////////////
	//Wenn keine Fehler auftreten, Daten in DB
	
	else
	{
	try
		{
			//HASH
			Encryptor en = new Encryptor();
			String hash = en.inc(password);
			//
		
			fUser.newUser(emailR, d, nachname, vorname, telefon, hash);
			
			out.print("<script>sendSQL();</script>");
			out.print("<script>suc();</script>");
		}
	catch(Exception e)
		{
			out.print(e);
		}
	}
}


%>


</body>
</html>