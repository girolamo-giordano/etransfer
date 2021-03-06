package account;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;

import utenti.Cliente;

/**
 * Servlet implementation class ChangeMail
 */
@WebServlet("/ModificaEmail")
public class ModificaEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO model=new ClienteDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaEmail() {
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
		Cliente ur=new Cliente();
		ur=(Cliente)request.getSession(false).getAttribute("cliente");
		
		
		String email=request.getParameter("indir");
		if(email==null || email.length()<3)
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
			
			try {
				Collection<Cliente> clienti=model.doRetrieveAll();
				for(Cliente c:clienti)
				{
					if(c.getEmail().equals(email))
					{
						response.sendError(406);
					}
				}
				ur.setEmail(email);
				model.doUpdate(ur);
				response.sendRedirect("view/change.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
	}

}
