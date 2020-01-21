package autobus;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutistaDAO;
import dao.AutobusDAO;
import entita.Autobus;

/**
 * Servlet implementation class AggiungiAutobus
 */
@WebServlet("/AggiungiAutobus")
public class AggiungiAutobus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static AutobusDAO autobusdao= new AutobusDAO();
	static AutistaDAO autistadao= new AutistaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAutobus() {
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
		String modello= request.getParameter("modello");
		int numeroposti=Integer.parseInt(request.getParameter("numeroPosti"));
		int anno=Integer.parseInt(request.getParameter("anno"));
		int km=Integer.parseInt(request.getParameter("km"));
		int idautobus=Integer.parseInt(request.getParameter("autista"));
		if(numeroposti<0|| numeroposti>999 || anno<1990 || anno>2020 || km<0 || km>999999999 || modello.length()<3 || modello.length() >20 )
		{
			response.sendError(406);
			return;
		}
		Autobus bus= new Autobus();
		
		try {
			bus.setAnnoimm(anno);
			bus.setAutista(autistadao.doRetrieveByKey(idautobus));
			bus.setChilometri(km);
			bus.setNumeroposti(numeroposti);
			bus.setModello(modello);
			autobusdao.doSave(bus);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/aggiunta.jsp");
	}

}
