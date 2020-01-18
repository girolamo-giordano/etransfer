package tratta;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RichiestatrattaDAO;
import entita.Richiestatratta;

/**
 * Servlet implementation class AggiungiRichiestaTratta
 */
@WebServlet("/AggiungiRichiestaTratta")
public class AggiungiRichiestaTratta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RichiestatrattaDAO richiestatrattadao= new RichiestatrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiRichiestaTratta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String partenza= request.getParameter("partenza");
		String arrivo= request.getParameter("arrivo");
		Richiestatratta richiestat=new Richiestatratta();
		richiestat.setPartenza(partenza);
		richiestat.setArrivo(arrivo);
		try {
			richiestatrattadao.doSave(richiestat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/home.jsp");
	}

}
