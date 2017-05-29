package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikPolBD;
import pl.komp.aso.sterowniki.SterownikWarsztatu;

/**
 * Servlet implementation class PrzegladServlet
 */
@WebServlet("/PrzegladServlet")
public class PrzegladServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrzegladServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SterownikPolBD spbd = new SterownikPolBD();
		SterownikKlienta sk = new SterownikKlienta();
		SterownikWarsztatu sw=new SterownikWarsztatu();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String blad = request.getParameter("blad");	
		RequestDispatcher dispatcher;
		String metoda = request.getParameter("metoda");
		String adres =request.getParameter("adres");
		String dzien=request.getParameter("dzien");
		String godzina=request.getParameter("godzina");
		String vin=request.getParameter("samochod");
		Uzytkownik u= (Uzytkownik) request.getSession().getAttribute("uzytkownik");
		if(metoda.equals("zaladujPrzeglad")) {
			ArrayList<Warsztat> warsztaty = spbd.pobierzWarsztaty();
			List<Samochod> samochody = u.getSamochody();
			for(int i=0;i<samochody.size();i++) {
				//usun z tej listy jezeli juz jest w warsztacie
				if(samochody.get(i).isWarsztat()) {
					samochody.remove(i);
				}
			}
			ArrayList<String> adresy = new ArrayList<String>();
			for(int i=0;i<warsztaty.size();i++) {
				adresy.add(warsztaty.get(i).getAdres());
			}
			request.setAttribute("adresy", adresy);
			request.setAttribute("samochody",samochody);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKlienta/przegladKlient.jsp").forward(request, response);
		}
		else if(metoda.equals("zarezerwuj")) {
			request.getRequestDispatcher("PrzegladServlet?metoda=zaladujPrzeglad").forward(request, response);
		}
		else if(metoda.equals("zmianaDnia")) {
			ArrayList<String> godziny =sw.sprawdzGodziny(adres,dzien);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < godziny.size(); i++) {
				sb.append("<option value='" + godziny.get(i) + "'>" + godziny.get(i) + "</option>");
			}
			out.print(sb);
		}
		else if(metoda.equals("zmianaWarsztatu")){
			ArrayList<String> dni =sw.sprawdzDni(adres);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < dni.size(); i++) {
				sb.append("<option value='" + dni.get(i) + "'>" + dni.get(i) + "</option>");
			}
			out.print(sb);
		}
		out.close();
	}

}
