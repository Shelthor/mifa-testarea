    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.mifatest.entities.*" %>
	<%@ page import="com.mifatest.executers.*" %>
      
    <%  
    String s=request.getParameter("val");  
    if(s==null || s.trim().equals("")){  
    out.print("Please enter id");  
    }
    else{  
    
	    try{  
	  		Facade h = new Facade();
	  		List<Ort> duschen = new ArrayList();
	  		
	  		duschen = h.getListLike(s);
	  		for(int z = 0; z < duschen.size(); z++)
	  		out.print(duschen.get(z).getOrtBezeichnung() + "<br/>");
	    }  
	     
	    catch(Exception e) {
	    	out.print(e);
	    }
    }  
    %>  