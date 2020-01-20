package fermata;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CorsaDAO;
import dao.RichiestafermataDAO;
import dao.RichiestatrattaDAO;
import entita.Richiestafermata;
import entita.Richiestatratta;

/**
 * Servlet implementation class AggiungiRichiestaFermata
 */
@WebServlet("/AggiungiRichiestaFermata")
public class AggiungiRichiestaFermata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestafermataDAO richiestafermatadao= new RichiestafermataDAO();
	static CorsaDAO corsadao=new CorsaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiRichiestaFermata() {
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
		int idcorsa=Integer.parseInt(request.getParameter("idcor"));
		String nomefermata=request.getParameter("nome");
		Richiestafermata richiestafermata= new Richiestafermata();
		richiestafermata.setNomefermata(nomefermata);
		
		try {
			richiestafermata.setCorsa(corsadao.doRetrieveByKey(idcorsa));
			richiestafermatadao.doSave(richiestafermata);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("view/richiestaAggiunta.jsp");
		
	}

}
