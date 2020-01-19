package corsa;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RichiestaCorsaDAO;
import dao.TrattaDAO;
import entita.Richiestacorsa;
import entita.Richiestatratta;
import entita.Tratta;

/**
 * Servlet implementation class AggiungiRichiestaCorsa
 */
@WebServlet("/AggiungiRichiestaCorsa")
public class AggiungiRichiestaCorsa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestaCorsaDAO richiestacorsadao= new RichiestaCorsaDAO();
	static TrattaDAO trattadao= new TrattaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiRichiestaCorsa() {
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
		String data= request.getParameter("data");
		String ora= request.getParameter("ora");
		int trattaid=Integer.parseInt(request.getParameter("idtratta"));
		Richiestacorsa richiestacorsa=new Richiestacorsa();
		try {
			Tratta tratta= trattadao.doRetrieveByKey(trattaid);
			richiestacorsa.setTratta(tratta);
			richiestacorsa.setDatapart(data);
			richiestacorsa.setOrapart(ora);
			richiestacorsadao.doSave(richiestacorsa);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("view/home.jsp");
		
	}

}
