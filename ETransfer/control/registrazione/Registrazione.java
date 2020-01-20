package registrazione;

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
 * Servlet implementation class Registrazione
 */
@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteDAO clientedao= new ClienteDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrazione() {
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
		String nome=request.getParameter("name");
		String cognome=request.getParameter("cognome");
		String ind=request.getParameter("indirizzo");
		String citta=request.getParameter("citta");
		String email=request.getParameter("email");
		String utente=request.getParameter("username");
		String password=request.getParameter("password");
		String confermapassword=request.getParameter("confermapassword");
		String numeroditelefono= request.getParameter("numerotelefono");
		if(nome==null || cognome == null ||ind == null || citta==null || email==null || utente==null || password==null || numeroditelefono == null)
		{
			System.out.println(nome+" "+cognome+" "+ind+" "+ citta+" "+ email+ " "+ utente+" "+password+" "+numeroditelefono);
			return;
		}
		if(password!=confermapassword)
		{
			response.sendError(405);
			return;
		}
		Collection<Cliente> lir;
		try {
			lir=(Collection<Cliente>) clientedao.doRetrieveAll();
			if(lir != null)
			{
				for(Cliente ao:lir)
				{
					if(ao.getUsername().equals(utente))
					{
						response.sendError(410);
						return;
					}
					if(ao.getEmail().equals(email))
					{
						response.sendError(410);
						return;
					}
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Cliente ur=new Cliente();
		ur.setNome(nome);
		ur.setCognome(cognome);
		ur.setIndirizzo(ind);
		ur.setCitta(citta);
		ur.setEmail(email);
		ur.setUsername(utente);
		ur.setPassword(password);
		ur.setNumerotel(Integer.parseInt(numeroditelefono));
		try {
			clientedao.doSave(ur);
			response.sendRedirect("view/regiSuccess.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
