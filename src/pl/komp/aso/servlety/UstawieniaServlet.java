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
 * Servlet implementation class UstawieniaServlet
 */
@WebServlet("/UstawieniaServlet")
public class UstawieniaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UstawieniaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		SterownikKlienta sk = new SterownikKlienta();
		Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
		SterownikRejestracji sr = new SterownikRejestracji();
		String imie = request.getParameter("imie");
		String nazwisko = request.getParameter("nazwisko");
		String login = uzytkownik.getLogin();
		String numer_telefonu = request.getParameter("numer_telefonu");
		String email = request.getParameter("email");
		int blad = sk.uwierzytelnij(imie, nazwisko, email, numer_telefonu, login);
		String wyswietl = "";
		RequestDispatcher dispatcher;
		switch (blad) {
		case 17:
			wyswietl = "Błędny adres email.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 0:
			if (sk.edytujDane(imie, nazwisko, email, numer_telefonu,uzytkownik))
				wyswietl = "Zmieniono ustawienia pomyślnie.";
			else
				wyswietl = "Błąd";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 18:
			wyswietl = "Podaj imię.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 1:
			wyswietl = "Imię może zawierać tylko litery.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;

		case 19:
			wyswietl = "Podaj nazwisko.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 2:
			wyswietl = "Nazwisko może zawierać tylko litery.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 3:
			wyswietl = "Numer telefonu może zawierać tylko cyfry.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 5:
			wyswietl = "Imię może zawierać maksymalnie 30 znaków.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 6:
			wyswietl = "Nazwisko może zawierać maksymalnie 30 znaków.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;

		case 15:
			wyswietl = "Email już istnieje.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 11:
			wyswietl = "Numer telefonu musi zawierać 9 znaków.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 16:
			wyswietl = "Numer telefonu już istnieje.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
//		
		}
	}

}
