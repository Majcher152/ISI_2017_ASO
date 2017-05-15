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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String model = request.getParameter("model");
		String metoda = request.getParameter("method");
		String rocznik =request.getParameter("rocznik");
		if(metoda.equals("methodA")) {
			System.out.println("meta");
			ArrayList<String> roczniki = spbd.pobierzRoczniki(model);
			// request.setAttribute("roczniki", roczniki);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < roczniki.size(); i++) {
				sb.append("<option value='" + roczniki.get(i) + "'>" + roczniki.get(i) + "</option>");
			}
			out.print(sb);
		}
		
		else if(metoda.equals("methodB")) {
			System.out.println("metb");
			ArrayList<String> typy = spbd.pobierzTypy(model,rocznik);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < typy.size(); i++) {
				System.out.println(typy.get(i));
				sb.append("<option value='" + typy.get(i) + "'>" + typy.get(i) + "</option>");
			}
			out.print(sb);
		}
		out.close();

	}

}
