package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.Samochod;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class SamochodyServlet
 */
@WebServlet("/SamochodyServlet")
public class SamochodyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SamochodyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		 SterownikPolBD spbd=new SterownikPolBD();
//		 List<Samochod> samochody = spbd.pobierzSamochody();
//		 for(Samochod s: samochody) {
//			 System.out.println(s.getModel());
//		 }
		 List<String> modele = spbd.pobierzModele();
	     request.setAttribute("modele", modele);
	     request.getRequestDispatcher("PanelKlienta/samochodyKlient.jsp").forward(request, response);
	     
	     
	     
	}


}
