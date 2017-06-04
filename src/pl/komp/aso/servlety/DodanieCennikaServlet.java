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
 * Servlet implementation class DodanieCennikaServlet
 */
@WebServlet("/DodanieCennikaServlet")
public class DodanieCennikaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DodanieCennikaServlet() {
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
		String cena = request.getParameter("cena");
		String nazwa = request.getParameter("nazwa");
		
		int blad = sk.dodajCennik(nazwa, cena);
		
		String wyswietl = "";
		RequestDispatcher dispatcher;
		
		switch (blad) {
		case 0:
			wyswietl = "Dodano do cennika.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/aktualizujCennikPodstawowy.jsp");
			dispatcher.forward(request, response);
			break;
		case -1:
			wyswietl = "Błąd dodawania do cennika.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/cennikDodaj.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
