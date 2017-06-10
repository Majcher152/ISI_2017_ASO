package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.komp.aso.dto.Zamowienie;
import pl.komp.aso.sterowniki.SterownikKsiegowego;
import pl.komp.aso.sterowniki.SterownikPolBD;

/**
 * Servlet implementation class KsiegowyHistoriaServlet
 */
@WebServlet("/KsiegowyHistoriaServlet")
public class KsiegowyHistoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KsiegowyHistoriaServlet() {
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
		String id=request.getParameter("id");
		
		String metoda = request.getParameter("metoda");
		
		if (metoda.equals("zaladujZamowienia")) {
			ArrayList<Zamowienie> zamowienia = spbd.pobierzZamowienia();
			request.setAttribute("zamowienia",zamowienia);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKsiegowego/historiaZamowien.jsp").forward(request, response);
		}
		else if (metoda.equals("zaladujZamowieniaSzczegoly")) {
			Zamowienie zamowienie = sk.pobierzZamowienie(Integer.parseInt(id));
			request.setAttribute("zamowienie", zamowienie);
			if(blad!=null)
				request.setAttribute("blad", blad);
			request.getRequestDispatcher("PanelKsiegowego/historiaZamowienSzczegoly.jsp").forward(request, response);
		}
	}

}
