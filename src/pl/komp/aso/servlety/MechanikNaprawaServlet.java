package pl.komp.aso.servlety;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikMechanika;
import pl.komp.aso.sterowniki.SterownikPolBD;
import pl.komp.aso.sterowniki.SterownikWarsztatu;

/**
 * Servlet implementation class MechanikNaprawaServlet
 */
@WebServlet("/MechanikNaprawaServlet")
public class MechanikNaprawaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MechanikNaprawaServlet() {
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
		SterownikWarsztatu sw=new SterownikWarsztatu();
		SterownikMechanika sm=new SterownikMechanika();
		response.setContentType("text/html;charset=UTF-8");
		
		String blad = request.getParameter("blad");	
		String metoda = request.getParameter("metoda");
		String id=request.getParameter("id");
		
		Uzytkownik u= (Uzytkownik) request.getSession().getAttribute("uzytkownik");

		if(metoda.equals("zaladujZadaniaDoRealizacji")) {
			ArrayList<FormularzNaprawy> formularze = sm.pobierzFormularze(u,"potwierdzenie");
			formularze=sm.sortujFormularze(formularze);
			request.setAttribute("formularze", formularze);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelMechanika/zadaniaDoRealizacjiMechanik.jsp").forward(request, response);
		}
		else if(metoda.equals("zmienStatusNaprawy")) {
			if(sm.zmienStatus(Integer.parseInt(id))) {
				blad="Zmieniono status.";
			}else {
				blad="Błąd zmiany statusu";
			}
			request.setAttribute("blad", blad);
			request.getRequestDispatcher("MechanikNaprawaServlet?metoda=zaladujZadaniaDoRealizacji").forward(request, response);
		}
		else if(metoda.equals("zaladujZadaniaWTrakcie")) {
			ArrayList<FormularzNaprawy> formularze = sm.pobierzFormularze(u,"warsztat");
			request.setAttribute("formularze", formularze);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelMechanika/zadaniaWTrakcieMechanik.jsp").forward(request, response);
		}
		else if(metoda.equals("zaladujUzupelnij")) {
			FormularzNaprawy f = spbd.pobierzFormularz(Integer.parseInt(id));
			request.setAttribute("formularz", f);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelMechanika/zadaniaWTrakcieWyswietlMechanik.jsp").forward(request, response);
		}
		else if(metoda.equals("zakoncz")) {
			String koszt= request.getParameter("koszt");
			//System.out.println(koszt);
			String opis= request.getParameter("opis");
			String dataodebrania= request.getParameter("dataodebrania");
			if(sm.zakonczNaprawe(Integer.parseInt(id),opis,dataodebrania,Double.parseDouble(koszt))) {
				blad="Zakończono zadanie.";
			}else {
				blad="Błąd zakończenia zadania.";
			}
			request.setAttribute("blad", blad);
			request.getRequestDispatcher("MechanikNaprawaServlet?metoda=zaladujZadaniaWTrakcie").forward(request, response);
		}
	}

}
