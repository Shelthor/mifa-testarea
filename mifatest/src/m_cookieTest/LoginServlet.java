package m_cookieTest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Implementierung des Servlets

@WebServlet("LoginServlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID=1L;
	private final String userID="Test";
	private final String password="123";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//Parameter erhalten
		String user = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		if(userID.equals(user) && password.equals(pwd))
		{
			Cookie loginCookie = new Cookie("user", user);
			//Cookie auf Lebensdauer von 30 min setzen
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
			//Verweist auf folgende *.jsp
			//wird dort verwendet, um die Session zu tracken bis zum Timeout nach 30 min
			response.sendRedirect("LoginSuccess.jsp");
		}
		else
		{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/NewIndex.html");
			PrintWriter output = response.getWriter();
			output.println("<font color=red>Benutzername oder Passwort ist falsch</font>");
			rd.include(request, response);
		}
	}
}