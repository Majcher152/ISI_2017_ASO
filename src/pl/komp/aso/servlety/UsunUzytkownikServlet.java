package pl.komp.aso.servlety;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikRejestracji;

/**
 * Servlet implementation class UsunUzytkownikServlet
 */
@WebServlet("/UsunUzytkownikPath")
public class UsunUzytkownikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsunUzytkownikServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		SterownikKlienta sk = new SterownikKlienta();
		Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
		SterownikRejestracji sr = new SterownikRejestracji();
		String login = uzytkownik.getLogin();
		int blad = sk.uwierzytelnijUsuwanie(login);
		String wyswietl = "";
		RequestDispatcher dispatcher;
		switch (blad) {
		case -1:
			wyswietl = "Użytkownik nie istnieje.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/usunKontoKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 0:
			if (sk.usunUzytkownika(login))
				wyswietl = "Usunięto pomyślnie.";
			else
				wyswietl = "Błąd";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			break;
	
		}
	}
}
