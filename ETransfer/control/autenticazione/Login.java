package autenticazione;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO clientedao=new ClienteDAO();
	static ManagerDAO managerdao=new ManagerDAO();
	static AutistaDAO autistadao=new AutistaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String utc=request.getParameter("sceltaP");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(username==null || password==null)
		{
			response.sendError(406);
			return;
		}
		if(utc.equals("Utente"))
		{
			Cliente cliente= new Cliente();
			Collection<Cliente> clienti=null;
			try {
				clienti = clientedao.doRetrieveAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cliente.setUsername(username);
			cliente.setPassword(password);
			boolean logged=false;
				for(Cliente ur1:clienti)
				{
					if((cliente.getUsername().equals(cliente.getUsername())) && (cliente.getPassword().equals(ur1.getPassword())))
							{
								cliente.setCitta(ur1.getCitta());
								cliente.setCognome(ur1.getCognome());
								cliente.setEmail(ur1.getEmail());
								cliente.setIndirizzo(ur1.getIndirizzo());
								cliente.setNome(ur1.getNome());
								cliente.setNumerotel(ur1.getNumerotel());
								cliente.setId(ur1.getId());
								logged=true;
								
								request.getSession().setAttribute("cliente",cliente);
								System.out.println("utente loggato");
								response.sendRedirect("view/home.jsp");
							}
					
				}
				if(!logged)
				{
					response.sendError(406);
					return;
				}
		}
		if(utc.equals("Admin"))
		{
			Manager ar= new Manager();
			ar.setUsername(username);
			ar.setPassword(password);
			Collection<Manager> coll=null;
			try {
				coll = managerdao.doRetrieveAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			boolean logged=false;
			for(Manager ar1:coll)
			{
					System.out.println(ar1);
					if((ar.getUsername().equals(ar1.getUsername())) && (ar.getPassword().equals(ar1.getPassword())))
							{
							
								ar.setCognome(ar1.getCognome());
								ar.setNome(ar1.getNome());
								logged=true;
								request.getSession().setAttribute("manager",ar);
								System.out.println("manager loggato");
								response.sendRedirect("view/home.jsp");
							}
			}
			if(!logged)
			{
				response.sendError(406);
				return;
			}
		}
		if(utc.equals("Autista"))
		{
			Autista ar= new Autista();
			ar.setUsername(username);
			ar.setPassword(password);
			Collection<Autista> coll=null;
			try {
				coll = autistadao.doRetrieveAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			boolean logged=false;
			for(Autista ar1:coll)
			{
				
					if((ar.getUsername().equals(ar1.getUsername())) && (ar.getPassword().equals(ar1.getPassword())))
							{
								ar.setCognome(ar1.getCognome());
								ar.setNome(ar1.getNome());
								logged=true;
								request.getSession().setAttribute("autista",ar);
								System.out.println("autista loggato");
								response.sendRedirect("view/home.jsp");
							}
			}
			if(!logged)
			{
				response.sendError(406);
				return;
			}
		}

	}

}
