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
 * Servlet implementation class AdminUsuwanieServlet
 */
@WebServlet("/AdminUsuwaniePath")
public class AdminUsuwanieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUsuwanieServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		SterownikAdmina sa = new SterownikAdmina();

		String imie = request.getParameter("imie");
		String nazwisko = request.getParameter("nazwisko");
		String email = request.getParameter("email");
		String rodzaj_konta = request.getParameter("rodzaj_konta");

		String adres = request.getParameter("adres");
		String miasto = request.getParameter("miasto");
		String id_warsztatu = request.getParameter("id_warsztatu");

		String wyswietl = "";
		RequestDispatcher dispatcher;

		if (id_warsztatu == null) {
			boolean blad = sa.usunUzytkownikaPracownika(imie, nazwisko, email);
			if (blad)
				wyswietl = "Usunięto użytkownika pomyślnie.";
			else
				wyswietl = "Uzytkownik nie istnieje.";

			request.setAttribute("blad", wyswietl);
			if (rodzaj_konta.equals("Uzytkownik"))
				dispatcher = request.getRequestDispatcher("PanelAdmina/uzytkownicyAdmin.jsp");
			else
				dispatcher = request.getRequestDispatcher("PanelAdmina/pracownicyAdmin.jsp");
		} else {
			boolean blad = sa.usunWarszat(adres, miasto, id_warsztatu);
			if (blad)
				wyswietl = "Usunięto warsztat pomyślnie.";
			else
				wyswietl = "Warsztat nie istnieje.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelAdmina/warsztatyAdmin.jsp");
		}
		dispatcher.forward(request, response);
	}
}
