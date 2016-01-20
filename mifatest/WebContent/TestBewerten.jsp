<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!
		int iDempf=1;
		int iDsend=2;
		int iDfahrt=2;
	%>

	<a href="http://localhost:8080/mifatest/Bewerten.jsp?empfid=<%= iDempf %>&senderid=<%= iDsend %>&fahrtid=<%= iDfahrt %>">Gib Bewertung ab [SenderID = <%= iDsend %>], [EmpfaengerID = <%= iDempf %>], [FahrtID = <%= iDfahrt %>]</a>
</body>
</html>