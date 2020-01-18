package tratta;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RichiestatrattaDAO;
import dao.TrattaDAO;
import entita.Richiestatratta;
import entita.Tratta;

/**
 * Servlet implementation class ConfermaRichiestaTratta
 */
@WebServlet("/ConfermaRichiestaTratta")
public class ConfermaRichiestaTratta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestatrattaDAO richiestatrattadao= new RichiestatrattaDAO();
	static TrattaDAO trattadao= new TrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfermaRichiestaTratta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idrich=Integer.parseInt(request.getParameter("idrichtratta"));
		Richiestatratta rich= new Richiestatratta();
		Tratta tratta= new Tratta();
		try {
			rich=richiestatrattadao.doRetrieveByKey(idrich);
			tratta.setPartenza(rich.getPartenza());
			tratta.setArrivo(rich.getArrivo());
			trattadao.doSave(tratta);
			richiestatrattadao.doDelete(rich);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
