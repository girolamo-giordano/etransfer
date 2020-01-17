package utenti;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutistaDAO;
import dao.ClienteDAO;

/**
 * Servlet implementation class InfoUtente
 */
@WebServlet("/InfoUtente")
public class InfoUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO clientedao= new ClienteDAO();
	static AutistaDAO autistadao= new AutistaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idutente= Integer.parseInt(request.getParameter("idutente"));
		int idtipo=Integer.parseInt(request.getParameter("idtipo"));
		Cliente cliente= new Cliente();
		Autista autista= new Autista();
		if(idtipo==0)
		{
			try {
				cliente= clientedao.doRetrieveByKey(idutente);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("cliente", cliente);
		}
		
		if(idtipo==1)
		{
			try {
				autista= autistadao.doRetrieveByKey(idutente);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("autista", autista);
		}
		RequestDispatcher rd= getServletContext().getRequestDispatcher("/view/infoUtente.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
