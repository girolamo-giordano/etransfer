package corsa;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AutobusDAO;
import dao.CorsaDAO;
import dao.TrattaDAO;
import entita.Autobus;
import entita.Corsa;
import entita.Tratta;

/**
 * Servlet implementation class AggiungiCorsa
 */
@WebServlet("/AggiungiCorsa")
public class AggiungiCorsa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CorsaDAO corsadao=new CorsaDAO();
	static TrattaDAO trattadao= new TrattaDAO();
	static AutobusDAO autobusdao= new AutobusDAO();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiCorsa() {
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
		String tratta=request.getParameter("tratta");
		String busid=request.getParameter("bus");
		String data=request.getParameter("data");
		String orapart=request.getParameter("ora");
		String durata=request.getParameter("durata");
		Tratta trattae;
		Autobus autobus;
		Corsa corsa= new Corsa();
		try {
			trattae = trattadao.doRetrieveByKey(Integer.parseInt(tratta));
			System.out.println("numid tratta"+trattae);
			autobus= autobusdao.doRetrieveByKey(Integer.parseInt(busid));
			corsa.setTratta(trattae);
			corsa.setBus(autobus);
			corsa.setDatapart(data);
			corsa.setDurata(Integer.parseInt(durata));
			corsa.setOrapart(orapart);
			corsa.setFermate(null);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			corsadao.doSave(corsa);
			response.sendRedirect("view/home.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
