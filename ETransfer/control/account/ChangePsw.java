package account;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;

import utenti.Cliente;

/**
 * Servlet implementation class ChangePsw
 */
@WebServlet("/ChangePsw")
public class ChangePsw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO model=new ClienteDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePsw() {
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
		// TODO Auto-generated method stub
		Cliente ur=new Cliente();
		ur=(Cliente)request.getSession(false).getAttribute("cliente");
		
		String pass=request.getParameter("password");
		if(pass==null)
		{
			response.sendError(406);
			return;
		}
		if(ur==null)
		{
			response.sendError(407);
			return;
		}
		else
		{
			ur.setPassword(pass);;
			try {
				model.doUpdate(ur);
				response.sendRedirect("changeindirizzosucc.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
	}

}
