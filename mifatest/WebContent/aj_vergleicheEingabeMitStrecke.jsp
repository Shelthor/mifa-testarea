    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.mifatest.entities.*" %>
	<%@ page import="com.mifatest.executers.*" %>
      
    <%  
   	int fahrtId = Integer.parseInt(request.getParameter("val"));
	    try{  
	  		Facade h = new Facade();
	  		Fahrt f = new Fahrt();
	  		
	  		String leer = "null";
	  		
	  		f = h.getFahrtById(fahrtId);

	  		if(f.getS1() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS1() + "</li>"); 
	  		
	  		if(f.getS2() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS2() + "</li>");
	  			
	  		if(f.getS3() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS3() + "</li>");
	  		
	  		if(f.getS4() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS4() + "</li>");
	  	
	  		if(f.getS5() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS5() + "</li>");
	  		
	  		if(f.getS6() != null)
	  			out.print("<li onclick='changeFormValue(this);aktualisiereMap()' class='list-group-item'>" + f.getS6() + "</li>");
	 
	    }  
	     
	    catch(Exception e) {
	    	out.print(e);
	    }
    %>  