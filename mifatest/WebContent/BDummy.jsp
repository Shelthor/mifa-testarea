<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script src="js/npm.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

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
        	//if(checked[0]==false)
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

		var hFeld = "hiddenField" + tabelleY
        
        document.getElementById(hfeld).value=a;

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

<input type="hidden" id="hiddenField1" name="hi1"/>
<input type="hidden" id="hiddenField2" name="hi2"/>
<input type="hidden" id="hiddenField3" name="hi3"/>

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
    	<table id="sterne1">
    		<tr>
				<td class="star" id="1" onclick="setzen('1', '1'); return false;" onmouseover="leuchten('1', '1'); return false;"></td>
                <td class="star" id="2" onclick="setzen('2', '1'); return false;" onmouseover="leuchten('2', '1'); return false;"></td>
                <td class="star" id="3" onclick="setzen('3', '1'); return false;" onmouseover="leuchten('3', '1'); return false;"></td>
                <td class="star" id="4" onclick="setzen('4', '1'); return false;" onmouseover="leuchten('4', '1'); return false;"></td>
                <td class="star" id="5" onclick="setzen('5', '1'); return false;" onmouseover="leuchten('5', '1'); return false;"></td>
            </tr>
    	</table>
    	
    	<table id="sterne2">
    		<tr>
				<td class="star" id="1" onclick="setzen('1', '2'); return false;" onmouseover="leuchten('1', '2'); return false;"></td>
                <td class="star" id="2" onclick="setzen('2', '2'); return false;" onmouseover="leuchten('2', '2'); return false;"></td>
                <td class="star" id="3" onclick="setzen('3', '2'); return false;" onmouseover="leuchten('3', '2'); return false;"></td>
                <td class="star" id="4" onclick="setzen('4', '2'); return false;" onmouseover="leuchten('4', '2'); return false;"></td>
                <td class="star" id="5" onclick="setzen('5', '2'); return false;" onmouseover="leuchten('5', '2'); return false;"></td>
            </tr>
    	</table>
    	
    	<table id="sterne3">
    		<tr>
				<td class="star" id="1" onclick="setzen('1', '3'); return false;" onmouseover="leuchten('1', '3'); return false;"></td>
                <td class="star" id="2" onclick="setzen('2', '3'); return false;" onmouseover="leuchten('2', '3'); return false;"></td>
                <td class="star" id="3" onclick="setzen('3', '3'); return false;" onmouseover="leuchten('3', '3'); return false;"></td>
                <td class="star" id="4" onclick="setzen('4', '3'); return false;" onmouseover="leuchten('4', '3'); return false;"></td>
                <td class="star" id="5" onclick="setzen('5', '3'); return false;" onmouseover="leuchten('5', '3'); return false;"></td>
            </tr>
    	</table>
    	
		<div id="sqlForm" class="grau">
				<form class="row" action="Bewerten.jsp" method="post">
					<div class="col-sm-4">
						Fahrstil?:
						<input type="text" name="formfahrstil" />
					</div>
					<div class="col-sm-4">
						Pünktlichkeit?:
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

	int empfurl;
	int sendurl;
	int fahrturl;
	
	int kontrolle = 0;
	
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
	
	empf = f.getUserById(empfurl);
	send = f.getUserById(sendurl);
	fahrtid = f.getFahrtById(fahrturl);

	if (request.getParameter("ok") != null){
		
			try
			{
				heute = new java.util.Date();
				text = request.getParameter("formKommentar");
				fahrs = Integer.parseInt(request.getParameter("hi2"));
				freundli = Integer.parseInt(request.getParameter("hi3"));;
				punkt = Integer.parseInt(request.getParameter("hi3"));;
				
				//fahrtid = f.getFahrtById(1);
				
				//empf = f.getUserById(1);// nur zu testzwecken, später dann->  f.getUserById(request.getParameter("empfid"))
				//send = f.getUserById(2);// nur zu testzwecken, später dann->  f.getUserById(request.getParameter("senderid"))
				
				
				
				// VERGLEICHE AUCH DEN LINK
				// http://stackoverflow.com/questions/1890438/how-to-get-parameters-from-the-url-with-jsp
				
				f.newBewertung(text, fahrs, punkt, freundli, empf, send, heute, fahrtid);
				
			    out.print("<script>sendSQL();</script>");
			    out.print("<script>suc();</script>");
			    
			    kontrolle = 1;
			    
			}
			catch (Exception ex)
			{
				out.print("<script>fail();</script>" + "Fehler: " + ex.toString());
				out.print("möglicherweise keine IDs übergeben?");
			}
		}
%>

</body>
</html>