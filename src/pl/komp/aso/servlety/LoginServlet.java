package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.sterowniki.SterownikPolBD;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = -339229991748289212L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String login = request.getParameter("login");
		String haslo = request.getParameter("haslo");
		
		SterownikPolBD spbd = new SterownikPolBD();
		int odp = spbd.zaloguj(login, haslo);
		
		if(odp == 1) {
			out.write("zalogowano");
			request.getSession().setAttribute("user", login);
		} else {
			out.write("zla nazwa uzytkownika lub haslo!");
		}
		
	}

}
