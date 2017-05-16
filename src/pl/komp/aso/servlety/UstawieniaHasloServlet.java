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

/**
 * Servlet implementation class UstawieniaHasloServlet
 */
@WebServlet("/UstawieniaHasloServlet")
public class UstawieniaHasloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UstawieniaHasloServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String stareHaslo = request.getParameter("stareHaslo");
		String noweHaslo = request.getParameter("noweHaslo");
		String noweHaslo2 = request.getParameter("noweHaslo2");
		
		int blad = sk.uwierzytelnijHaslo(uzytkownik,stareHaslo,noweHaslo,noweHaslo2);
		String wyswietl = "";
		RequestDispatcher dispatcher;
		switch (blad) {
		case 0:
			if (sk.edytujHaslo(uzytkownik,noweHaslo))
				wyswietl = "Zmieniono hasło pomyślnie.";
			else
				wyswietl = "Błąd";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 1:
			wyswietl = "Niepoprawne stare hasło.";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 9:
			wyswietl = "Hasło musi zawierać minimalnie 8 znaków.";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 10:
			wyswietl = "Hasło może zawierać maksymalnie 18 znaków.";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 12:
			wyswietl = "Hasło za słabe(Musi zawierać co najmniej jeden znak, jedną cyfrę, jedną literę dużą oraz jedną literę małą.";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		case 13:
			wyswietl = "Hasła się nie zgadzają.";
			request.setAttribute("bladHaslo", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKlienta/edytujDaneKlient.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
