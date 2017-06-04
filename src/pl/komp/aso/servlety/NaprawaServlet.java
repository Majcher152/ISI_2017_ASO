package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class NaprawaServlet
 */
@WebServlet("/NaprawaServlet")
public class NaprawaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaprawaServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		String blad = request.getParameter("blad");	
		String metoda = request.getParameter("metoda");
		String adres =request.getParameter("adres");
		String dzien=request.getParameter("data");
		String opis=request.getParameter("opis");
		String vin=request.getParameter("samochod");
		Uzytkownik u= (Uzytkownik) request.getSession().getAttribute("uzytkownik");

		if(metoda.equals("zaladujNaprawe")) {
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
			request.getRequestDispatcher("PanelKlienta/naprawaKlient.jsp").forward(request, response);
		}
		else if(metoda.equals("zarezerwuj")) {
			System.out.println("dzien:"+dzien);
			if(vin==null || adres==null || dzien==null || opis==null ||dzien.equals("")||opis.equals("")) {
				
				blad="Żadne pole nie może być puste.";
			}
			else {
				if(sw.zarezerwujNaprawe(vin,adres,dzien,opis,u))
					blad="Zarezerwowano termin.";
				else 
					blad="Błąd rezerwacji";
			}
			request.setAttribute("blad", blad);
			request.getRequestDispatcher("NaprawaServlet?metoda=zaladujNaprawe").forward(request, response);
		}
		
	}

}
