package utenti;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutistaDAO;

/**
 * Servlet implementation class AggiungiAutista
 */
@WebServlet("/AggiungiAutista")
public class AggiungiAutista extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static AutistaDAO autistadao= new AutistaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAutista() {
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
		String nome=request.getParameter("nome");
		String cognome=request.getParameter("cognome");
		String username=request.getParameter("username");
		String password=request.getParameter("pass");
		if(nome.length()<3 || nome.length()>25 || cognome.length()<3 || cognome.length()>25 || username.length()<3 || username.length()>25 || password.length()<3 || password.length()>25)
		{
			response.sendError(406);
			return;
		}
		Autista autista= new Autista();
		autista.setNome(nome);
		autista.setCognome(cognome);
		autista.setUsername(username);
		autista.setPassword(password);
		try {
			Collection<Autista> autisti=autistadao.doRetrieveAll();
			for(Autista a:autisti)
			{
				if(a.getUsername().equals(username))
				{
					response.sendError(408);
					return;
				}
			}
			autistadao.doSave(autista);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Errore"+e.toString());
		}
		
		response.sendRedirect("view/aggiunta.jsp");
		
	}

}
