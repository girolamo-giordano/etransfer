package fermata;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RichiestafermataDAO;
import entita.Richiestafermata;

/**
 * Servlet implementation class EliminaRichiestaFermata
 */
@WebServlet("/EliminaRichiestaFermata")
public class EliminaRichiestaFermata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestafermataDAO richiestafermatadao=new RichiestafermataDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaRichiestaFermata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idrichfe=Integer.parseInt(request.getParameter("idrichfe"));
		try {
			Richiestafermata rf= richiestafermatadao.doRetrieveByKey(idrichfe);
			richiestafermatadao.doDelete(rf);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/eliminazione.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
