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
 * Servlet implementation class KsiegowyServlet
 */
@WebServlet("/KsiegowyRezerwacjaNaprawy")
public class KsiegowyRezerwacjaNaprawyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KsiegowyRezerwacjaNaprawyServlet() {
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
		String vin = request.getParameter("vin");
		String dataoddania = request.getParameter("dataoddania");
		String przewid_czas_trwania = request.getParameter("przewid_czas_trwania");
		
		int blad = sk.zatwierdzRezerwacjeNaprawy(vin, dataoddania, przewid_czas_trwania);
		
		String wyswietl = "";
		RequestDispatcher dispatcher;
		
		switch (blad) {
		case 0:
			wyswietl = "Zaakceptowano termin rezerwacji.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/akceptacjaNapraw.jsp");
			dispatcher.forward(request, response);
			break;
		case 1:
			wyswietl = "Błędnie podana data.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/akceptacjaWyswietl.jsp");
			dispatcher.forward(request, response);
			break;
		case 2:
			wyswietl = "Błędnie podany przewidywany czas naprawy.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/akceptacjaWyswietl.jsp");
			dispatcher.forward(request, response);
			break;
		case -1:
			wyswietl = "Błąd akceptowania terminu rezerwacji.";
			request.setAttribute("blad", wyswietl);
			dispatcher = request.getRequestDispatcher("PanelKsiegowego/akceptacjaWyswietl.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
