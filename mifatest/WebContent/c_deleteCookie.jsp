<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	try{
		 Cookie killMyCookie = new Cookie("c_userId", null);
	     killMyCookie.setMaxAge(0);
	     response.addCookie(killMyCookie);
	     
	     out.print("Du hast dich abgemeldet und dein Cookie Wurde gelöscht");
	     
	}catch(Exception ex){
		out.print(ex);
	}
     
%>

<a href="c_index.jsp">Zur Startseite</a>

</body>
</html>