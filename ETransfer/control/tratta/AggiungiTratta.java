package tratta;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TrattaDAO;
import entita.Tratta;

/**
 * Servlet implementation class AggiungiTratta
 */
@WebServlet("/AggiungiTratta")
public class AggiungiTratta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static TrattaDAO trattadao= new TrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiTratta() {
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
		String partenza=request.getParameter("partenza");
		String arrivo=request.getParameter("arrivo");
		Tratta tratta= new Tratta();
		tratta.setPartenza(partenza);
		tratta.setArrivo(arrivo);
		try {
			trattadao.doSave(tratta);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/aggiunta.jsp");
	}

}
