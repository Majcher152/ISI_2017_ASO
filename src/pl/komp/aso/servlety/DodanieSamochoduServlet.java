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
 * Servlet implementation class DodanieSamochoduServlet
 */
@WebServlet("/DodanieSamochoduServlet")
public class DodanieSamochoduServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DodanieSamochoduServlet() {
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
		String model = request.getParameter("model");
		String rocznik = request.getParameter("rocznik");
		String typ = request.getParameter("typ");
		String silnik = request.getParameter("silnik");
		
		int blad = sk.dodajSamochod(model, rocznik, typ, silnik);
		
		String wyswietl = "";
		RequestDispatcher dispatcher;
		
		switch (blad) {
		case 0:
			wyswietl = "Dodano samochód.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/dodajSamochod.jsp");
			dispatcher.forward(request, response);
			break;
		case -1:
			wyswietl = "Błąd dodawania samochodu.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/dodajSamochod.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
