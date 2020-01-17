package biglietto;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CorsaDAO;
import entita.Corsa;

/**
 * Servlet implementation class CheckoutAcquisto
 */
@WebServlet("/CheckoutAcquisto")
public class CheckoutAcquisto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CorsaDAO corsadao= new CorsaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutAcquisto() {
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
		String numbiglietti= request.getParameter("numbiglietti");
		String idcorsa= request.getParameter("corsaid");
		Corsa corsa=null ;
		try {
			corsa = corsadao.doRetrieveByKey(Integer.parseInt(idcorsa));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("corsain",corsa);
		request.setAttribute("idcorsa",Integer.parseInt(idcorsa));
		request.setAttribute("numbiglietti", Integer.parseInt(numbiglietti));
		RequestDispatcher rd= this.getServletContext().getRequestDispatcher("/view/checkoutBiglietto.jsp");
		rd.forward(request, response);
	}

}
