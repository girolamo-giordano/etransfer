package fermata;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FermataDAO;
import dao.RichiestafermataDAO;
import entita.Fermata;
import entita.Richiestafermata;

/**
 * Servlet implementation class ConfermaRichiestaFermata
 */
@WebServlet("/ConfermaRichiestaFermata")
public class ConfermaRichiestaFermata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestafermataDAO richiestafermatadao= new RichiestafermataDAO();
	static FermataDAO fermatadao= new FermataDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfermaRichiestaFermata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idrichfermata= Integer.parseInt(request.getParameter("idrichfermata"));
		try {
			Fermata fermata= new Fermata();
			Richiestafermata richiestafermata= richiestafermatadao.doRetrieveByKey(idrichfermata);
			fermata.setCorsa(richiestafermata.getCorsa());
			fermata.setNomefermata(richiestafermata.getNomefermata());
			fermatadao.doSave(fermata);
			richiestafermatadao.doDelete(richiestafermata);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/richiesta.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
