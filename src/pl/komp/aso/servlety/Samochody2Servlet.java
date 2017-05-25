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

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class Samochody2Servlet
 */
@WebServlet("/Samochody2Servlet")
public class Samochody2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Samochody2Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SterownikPolBD spbd = new SterownikPolBD();
		SterownikKlienta sk= new SterownikKlienta();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		String metoda = request.getParameter("method");
		String model = request.getParameter("model");
		String rocznik =request.getParameter("rocznik");
		String typ =request.getParameter("typ");
		
		
		if(metoda.equals("methodA")) {
			ArrayList<String> roczniki = spbd.pobierzRoczniki(model);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < roczniki.size(); i++) {
				sb.append("<option value='" + roczniki.get(i) + "'>" + roczniki.get(i) + "</option>");
			}
			out.print(sb);
		}
		
		else if(metoda.equals("methodB")) {
			ArrayList<String> typy = spbd.pobierzTypy(model,rocznik);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < typy.size(); i++) {
				sb.append("<option value='" + typy.get(i) + "'>" + typy.get(i) + "</option>");
			}
			out.print(sb);
		}
		else if(metoda.equals("methodC")) {
			ArrayList<String> silniki = spbd.pobierzSilniki(model,rocznik,typ);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < silniki.size(); i++) {
				sb.append("<option value='" + silniki.get(i) + "'>" + silniki.get(i) + "</option>");
			}
			out.print(sb);
		}
		else if(metoda.equals("methodD")) {
			String silnik= request.getParameter("silnik");
			String vin = request.getParameter("vin");
			String blad="";
			RequestDispatcher dispatcher;
			if(vin==null || silnik==null || typ==null || rocznik==null) {
				blad="Żadne pole nie może być puste.";
				request.setAttribute("blad", blad);
				dispatcher = request.getRequestDispatcher("PanelKlienta/samochodyKlient.jsp");
				dispatcher.forward(request, response);
			}			
			Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("Uzytkownik");
			int odp=sk.dodajAuto(u, model, rocznik, typ, silnik, vin);
			if(odp==0) {
				blad="Pomyślnie dodano samochód.";
				request.setAttribute("blad", blad);
				dispatcher = request.getRequestDispatcher("PanelKlienta/samochodyKlient.jsp");
				dispatcher.forward(request, response);
			}
			else if(odp==-1) {
				blad="Błąd.";
				request.setAttribute("blad", blad);
				dispatcher = request.getRequestDispatcher("PanelKlienta/samochodyKlient.jsp");
				dispatcher.forward(request, response);
			}
			else {
				blad="Podany vin już istnieje.";
				request.setAttribute("blad", blad);
				dispatcher = request.getRequestDispatcher("PanelKlienta/samochodyKlient.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		
		out.close();

	}

}
