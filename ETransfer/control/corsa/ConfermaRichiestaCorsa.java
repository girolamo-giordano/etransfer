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
import dao.RichiestaCorsaDAO;
import entita.Autobus;
import entita.Corsa;
import entita.Richiestacorsa;

/**
 * Servlet implementation class ConfermaRichiestaCorsa
 */
@WebServlet("/ConfermaRichiestaCorsa")
public class ConfermaRichiestaCorsa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestaCorsaDAO richiestacorsadao= new RichiestaCorsaDAO();
	static CorsaDAO corsadao= new CorsaDAO();
	static AutobusDAO autobusdao= new AutobusDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfermaRichiestaCorsa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idrichcorsa= request.getParameter("idrcor");
		String idautobus=request.getParameter("idbus");
		int costo=Integer.parseInt(request.getParameter("costo"));
		int durata=Integer.parseInt(request.getParameter("durata"));
		try {
			Richiestacorsa richestac= richiestacorsadao.doRetrieveByKey(Integer.parseInt(idrichcorsa));
			Autobus bus= autobusdao.doRetrieveByKey(Integer.parseInt(idautobus));
			Corsa corsa= new Corsa();
			corsa.setBus(bus);
			corsa.setCosto(costo);
			corsa.setDatapart(richestac.getDatapart());
			corsa.setDurata(durata);
			corsa.setFermate(null);
			corsa.setOrapart(richestac.getOrapart());
			corsa.setTratta(richestac.getTratta());
			corsadao.doSave(corsa);
			richiestacorsadao.doDelete(richestac);
			
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/home.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
