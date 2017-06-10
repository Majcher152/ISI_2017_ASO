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
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.sterowniki.SterownikKsiegowego;
import pl.komp.aso.sterowniki.SterownikMechanika;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class KsiegowyWarsztatServlet
 */
@WebServlet("/KsiegowyWarsztatServlet")
public class KsiegowyWarsztatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KsiegowyWarsztatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SterownikPolBD spbd = new SterownikPolBD();
		SterownikKsiegowego sk = new SterownikKsiegowego();
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
		String id_warsztat= request.getParameter("id_warsztat");
		String id_czesc=request.getParameter("id_czesc");
		
		
		if (metoda.equals("zaladujRoczniki")) {
			ArrayList<String> roczniki = spbd.pobierzRoczniki(model);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < roczniki.size(); i++) {
				sb.append("<option value='" + roczniki.get(i) + "'>" + roczniki.get(i) + "</option>");
			}
			out.print(sb);
		} else if (metoda.equals("zaladujWarsztat")) {
			ArrayList<Warsztat> warsztaty = spbd.pobierzWarsztaty();
			request.setAttribute("warsztaty", warsztaty);
			List<String> modele = spbd.pobierzModele();
			request.setAttribute("modele", modele);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("/ISI_2017_ASO/WebContent/PanelKsiegowego/czesciWarsztaty.jsp").forward(request, response);
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

		ArrayList<Czesc> czesci = sk.pobierzCzesciWarsztat(model, rocznik, typ,silnik,Integer.parseInt(id_warsztat));
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td><b>Nazwa</b></td><td><b>Ilość</b></td></tr>");
		for (int i = 0; i < czesci.size(); i++) {
			sb.append("<tr><td>"+czesci.get(i).getNazwa()+"</td>");
			sb.append("<td>"+czesci.get(i).getIlosc()+"</td>");			
		}
		
		out.print(sb);
	}
		else if(metoda.equals("zaladujAktualizuj")) {
			Czesc czesc = spbd.pobierzCzesc(Integer.parseInt(id_czesc), Integer.parseInt(id_warsztat));
			request.setAttribute("czesc", czesc);
			Samochod samochod=spbd.pobierzSamochodId(model, rocznik, typ, silnik);
			request.setAttribute("samochod",samochod);
			Warsztat warsztat = spbd.pobierzWarsztatId(Integer.parseInt(id_warsztat));
			request.setAttribute("warsztat", warsztat);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKsiegowe/czesciWarsztatAktualizacja.jsp").forward(request, response);
		}
		else if(metoda.equals("aktualizuj")) {
			
		}
	}

}
