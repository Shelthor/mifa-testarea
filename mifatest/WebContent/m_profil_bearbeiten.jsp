<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Profil baerbeiten</title>
<style>
         a:link {color:white}
         a:visited{color:white}
         a:hover{color:white}
         a:active{color:white}

         #header
         {
            background-color: #CDDC39;
            color: white;
            text-align: center;
            font-family: verdana;
            padding: 5px;
        }

        #tools
        {
            line-height: 30px;
            
            height: 300px;
            width: 100px;
            float: left;
            padding: 5px; 
            font-family: verdana;
            color: black; 
            font-size: 100%;
        }

        #footer
        {
            background-color: #CDDC39;
            color:white;
            clear: both;
            text-align: center;
            padding: 5px;
            font-family: verdana;
            font-size: 75%;
        }

        #section
        {
            width: 330px;
            float: left;
            padding: 10;
            font-family: verdana;
           font-size: 100%;
        }

        table
        {
            font-family: verdana;
            border-color: white;
        }

</style>



</head>
<body text="#FFFFFF" bgcolor="FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">
     <div id="header"><h1 align="center">Bearbeite dein Profil</h1></div>

     <div id="tools" align="center">
        <table align="center" bgcolor="#CDDC39" border="2px">
            <tr>
                <td><section><a href="m_profil_bearbeiten_profil.jsp" >Profil</a></section></td>
            </tr>
            <tr>
                <td><section><a href="m_fahrzeug_landingpage.jsp" >Fahrzeug</a></section></td>
            </tr>
            <tr>
                <td><section><a href="m_passwort_aendern.jsp" >Passwort</a></section></td>
            </tr>
        </table>
    </div>

<div id="footer">
    <a href="c_User.jsp">zurück</a>
    <a href="c_User.jsp">Startseite</a>
    <a href="#">Hilfe</a>
</div>



</body>
</html>