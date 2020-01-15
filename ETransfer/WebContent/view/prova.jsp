<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="utenti.*"%>
<%@page import="entita.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager</title>
</head>
<body>
<%
	AutistaDAO autistadao= new AutistaDAO();
	BigliettoDAO managerdao= new BigliettoDAO();
	AutobusDAO autobusdao= new AutobusDAO();
	TrattaDAO trattadao= new TrattaDAO();
	CorsaDAO corsadao= new CorsaDAO();
	ClienteDAO clientedao= new ClienteDAO();
	FermataDAO fermatadao= new FermataDAO();
	Biglietto manager= new Biglietto();
	Autista autista= new Autista();
	autista.setNome("gan");
	autista.setCognome("aomo");
	autista.setUsername("qsdi");
	autista.setPassword("art");
	autista.setId(4);
	Autobus bus= new Autobus();
	bus.setAnnoimm(2001);
	bus.setAutista(autista);
	bus.setChilometri(3002);
	bus.setId(8);
	bus.setModello("carsi");
	bus.setNumeroposti(223);
	//autobusdao.doSave(bus);
	Tratta tratta= new Tratta();
	tratta.setArrivo("maksido");
	tratta.setPartenza("otrsato");
	tratta.setId(2);
	Cliente aut= new Cliente();
	Corsa corsa= new Corsa();
	corsa.setBus(bus);
	corsa.setDatapart("11");
	corsa.setDurata(89);
	corsa.setFermate(null);
	corsa.setId(6);
	corsa.setOrapart("34");
	corsa.setTratta(tratta);
	//corsadao.doSave(corsa);
	aut.setId(1);
	aut.setNome("Miskc");
	aut.setCognome("acomo");
	aut.setUsername("qolsdi");
	aut.setPassword("akort");
	//clientedao.doSave(aut);
	manager.setCliente(aut);
	manager.setCorsa(corsa);
	manager.setNumerobigl(14);
	//managerdao.doUpdate(manager);
	//managerdao.doRetrieveByKey(5);
	Fermata fer=new Fermata();
	fer.setCorsa(corsa);
	fer.setNomefermata("cangos");
	fer.setId(1);
	//fermatadao.doSave(fer);
	//System.out.println(trattadao.doRetrieveByKey(1));
	trattadao.doDelete(tratta);
	Collection<Tratta> managers= trattadao.doRetrieveAll();
	for(Tratta m:managers)
	{
		

%>
	<%=m.toString() %></br>
	ID: <%=m.getId()%></br>
	
<%
	}
	
%>
</body>
</html>