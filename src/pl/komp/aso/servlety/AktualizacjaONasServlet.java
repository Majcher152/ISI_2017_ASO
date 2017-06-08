package pl.komp.aso.servlety;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.sterowniki.SterownikKsiegowego;

/**
 * Servlet implementation class AktualizacjaONasServlet
 */
@WebServlet("/AktualizacjaONasServlet")
public class AktualizacjaONasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AktualizacjaONasServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		SterownikKsiegowego sk = new SterownikKsiegowego();
		String tresc = request.getParameter("tresc");
		System.out.println(tresc);
		int blad = sk.aktualizujONas(tresc);
		
		String wyswietl = "";
		RequestDispatcher dispatcher;
		
		switch (blad) {
		case 0:
			wyswietl = "Zaktualizowano.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/aktualizujONas.jsp");
			dispatcher.forward(request, response);
			break;
		case -1:
			wyswietl = "Błąd aktualizacji treści.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/aktualizujONas.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
