package account;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutistaDAO;
import dao.ClienteDAO;
import dao.ManagerDAO;
import utenti.Autista;
import utenti.Cliente;
import utenti.Manager;

/**
 * Servlet implementation class ChangePsw
 */
@WebServlet("/ModificaPassword")
public class ModificaPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO model=new ClienteDAO();
	static AutistaDAO autistadao=new AutistaDAO();
	static ManagerDAO managerdao=new ManagerDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaPassword() {
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
		Autista at=new Autista();
		Manager man=new Manager();
		ur=(Cliente)request.getSession(false).getAttribute("cliente");
		at=(Autista)request.getSession().getAttribute("autista");
		man=(Manager)request.getSession().getAttribute("manager");
		String pass=request.getParameter("indir");
		String cpass=request.getParameter("cpass");
		if(pass==null)
		{
			response.sendError(406);
			return;
		}
		if (!pass.equals(cpass))
		{
			response.sendError(406);
			return;
		}
		if(ur==null)
		{
			if(at==null)
			{
				if(man== null)
				{
					response.sendError(407);
					return;
				}
				else
				{
					if(pass.equals(man.getPassword()))
					{
						response.sendError(408);
						return;
					}
					man.setPassword(pass);
					try {
						managerdao.doUpdate(man);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			else
			{
				if(pass.equals(at.getPassword()))
				{
					response.sendError(408);
					return;
				}
				at.setPassword(pass);
				try {
					autistadao.doUpdate(at);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else
		{
			if(pass.equals(ur.getPassword()))
			{
				response.sendError(408);
				return;
			}
			ur.setPassword(pass);
			try {
				model.doUpdate(ur);
				response.sendRedirect("view/change.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("view/change.jsp");
	}

}
