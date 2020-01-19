package corsa;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RichiestaCorsaDAO;
import entita.Richiestacorsa;

/**
 * Servlet implementation class EliminaRichiestaCorsa
 */
@WebServlet("/EliminaRichiestaCorsa")
public class EliminaRichiestaCorsa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RichiestaCorsaDAO richiestacorsadao= new RichiestaCorsaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaRichiestaCorsa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idrichco= Integer.parseInt(request.getParameter("idrichco"));
		try {
			Richiestacorsa richiestacorsa= richiestacorsadao.doRetrieveByKey(idrichco);
			richiestacorsadao.doDelete(richiestacorsa);
		} catch (SQLException e) {
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
