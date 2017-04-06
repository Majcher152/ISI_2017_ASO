package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pl.komp.aso.sterowniki.SterownikPolBD;
import pl.komp.aso.sterowniki.SterownikRejestracji;

/**
 * Servlet implementation class RejServlet
 */
@WebServlet("/rej")
public class RejServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		
		String rodzaj_konta = request.getParameter("rodzaj_konta");
		if (rodzaj_konta == null) {
			rodzaj_konta = "uzytkownik";
		}
		
		SterownikRejestracji sr = new SterownikRejestracji();
		String imie=request.getParameter("imie");
		String nazwisko=request.getParameter("nazwisko");
		String login=request.getParameter("login");
		String haslo=request.getParameter("haslo");
		String numer_telefonu=request.getParameter("numer_telefonu");
		String email=request.getParameter("email");
		String haslo2=request.getParameter("haslo2");
		int blad=sr.uwierzytelnij(imie, nazwisko, email, numer_telefonu, login, haslo,haslo2);
		String wyswietl="";
		RequestDispatcher dispatcher;
		switch(blad) {
		case 17:
			wyswietl="Błędny adres email.";
			request.setAttribute("blad", wyswietl);
			dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
			dispatcher.forward(request, response);
			break;
			case 0 :	
				if(sr.zaloguj(login, haslo2, imie, nazwisko, email, numer_telefonu, rodzaj_konta))
					wyswietl="Zarejestrowano pomyślnie.";
				else 
					wyswietl="Błąd";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 18:
				wyswietl="Podaj imię.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 1:
				wyswietl="Imię może zawierać tylko litery.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;

			case 19:
				wyswietl="Podaj nazwisko.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 2:
				wyswietl="Nazwisko może zawierać tylko litery.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 3:
				wyswietl="Numer telefonu może zawierać tylko cyfry.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 4:
				wyswietl="Błędne znaki w loginie.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 5:
				wyswietl="Imię może zawierać maksymalnie 30 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 6:
				wyswietl="Nazwisko może zawierać maksymalnie 30 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			
			case 15:
				wyswietl="Email już istnieje.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 11:
				wyswietl="Numer telefonu musi zawierać 9 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 16:
				wyswietl="Numer telefonu już istnieje.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 8:
				wyswietl="Login musi zawierać minimalnie 4 znaki.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 7:
				wyswietl="Login może zawierać maksymalnie 16 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 14:
				wyswietl="Login już istnieje.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 9:
				wyswietl="Hasło musi zawierać minimalnie 8 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 10:
				wyswietl="Hasło może zawierać maksymalnie 18 znaków.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			
			case 12:
				wyswietl="Hasło za słabe(Musi zawierać co najmniej jeden znak, jedną cyfrę, jedną literę dużą oraz jedną literę małą.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;
			case 13:
				wyswietl="Hasła się nie zgadzają.";
				request.setAttribute("blad", wyswietl);
				dispatcher =request.getRequestDispatcher("rejestracja.jsp"); 
				dispatcher.forward(request, response);
				break;		
		}
		
		
		
		
	}

}