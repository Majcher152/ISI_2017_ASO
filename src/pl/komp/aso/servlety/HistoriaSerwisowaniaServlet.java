package pl.komp.aso.servlety;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class HistoriaSerwisowaniaServlet
 */
@WebServlet("/HistoriaSerwisowaniaServlet")
public class HistoriaSerwisowaniaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoriaSerwisowaniaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SterownikPolBD spbd = new SterownikPolBD();
		SterownikKlienta sk = new SterownikKlienta();
		response.setContentType("text/html;charset=UTF-8");
		String metoda = request.getParameter("metoda");
		
		
		if(metoda.equals("zaladujHistorie")) {
			Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
			u.setFormularze(spbd.pobierzFormularze(u.getLogin()));
			ArrayList<FormularzNaprawy> formularze = u.getFormularze();
			request.setAttribute("formularze", formularze);
			request.getRequestDispatcher("PanelKlienta/historiaKlient.jsp").forward(request, response);
		}
		
		
	}

}
