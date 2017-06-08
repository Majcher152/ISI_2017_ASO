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
import pl.komp.aso.dto.Samochod;
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
		String id = request.getParameter("id");
		String ile = request.getParameter("ile");
		
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
			//System.out.println(model+" "+rocznik+ " "+typ+" " +silnik);

		ArrayList<Czesc> czesci = sm.pobierzCzesci(model, rocznik, typ,silnik,u);
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td><b>Nazwa</b></td><td><b>Ilość</b></td><td><b>Aktualizuj</b></td></tr>");
		for (int i = 0; i < czesci.size(); i++) {
			sb.append("<tr><td>"+czesci.get(i).getNazwa()+"</td>");
			sb.append("<td>"+czesci.get(i).getIlosc()+"</td>");
			sb.append("<td><form method=\"post\" action=\"MagazynMechanikServlet?metoda=zaladujAktualizuj\" class=\"inline\">");
			sb.append("<input type=\"hidden\" id=\"id\" name=\"id\" value=\""+czesci.get(i).getId()+"\">");
			System.out.println(czesci.get(i).getId());
			sb.append("<input type=\"hidden\" name=\"model\" value=\""+model+"\">");
			sb.append("<input type=\"hidden\" name=\"rocznik\" value=\""+rocznik+"\">");
			sb.append("<input type=\"hidden\" name=\"typ\" value=\""+typ+"\">");
			sb.append("<input type=\"hidden\" name=\"silnik\" value=\""+silnik+"\">");

			sb.append("<button type=\"submit\" id=\"btn_zmniejsz\" name=\"submit_param\" value=\"submit_value\" class=\"link-button\">Zmniejsz</button> </form></td> </tr>");
			
		}
		
		out.print(sb);
	}
		else if(metoda.equals("zaladujAktualizuj")) {
			//System.out.println(id);
			Czesc czesc = sm.pobierzCzesc(Integer.parseInt(id), u);
			request.setAttribute("czesc", czesc);
			Samochod samochod=spbd.pobierzSamochodId(model, rocznik, typ, silnik);
			request.setAttribute("samochod",samochod);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelMechanika/aktualizacjaMagazynuZmniejszMechanik.jsp").forward(request, response);
		}
		
		else if(metoda.equals("aktualizuj")) {
			//System.out.println(id);
			Czesc czesc = sm.pobierzCzesc(Integer.parseInt(id), u);
			boolean odp=sm.aktualizuj(czesc.getIlosc(),Integer.parseInt(id),Integer.parseInt(ile),u);
			if(odp==false)
				blad="Nie udało sie zaktualizować.";
			else
				blad="Zaktualizowano.";
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("MagazynMechanikServlet?metoda=zaladujAktualizacje").forward(request, response);
		}
	}

}
