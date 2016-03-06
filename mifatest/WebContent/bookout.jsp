<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mifatest.entities.*" %>
	<%@ page import="com.mifatest.executers.*" %>
	<%@ page import="java.util.*" %>

<%
	int fahrtId = 0;
	int relId = 0;
	String uStart = new String();
	String uZiel = new String();
	
	try{
		fahrtId = Integer.parseInt(request.getParameter("fahrtid"));
		relId = Integer.parseInt(request.getParameter("del"));
		uStart = request.getParameter("start");
		uZiel = request.getParameter("ziel");
		
		//Platz freigeben
		Buchen goOut = new Buchen();
		goOut.passengerBooksHimselfOut(fahrtId, uStart, uZiel);
		
		//passagier_fahrt-relation löschen
		Facade f= new Facade();
		f.deletePassagierFahrt(relId);
		
		//redirect ins terminal
				//SeitenPfad
				String domain = "http" + "://" +   
			   		request.getServerName() +       // "myhost"
			  		":" + request.getServerPort() + // ":" + "8080"
			    	"/mifatest";
				
				
				//String url = ((HttpServletRequest)request).getRequestURL().toString();
				String loginPage= domain + "/c_User.jsp";
				
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", loginPage);
		
		
	}catch(Exception ex){
		out.print(ex);
	}

	
%>