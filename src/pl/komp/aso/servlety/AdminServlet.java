package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.sterowniki.SterownikPolBD;


public class AdminServlet extends HttpServlet {

//	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
//	{
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		String userName = request.getParameter("userName");
//		out.println("hello from get " + userName);
//			
//	}
	
	
	private static final long serialVersionUID = -4923727533220323957L;
	public AdminServlet() {
	        super();
	       
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String login = request.getParameter("login");
		String haslo = request.getParameter("haslo");
		String imie = request.getParameter("imie");
		String nazwisko = request.getParameter("nazwisko");
		String email = request.getParameter("email");
		String nrtel = request.getParameter("nrtel");
		String rodzaj = request.getParameter("rodzaj");
		if(rodzaj == null)
		{
			rodzaj = "Uzytkownik";
		}
		SterownikPolBD spbd = new SterownikPolBD();
		int odp = spbd.zarejestruj(login,haslo,imie,nazwisko,email,nrtel,rodzaj);
		
		if(odp==1) out.println("zarejestrowano");
		else out.println("podany login jest ju¿ zajêty!");
	}
}
