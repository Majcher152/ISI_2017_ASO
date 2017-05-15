package pl.komp.aso.servlety;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
        try {
            int model = Integer.parseInt(request.getParameter("model"));

            switch (model) {
                case 1:  
                	System.out.println("case1");
                    out.print(
                        "<option value='1'>Product Name 1 For Category 2</option>" +
                        "<option value='2'>Product Name 2 For Category 2</option>" +
                        "<option value='3'>Product Name 3 For Category 2</option>"
                    );
                    break;
                case 2: 
                	System.out.println("case2");
                    out.print(
                        "<option value='1'>Product Name 1 For Category 3</option>" +
                        "<option value='2'>Product Name 2 For Category 3</option>" +
                        "<option value='3'>Product Name 3 For Category 3</option>"
                    );
                    break;
                default:
                	System.out.println("case3");
                    out.print(
                        "<option value='1'>Product Name 1 For Category 1</option>" +
                        "<option value='2'>Product Name 2 For Category 1</option>" +
                        "<option value='3'>Product Name 3 For Category 1</option>"
                    );
                    break;
            }
        }  catch (Exception ex) {
            out.print("Error getting product name..." + ex.toString());
        }
        finally {
            out.close();
        }
	}

	

}
