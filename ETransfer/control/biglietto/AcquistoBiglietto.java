package biglietto;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutobusDAO;
import dao.BigliettoDAO;
import dao.ClienteDAO;
import dao.CorsaDAO;
import entita.Biglietto;
import entita.Corsa;
import utenti.Cliente;

/**
 * Servlet implementation class AcquistoBiglietto
 */
@WebServlet("/AcquistoBiglietto")
public class AcquistoBiglietto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CorsaDAO corsadao= new CorsaDAO();
	static BigliettoDAO bigliettodao= new BigliettoDAO();
	static ClienteDAO clientedao= new ClienteDAO();
	static AutobusDAO autobusdao= new AutobusDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcquistoBiglietto() {
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
		String numbiglietti= request.getParameter("numbiglietti");
		String idcorsa= request.getParameter("idcorsa");
		int idcliente=Integer.parseInt(request.getParameter("idcliente"));
		SimpleDateFormat formatter= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date data= new Date();
		Corsa corsa=null ;
		Cliente cliente=null;
		try {
			corsa = corsadao.doRetrieveByKey(Integer.parseInt(idcorsa));
			cliente=clientedao.doRetrieveByKey(idcliente);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(corsa.getBus().getNumeroposti()>= Integer.parseInt(numbiglietti))
		{
			int numeropostibus=corsa.getBus().getNumeroposti();
			numeropostibus=numeropostibus-Integer.parseInt(numbiglietti);
			corsa.getBus().setNumeroposti(numeropostibus);
		Biglietto biglietto= new Biglietto();
				biglietto.setCliente(cliente);
				biglietto.setCorsa(corsa);
				biglietto.setQuantita(Integer.parseInt(numbiglietti));
				biglietto.setAcquistodata(formatter.format(data));
				try {
					bigliettodao.doSave(biglietto);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			try {
				autobusdao.doUpdate(corsa.getBus());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
		}
		else
		{
			System.out.println("Posti non disponibili");
			return;
		}
		
		response.sendRedirect("view/home.jsp");
	}

}
