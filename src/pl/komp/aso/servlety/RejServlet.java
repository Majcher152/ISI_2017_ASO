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
 * Servlet implementation class RejServlet
 */
@WebServlet("/rej")
public class RejServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		SterownikPolBD spbd = new SterownikPolBD();
		int odp = spbd.zarejestruj(request.getParameter("login"), request.getParameter("haslo"), request.getParameter("imie"), request.getParameter("nazwisko"), request.getParameter("email"), Integer.parseInt(request.getParameter("telefon")));
		
		if(odp==1) out.println("zarejestrowano");
		else out.println("podany login jest ju¿ zajêty!");
	}

}
