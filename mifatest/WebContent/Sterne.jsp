<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

        var checked = false;
        var wert;

        //Sterne

        function leuchten(a) {
        
        	if (checked == false)
        	{
        		for (var i = 1; i <= a; i++) {
	                document.getElementById(i).style.backgroundImage = "url('img/1.png')";
	            }
        		a++;
        		for (var i = a; i <= 5; i++) {
	                document.getElementById(i).style.backgroundImage = "url('img/2.png')";
        		}
        		a--;
        	}
        		
	           
        }

        function nichtLeuchten(a) {
            if (checked == false)
                document.getElementById(a).style.backgroundImage = "url('img/2.png')";

        }

        function setzen(a, b) {
            checked = true;
            
            
            for (var i = 1; i <= a; i++) {
                document.getElementById(i).style.backgroundImage = "url('img/1.png')";
            }
            
            a++;

            	for (var j = a; j <= 5; j++) {
	                document.getElementById(j).style.backgroundImage = "url('img/2.png')";
        		}
	           
            a--;
            
            wert = a;
            
            alert(wert);
        }

        function setzeChecked() {
            checked = false;
        }

        //

    </script>

    <style>
        body {
            /*    font-family: Arial,Helvetica,sans-serif; */
            font-family: 'Roboto Condensed', sans-serif;
            font-style: italic;
        }

        h2 {
            margin: 5px;
            padding: 9px;
        }

        table {
            text-align: center;
            margin: auto;
        }

        td.star {
            background-repeat: no-repeat;
            background-image: url('img/2.png');
            height: 61px;
            width: 61px;
        }

        .radios {
            margin: 15px;
        }

        #logo {
            width: 800px;
            margin: auto;
            text-align: left;
        }

        #adress {
            width: 800px;
            height: 50px;
            margin: auto;
            text-align: center;
        }

        .adressInner {
            text-align: left;
            margin-left: 10px;

            font-size: x-large;
            font-weight: bold;
            color: #353535;
        }

        #head {
            width: 800px;
            height: 50px;
            margin: auto;
            text-align: center;
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            background-color: #ee2e2e;
            color: #fff;
        }

        #main {
            width: 800px;
            margin: auto;
            margin-top: 30px;
            text-align: center;
            background-color: #D8D8D8;
            -webkit-box-shadow: 0px 0px 7px 2px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 0px 7px 2px rgba(0,0,0,0.75);
            box-shadow: 0px 0px 7px 2px rgba(0,0,0,0.75);
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">



        <div id="logo">
            <img src="logo.jpg" />
            <br />
            <br />
            <br />
        </div>

        <div id="adress">

        </div>

        <div id="head">
            <h2 style="text-align: left">
                Waren Sie mit uns zufrieden?
            </h2>
        </div>
        <div id="main">
            <br />
            <table>
                <tr>
                    <td style="text-align: left" colspan="5">Service *</td>
                </tr>
                <tr>
                    <td class="star" id="1" onclick="setzen('1','Enttaeuscht'); return false;" onmouseover="leuchten('1'); return false;" onmouseout="nichtLeuchten('1'); return false;"></td>
                    <td class="star" id="2" onclick="setzen('2','Unzufrieden'); return false;" onmouseover="leuchten('2'); return false;" onmouseout="nichtLeuchten('2'); return false;"></td>
                    <td class="star" id="3" onclick="setzen('3','Mittel'); return false;" onmouseover="leuchten('3'); return false;" onmouseout="nichtLeuchten('3'); return false;"></td>
                    <td class="star" id="4" onclick="setzen('4','Zufrieden'); return false;" onmouseover="leuchten('4'); return false;" onmouseout="nichtLeuchten('4'); return false;"></td>
                    <td class="star" id="5" onclick="setzen('5','Voll Zufrieden'); return false;" onmouseover="leuchten('5'); return false;" onmouseout="nichtLeuchten('5'); return false;"></td>
                </tr>
                <tr>
                    <td colspan="5" style="height: 50px"></td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5">Sonstiges</td>
                </tr>
                <tr>
                    <td colspan="5" style="height: 50px"></td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5">Würden Sie uns weiterempfehlen? *</td>
                </tr>
              </table>
            <br />
            <div id="inner">
                
            </div>
            <br />
            
            <br />
        </div>
    </form>
</body>
</html>