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
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.dto.Zamowienie;
import pl.komp.aso.sterowniki.SterownikKlienta;
import pl.komp.aso.sterowniki.SterownikKsiegowego;
import pl.komp.aso.sterowniki.SterownikMechanika;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class KsiegowyMagazynServlet
 */
@WebServlet("/KsiegowyMagazynServlet")
public class KsiegowyMagazynServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KsiegowyMagazynServlet() {
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
		SterownikKsiegowego sk = new SterownikKsiegowego();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String blad = request.getParameter("blad");
		
		String metoda = request.getParameter("metoda");
		String model = request.getParameter("model");
		String rocznik = request.getParameter("rocznik");
		String typ = request.getParameter("typ");
		String silnik = request.getParameter("silnik");
		String id_czesc=request.getParameter("id_czesc");
		String ile = request.getParameter("ile");
		String koszt=request.getParameter("koszt");
		if(request.getSession().getAttribute("zamowienie")==null)
			request.getSession().setAttribute("zamowienie", new Zamowienie());
		Zamowienie zamowienie = (Zamowienie) request.getSession().getAttribute("zamowienie");
		
		
		if (metoda.equals("zaladujRoczniki")) {
			ArrayList<String> roczniki = spbd.pobierzRoczniki(model);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < roczniki.size(); i++) {
				sb.append("<option value='" + roczniki.get(i) + "'>" + roczniki.get(i) + "</option>");
			}
			out.print(sb);
		} else if (metoda.equals("zaladujMagazyn")) {
			List<String> modele = spbd.pobierzModele();
			request.setAttribute("modele", modele);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKsiegowego/czesciMagazyn.jsp").forward(request, response);
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

		ArrayList<Czesc> czesci = sk.pobierzCzesciMagazyn(model, rocznik, typ,silnik);
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td><b>Nazwa</b></td><td><b>Ilość</b></td><td><b>Zamówienie</b></td></tr>");
		for (int i = 0; i < czesci.size(); i++) {
			sb.append("<tr><td>"+czesci.get(i).getNazwa()+"</td>");
			sb.append("<td>"+czesci.get(i).getIlosc()+"</td>");	
			sb.append("<td><form method=\"post\" action=\"KsiegowyMagazynServlet?metoda=zaladujDodaj\" class=\"inline\">");
			sb.append("<input type=\"hidden\" id=\"id_czesc\" name=\"id_czesc\" value=\""+czesci.get(i).getId()+"\">");
			//System.out.println(czesci.get(i).getId());
			sb.append("<input type=\"hidden\" name=\"model\" value=\""+model+"\">");
			sb.append("<input type=\"hidden\" name=\"rocznik\" value=\""+rocznik+"\">");
			sb.append("<input type=\"hidden\" name=\"typ\" value=\""+typ+"\">");
			sb.append("<input type=\"hidden\" name=\"silnik\" value=\""+silnik+"\">");
			sb.append("<button type=\"submit\" id=\"btn_zmniejsz\" name=\"submit_param\" value=\"submit_value\" class=\"link-button\">Dodaj</button> </form></td> </tr>");
		}
		
		out.print(sb);
	}
		
		else if(metoda.equals("zaladujDodaj")) {
			Czesc czesc = spbd.pobierzCzesc(Integer.parseInt(id_czesc));
			request.setAttribute("czesc", czesc);
			Samochod samochod=spbd.pobierzSamochodId(model, rocznik, typ, silnik);
			request.setAttribute("samochod",samochod);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKsiegowego/czesciMagazynDodaj.jsp").forward(request, response);
		}
		
		else if(metoda.equals("dodaj")) {
			Czesc czesc = spbd.pobierzCzesc(Integer.parseInt(id_czesc));
			czesc.setIlosc(Integer.parseInt(ile));
			boolean odp=true;
			//System.out.println(id_czesc);
			for(int i=0;i<zamowienie.getCzesci().size();i++) {
				//System.out.println(zamowienie.getCzesci().get(i).getId());
				if(zamowienie.getCzesci().get(i).getId()==Integer.parseInt(id_czesc)) {
					odp=false;
					break;
				}
					
			}
				
			if(odp==false)
				blad="Dana część już się znajduje w zamówieniu.";
			else {
				ArrayList <Czesc> czesci= zamowienie.getCzesci();
				czesci.add(czesc);
				zamowienie.setCzesci(czesci);
				request.getSession().setAttribute("zamowienie", zamowienie);
				blad="Dodano do zamówienia.";
			}
				
			if(blad!=null)
				request.setAttribute("blad", blad);
			
			request.getRequestDispatcher("KsiegowyMagazynServlet?metoda=zaladujMagazyn").forward(request, response);
		}
		else if(metoda.equals("zaladujZamowienie")) {
			ArrayList <Czesc> czesci =zamowienie.getCzesci();
			request.setAttribute("czesci", czesci);
			double koszt2= sk.obliczKoszt(czesci);
			request.setAttribute("koszt", koszt2);
			request.getRequestDispatcher("PanelKsiegowego/zamowCzesci.jsp").forward(request, response);

		}
		else if(metoda.equals("usun")) {
			ArrayList <Czesc> czesci =zamowienie.getCzesci();
			for(int i=0;i<czesci.size();i++) {
				if(czesci.get(i).getId()==Integer.parseInt(id_czesc)) {
					czesci.remove(i);
					break;
				}		
			}
			zamowienie.setCzesci(czesci);
			request.getSession().setAttribute("zamowienie",zamowienie);
			request.setAttribute("czesci", czesci);
			double koszt2= sk.obliczKoszt(czesci);
			request.setAttribute("koszt", koszt2);
			blad="Usunięto pozycję z zamówienia.";
			request.setAttribute("blad", blad);
			request.getRequestDispatcher("KsiegowyMagazynServlet?metoda=zaladujZamowienie").forward(request, response);
		}
		else if(metoda.equals("zamow")) {
			if(zamowienie.getCzesci().size()==0)
				blad="Zamówienie nie może być puste.";
			else {
				boolean odp=sk.zlozZamowienie(zamowienie,Double.parseDouble(koszt));
				if(odp) {
					request.getSession().removeAttribute("zamowienie");
					blad="Złożono zamówienie.";
				}
					
				else
					blad="Nie udało się złożyć zamówienia.";
			}
				
			request.setAttribute("blad", blad);
			request.getRequestDispatcher("KsiegowyMagazynServlet?metoda=zaladujMagazyn").forward(request, response);
		}
	}

}
