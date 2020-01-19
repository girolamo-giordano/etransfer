package fermata;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CorsaDAO;
import dao.FermataDAO;
import entita.Fermata;
import utenti.Autista;

/**
 * Servlet implementation class AggiungiFermata
 */
@WebServlet("/AggiungiFermata")
public class AggiungiFermata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static FermataDAO fermatadao= new FermataDAO();
	static CorsaDAO corsadao= new CorsaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiFermata() {
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
		String nome=request.getParameter("nome");
		String idcorsa=request.getParameter("corsa");
		Fermata fermata= new Fermata();
		fermata.setNomefermata(nome);
		try {
			fermata.setCorsa(corsadao.doRetrieveByKey(Integer.parseInt(idcorsa)));
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			fermatadao.doSave(fermata);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Errore"+e.toString());
		}
		
		response.sendRedirect("view/aggiunta.jsp");
	}

}
