package corsa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CorsaDAO;
import entita.Corsa;


/**
 * Servlet implementation class InfoCorsa
 */
@WebServlet("/InfoCorsa")
public class InfoCorsa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CorsaDAO corsadao= new CorsaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoCorsa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_prod=Integer.parseInt(request.getParameter("id_corsa"));
		Corsa corsa=new Corsa();
		try {
			corsa=corsadao.doRetrieveByKey(id_prod);
			if(corsa.getDatapart()==null)
			{
				response.sendError(404);
				return;
			}
			request.setAttribute("corsasel", corsa);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/view/infoCorsa.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
