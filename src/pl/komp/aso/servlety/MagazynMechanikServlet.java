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

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikMechanika;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class MagazynMechanikServlet
 */
@WebServlet("/MagazynMechanikServlet")
public class MagazynMechanikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazynMechanikServlet() {
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
		SterownikMechanika sm= new SterownikMechanika();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String blad = request.getParameter("blad");
		
		RequestDispatcher dispatcher;

		String metoda = request.getParameter("metoda");
		String model = request.getParameter("model");
		String rocznik = request.getParameter("rocznik");
		String typ = request.getParameter("typ");
		String silnik = request.getParameter("silnik");
		Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
		
		if (metoda.equals("zaladujRoczniki")) {
			ArrayList<String> roczniki = spbd.pobierzRoczniki(model);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < roczniki.size(); i++) {
				sb.append("<option value='" + roczniki.get(i) + "'>" + roczniki.get(i) + "</option>");
			}
			out.print(sb);
		} else if (metoda.equals("zaladujAktualizacje")) {
			List<String> modele = spbd.pobierzModele();
			request.setAttribute("modele", modele);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelMechanika/aktualizacjaMagazynuMechanik.jsp").forward(request, response);
		}

		else if (metoda.equals("zaladujTypy")) {
			ArrayList<String> typy = spbd.pobierzTypy(model, rocznik);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < typy.size(); i++) {
				sb.append("<option value='" + typy.get(i) + "'>" + typy.get(i) + "</option>");
			}
			out.print(sb);
		} else if (metoda.equals("zaladujSilniki")) {
			ArrayList<String> silniki = spbd.pobierzSilniki(model, rocznik, typ);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < silniki.size(); i++) {
				sb.append("<option value='" + silniki.get(i) + "'>" + silniki.get(i) + "</option>");
			}
			out.print(sb);
		}
		else if (metoda.equals("zaladujCzesci")) {
		//ArrayList<Czesc> czesci = sm.pobierzCzesci(model, rocznik, typ,silnik,u);
			System.out.println("no siema");
			ArrayList<Czesc> czesci = new ArrayList<Czesc>();
			Czesc c1= new Czesc();
			c1.setId(1);
			c1.setIlosc(12);
			c1.setNazwa("wtf");
			
			Czesc c2= new Czesc();
			c2.setId(2);
			c2.setIlosc(120);
			c2.setNazwa("hehe");
			czesci.add(c1);
			czesci.add(c2);
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td><b>Nazwa</b></td><td><b>Ilość</b></td><td><b>Aktualizuj</b></td></tr>");
		for (int i = 0; i < czesci.size(); i++) {
			sb.append("<tr><td>value=\""+czesci.get(i).getNazwa()+"\"</td>");
			sb.append("<td>value=\""+czesci.get(i).getIlosc()+"\"</td>");
			sb.append("<td><form method=\"post\" action=\"MagazynMechanikServlet?metoda=aktualizuj\" class=\"inline\"> <input type=\"hidden\" name=\"id\" value=\""+czesci.get(i).getId()+"\"> <button type=\"submit\" name=\"submit_param\" value=\"submit_value\" class=\"link-button\">Zmniejsz</button> </form></td> </tr>");
		}
		
		out.print(sb);
	}
		else if(metoda.equals("aktualizuj")) {
			
		}
	}

}
