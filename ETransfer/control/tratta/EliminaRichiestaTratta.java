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
 * Servlet implementation class EliminaRichiestaTratta
 */
@WebServlet("/EliminaRichiestaTratta")
public class EliminaRichiestaTratta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestatrattaDAO richiestatrattadao= new RichiestatrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaRichiestaTratta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idrich=Integer.parseInt(request.getParameter("idrichtratta"));
		Richiestatratta rich= new Richiestatratta();
		try {
			rich=richiestatrattadao.doRetrieveByKey(idrich);
			richiestatrattadao.doDelete(rich);
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
