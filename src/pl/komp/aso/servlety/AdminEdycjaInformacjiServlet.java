package pl.komp.aso.servlety;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.sterowniki.SterownikAdmina;

/**
 * Servlet implementation class AdminEdycjaInformacjiServlet
 */
@WebServlet("/AdminEdycjaInformacjiPath")
public class AdminEdycjaInformacjiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEdycjaInformacjiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		SterownikAdmina sa = new SterownikAdmina();
		String imie = request.getParameter("imie");
		String nazwisko = request.getParameter("nazwisko");
		String rodzaj_konta = request.getParameter("rodzaj_konta");
		if (rodzaj_konta == null) {
			rodzaj_konta = "Uzytkownik";
		}
		String login = request.getParameter("login");
		String numer_telefonu = request.getParameter("numer_telefonu");
		String email = request.getParameter("email");
		String haslo = request.getParameter("haslo");
		String haslo2 = request.getParameter("haslo2");

		String adres = request.getParameter("adres");
		String ilosc_stanowisk = request.getParameter("ilosc_stanowisk");
		String godzina_zamkniecia = request.getParameter("godzina_zamkniecia");
		String godzina_otwarcia = request.getParameter("godzina_otwarcia");
		String miasto = request.getParameter("miasto");
		String id_warsztatu = request.getParameter("id_warsztatu");
		if (ilosc_stanowisk == null) {
			int blad = sa.uwierzytelnij(imie, nazwisko, email, numer_telefonu, login, haslo, haslo2);
			String wyswietl = "";
			RequestDispatcher dispatcher;
			switch (blad) {
			case 17:
				wyswietl = "Błędny adres email.";
				request.setAttribute("blad", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 0:
				if (sa.zapiszEdycjeInformacji(imie, nazwisko, email, numer_telefonu, login, haslo, rodzaj_konta))
					wyswietl = "Zmieniono ustawienia pomyślnie.";
				else
					wyswietl = "Błąd";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 18:
				wyswietl = "Podaj imię.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 1:
				wyswietl = "Imię może zawierać tylko litery.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 19:
				wyswietl = "Podaj nazwisko.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 2:
				wyswietl = "Nazwisko może zawierać tylko litery.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 3:
				wyswietl = "Numer telefonu może zawierać tylko cyfry.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 5:
				wyswietl = "Imię może zawierać maksymalnie 30 znaków.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 6:
				wyswietl = "Nazwisko może zawierać maksymalnie 30 znaków.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 9:
				wyswietl = "Hasło musi zawierać minimalnie 8 znaków.";
				request.setAttribute("bladHaslo", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 10:
				wyswietl = "Hasło może zawierać maksymalnie 18 znaków.";
				request.setAttribute("bladHaslo", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 12:
				wyswietl = "Hasło za słabe(Musi zawierać co najmniej jeden znak, jedną cyfrę, jedną literę dużą oraz jedną literę małą.";
				request.setAttribute("bladHaslo", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 13:
				wyswietl = "Hasła się nie zgadzają.";
				request.setAttribute("bladHaslo", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 11:
				wyswietl = "Numer telefonu musi zawierać 9 znaków.";
				request.setAttribute("blad", wyswietl);
				if (rodzaj_konta == "Uzytkownik")
					dispatcher = request.getRequestDispatcher("/PanelAdmina/uzytkownicyEdytujAdmin.jsp");
				else
					dispatcher = request.getRequestDispatcher("/PanelAdmina/pracownicyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			}
		} else {
			int blad = sa.uwierzytelnijWarsztat(adres, ilosc_stanowisk, godzina_zamkniecia, numer_telefonu, email,
					godzina_otwarcia, miasto);
			String wyswietl = "";
			RequestDispatcher dispatcher;
			switch (blad) {
			case 17:
				wyswietl = "Błędny adres email.";
				request.setAttribute("blad", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/warsztatyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			case 0:
				if (sa.zapiszEdycjeWarsztat(adres, ilosc_stanowisk, godzina_zamkniecia, numer_telefonu, email,
						godzina_otwarcia, miasto, id_warsztatu))
					wyswietl = "Zmieniono ustawienia pomyślnie.";
				else
					wyswietl = "Błąd";
				request.setAttribute("blad", wyswietl);
				dispatcher = request.getRequestDispatcher("PanelAdmina/warsztatyEdytujAdmin.jsp");
				dispatcher.forward(request, response);
				break;
			}
		}
	}
}
