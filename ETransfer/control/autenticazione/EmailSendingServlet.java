package autenticazione;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import utenti.Cliente;
import utils.EmailUtility;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	static ClienteDAO clientedao= new ClienteDAO();
    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = request.getParameter("recipient");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        boolean find=false;
 
        String resultMessage = "";
 
        try {
        	Collection<Cliente>clienti= clientedao.doRetrieveAll();
        	for(Cliente c:clienti)
        	{
        		System.out.println("emaill:"+c.getEmail());
        		if(c.getEmail().equals(recipient))
        		{
        			find=true;
        			content="Caro "+c.getNome()+" ecco le sue credenziali che ha richiesto\n Username:"+c.getUsername()+"\n Password:"+c.getPassword();
        		}
        	}
        	System.out.println("Content:"+content+" Subject:"+subject);
        	if(find)
        	{
	            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content);
	            resultMessage = "L'email con le tue credenziali è stata inviata con successo";
        	}
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/view/Result.jsp").forward(
                    request, response);
        }
    }
}