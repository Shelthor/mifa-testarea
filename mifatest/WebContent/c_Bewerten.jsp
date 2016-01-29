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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/custom.js"></script>
<style>
td.star {
            background-repeat: no-repeat;
            background-image: url('img/2.png');
            height: 61px;
            width: 61px;
        }

</style>
</head>
<body>

<script type="text/javascript">

        checked = new Array(false,false,false);
        
        var wert;

        //Sterne

        function leuchten(a, tabelleX) {
        	var posi = "sterne"+tabelleX;
        	var table = document.getElementById(posi);
        	var tds = table.getElementsByTagName("td");
        	
        	
        	if(checked[tabelleX-1]==false)
        	{
        		for (var i = 0; i < tds.length; i++) {
    	            if(i < a)
    		           	{
    		     	     	  tds[i].style.backgroundImage = "url('img/1.png')";
    		            }
    	            else
    		            {
    		                 tds[i].style.backgroundImage = "url('img/2.png')";
    		            }
    	            } 
        	}
	        	
        }

        function setzen(a, tabelleY) {
        	
        checked[tabelleY-1] = false;

		leuchten(a, tabelleY);
		checked[tabelleY-1] = true;

		var hFeld = "hiddenField" + tabelleY;
        
        document.getElementById(hFeld).value=a;       
        }
</script>

<%

if(kontrolle == 0){
	try{
		empfurl = Integer.parseInt(request.getParameter("empfid"));
		sendurl = Integer.parseInt(request.getParameter("senderid"));
		fahrturl = Integer.parseInt(request.getParameter("fahrtid"));
		
	}

	catch (Exception ex) {
		
	}
}
%>

<div class="container">

	<nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="c_index.jsp"><img src="img/logo_ba_dresden.png" style="height:100%;"/></a>
		    </div>
			    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		    
		    <ul class="nav navbar-nav navbar-right">
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hallo [USERNAME / BILD]!<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Mein �ffentliches Profil</a></li>
		            <li><a href="#">Terminal</a></li>
		          </ul>
		        </li>
	      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>


  <div class="jumbotron">
    <h1>Hi</h1>
    <p>Gib eine Bewertung ab!</p> 
  </div>
  <div class="row">

    <div id="whole" class="col-md-12">
		<div id="sqlForm" class="grau">
			<p>Bitte bewerte die P�nktlichkeit (nicht erschienen = 1 Stern)</p>
			<table class="text-center" id="sterne1">
	    		<tr>
					<td class="star" id="1" onclick="setzen('1', '1'); return false;" onmouseover="leuchten('1', '1'); return false;"></td>
	                <td class="star" id="2" onclick="setzen('2', '1'); return false;" onmouseover="leuchten('2', '1'); return false;"></td>
	                <td class="star" id="3" onclick="setzen('3', '1'); return false;" onmouseover="leuchten('3', '1'); return false;"></td>
	                <td class="star" id="4" onclick="setzen('4', '1'); return false;" onmouseover="leuchten('4', '1'); return false;"></td>
	                <td class="star" id="5" onclick="setzen('5', '1'); return false;" onmouseover="leuchten('5', '1'); return false;"></td>
	            </tr>
	    	</table>
	    	<div id="fahrstil">
	    		<p>Bitte bewerte den Fahrstil</p>
		    	<table class="text-center" id="sterne2">
		    		<tr>
						<td class="star" id="1" onclick="setzen('1', '2'); return false;" onmouseover="leuchten('1', '2'); return false;"></td>
		                <td class="star" id="2" onclick="setzen('2', '2'); return false;" onmouseover="leuchten('2', '2'); return false;"></td>
		                <td class="star" id="3" onclick="setzen('3', '2'); return false;" onmouseover="leuchten('3', '2'); return false;"></td>
		                <td class="star" id="4" onclick="setzen('4', '2'); return false;" onmouseover="leuchten('4', '2'); return false;"></td>
		                <td class="star" id="5" onclick="setzen('5', '2'); return false;" onmouseover="leuchten('5', '2'); return false;"></td>
		            </tr>
		    	</table>
	    	</div>
	    	<p>Bitte bewerte die Freundlichkeit</p>
	    	<table class="text-center" id="sterne3">
	    		<tr>
					<td class="star" id="1" onclick="setzen('1', '3'); return false;" onmouseover="leuchten('1', '3'); return false;"></td>
	                <td class="star" id="2" onclick="setzen('2', '3'); return false;" onmouseover="leuchten('2', '3'); return false;"></td>
	                <td class="star" id="3" onclick="setzen('3', '3'); return false;" onmouseover="leuchten('3', '3'); return false;"></td>
	                <td class="star" id="4" onclick="setzen('4', '3'); return false;" onmouseover="leuchten('4', '3'); return false;"></td>
	                <td class="star" id="5" onclick="setzen('5', '3'); return false;" onmouseover="leuchten('5', '3'); return false;"></td>
	            </tr>
	    	</table>
			<br />
				<form class="row" action="c_Bewerten.jsp" method="post">
					<br/>
					<br/>
					<div class="col-sm-12">
						Kommentar?: 
						<br/>
						<br/>
						<input type="text" name="formKommentar" style="width: 100%; height: 75px;" autocomplete="off"/>
						<br/>
						<br/>
						<input id="knopf" style="width: 100%;" type="submit" name="ok" value="OK"/>
					</div>
					
					<input type="hidden" id="hiddenField1" name="hi1" />
					<input type="hidden" id="hiddenField2" name="hi2" />
					<input type="hidden" id="hiddenField3" name="hi3" />
				</form>
		</div>
		<br/>
	</div>
	<div id="sendSuccess" style="display:none">
		<p>SUCCESS</p>
	</div>
	<div id="sendFail" style="display:none">
		<p>FAIL</p>
	</div>
  </div>
</div>

<%! 
	Fahrt fahrtid;
	String text;
	int fahrs, freundli, punkt;
	User empf, send;
	Date heute;

	int empfurl;
	int sendurl;
	int fahrturl;
	
	int kontrolle = 0;
	
	String status;
%>

<% 
	Facade f = new Facade();
	
	empf = f.getUserById(empfurl);
	send = f.getUserById(sendurl);
	fahrtid = f.getFahrtById(fahrturl);
	
	out.print(f.getFahrerByFahrtId(fahrturl).getUserID());
	
	//pr�fen ob bewertung an Fahrer oder Passagier geht
			if(f.getFahrerByFahrtId(fahrturl).getUserID() == empfurl)
			{
				//out.print(fCheck.getFahrerByFahrtId(fahrturl).getnName() + "IST FAHRER");
				out.print("<script>document.getElementById('fahrstil').style.display = 'block'</script>");
			}
			else{
				out.print("<script>document.getElementById('fahrstil').style.display = 'none'</script>");
			}
	
	//absenden
	if (request.getParameter("ok") != null){
		
			try
			{
				heute = new java.util.Date();
				text = request.getParameter("formKommentar");
				
				if(request.getParameter("hi2") != ""){
					fahrs = Integer.parseInt(request.getParameter("hi2"));
				}
				punkt = Integer.parseInt(request.getParameter("hi1"));
				freundli = Integer.parseInt(request.getParameter("hi3"));
				
				f.newBewertung(text, fahrs, punkt, freundli, empf, send, heute, fahrtid);
				
			    out.print("<script>sendSQL();</script>");
			    out.print("<script>suc();</script>");
			    
			    kontrolle = 1;
			    
			}
			catch (Exception ex)
			{
				out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
				out.print("m�glicherweise keine IDs �bergeben?");
			}
		}
%>

</body>
</html>