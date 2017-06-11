package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.sterowniki.SterownikKsiegowego;

/**
 * Servlet implementation class KsiegowyPromocjeServlet
 */
@WebServlet("/KsiegowyPromocjeServlet")
public class KsiegowyPromocjeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KsiegowyPromocjeServlet() {
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
		SterownikKsiegowego sk = new SterownikKsiegowego();
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String tresc= request.getParameter("tresc");
		String blad = request.getParameter("blad");
		System.out.println(tresc);
		sk.wyslijMaile(tresc);
		blad="Wysłano wiadomości do wszystkich klientów.";
		request.setAttribute("blad", blad);
		request.getRequestDispatcher("PanelKsiegowego/promocje.jsp").forward(request, response);
	}

}
