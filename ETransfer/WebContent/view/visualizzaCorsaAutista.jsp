<%@page import="java.util.ArrayList"%>
<%@page import="entita.Corsa"%>
<%@page import="java.util.Collection"%>
<%@page import="dao.CorsaDAO"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corse Autista</title>
</head>
<body>
<%
Autista autista= (Autista)request.getSession().getAttribute("autista");
CorsaDAO corsadao= new CorsaDAO();
Collection<Corsa> corse= corsadao.doRetrieveAll();
ArrayList<Corsa> corsefinali=new ArrayList<Corsa>();
if(autista != null)
{
	for(Corsa c:corse)
	{
		System.out.println(autista.getId());
		if(c.getBus().getAutista().getId()==autista.getId())
		{
			corsefinali.add(c);
		}
	}
	for(Corsa c:corsefinali)
	{
%>
	autista <%=c.toString() %>
<%	} 
}
%>
</body>
</html>