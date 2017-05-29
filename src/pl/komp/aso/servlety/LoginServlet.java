package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikLogowania;
import pl.komp.aso.sterowniki.SterownikPolBD;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = -339229991748289212L;
	private SterownikPolBD spbd;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
       
    }
    
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String login = request.getParameter("login");
		String haslo = request.getParameter("haslo");
		SterownikLogowania sterownikLogowania = new SterownikLogowania();
		int wynik=sterownikLogowania.uwierzytelnij(login, haslo);
		RequestDispatcher dispatcher;
		String blad ="";
		if(wynik==1 || wynik==2) {
			System.out.println("puste");
			blad="Proszę wypełnić wszystkie pola.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("logowanie.jsp"); 
			dispatcher.forward(request, response);
			
		}
		else if(wynik==-1) {
			blad="Użyto nieprawidłowego znaku w loginie.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("logowanie.jsp"); 
			dispatcher.forward(request, response);
		}
		else if(wynik==3) {
			System.out.println("bledny login lub haslo");
			blad="Błędny login lub hasło.";
			request.setAttribute("blad", blad);
			dispatcher =request.getRequestDispatcher("logowanie.jsp"); 
			dispatcher.forward(request, response);
		}
		//jest to zwykly uzytkownik
		else if(wynik==5) {
			Uzytkownik uzytkownik=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("uzytkownik", uzytkownik);
			response.sendRedirect("PanelKlienta/indexKlient.jsp");
		}
		//jest to mechanik
		else if(wynik==6) {
			Uzytkownik uzytkownik=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("uzytkownik", uzytkownik);
			response.sendRedirect("PanelMechanika/mechanik.jsp");
		}
		//jest to ksiegowy
		else if(wynik==7) {
			Uzytkownik uzytkownik=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("uzytkownik", uzytkownik);
			response.sendRedirect("PanelKsiegowego/ksiegowy.jsp");
		}
		//jest to administrator
		else if(wynik==8) {
			Uzytkownik uzytkownik=sterownikLogowania.getUzytkownik(login);
			request.getSession().setAttribute("uzytkownik", uzytkownik);
			response.sendRedirect("PanelAdmina/admin.jsp");
		}
		
		return;
	}

	

}
