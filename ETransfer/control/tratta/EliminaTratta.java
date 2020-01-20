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
 * Servlet implementation class EliminaTratta
 */
@WebServlet("/EliminaTratta")
public class EliminaTratta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static TrattaDAO trattadao= new TrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaTratta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idtratta= Integer.parseInt(request.getParameter("idtratta"));
		Tratta tratta= new Tratta();
		tratta.setId(idtratta);
		try {
			trattadao.doDelete(tratta);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("eliminazione.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
