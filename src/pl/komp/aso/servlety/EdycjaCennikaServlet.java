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
 * Servlet implementation class EdycjaCennikaServlet
 */
@WebServlet("/EdycjaCennikaServlet")
public class EdycjaCennikaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EdycjaCennikaServlet() {
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
		String id = request.getParameter("id");
		String cena = request.getParameter("cena");
		String nazwa = request.getParameter("nazwa");
		
		int blad = sk.edytujCennik(id, nazwa, cena);
		
		String wyswietl = "";
		RequestDispatcher dispatcher;
		
		switch (blad) {
		case 0:
			wyswietl = "Zedytowano cennik.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/aktualizujCennikPodstawowy.jsp");
			dispatcher.forward(request, response);
			break;
		case -1:
			wyswietl = "Błąd edycji cennika.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/cennikEdytuj.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
