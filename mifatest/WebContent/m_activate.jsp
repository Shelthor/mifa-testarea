  
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mifatest.entities.*" %>
<%@ page import="com.mifatest.executers.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Activation</title>
</head>
<body>

<%

int userId = Integer.parseInt(request.getParameter("userid"));

try{
	Facade f = new Facade();
	User u = f.getUserById(userId);

	u.setIsActivated("true");
	f.updateUser(u);

}catch (Exception ex){
	out.print(ex);
}

%>


	<h1>Willkommen!</h1>
	<a href="m_index.jsp">du bist aktiviert und kannst dich ab sofort einloggen</a>



</body>
</html>