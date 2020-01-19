<%@page import="utenti.Manager"%>
<%@page import="utenti.Autista"%>

<%@page import="java.util.Collection"%>
<%@page import="entita.Biglietto"%>
<%@page import="dao.BigliettoDAO"%>
<%@page import="utenti.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Area Personale</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="areaPers.css" type="text/css">

</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

<%
	Autista a= (Autista)request.getSession().getAttribute("autista");
	Cliente c= (Cliente)request.getSession().getAttribute("cliente");
	Manager m= (Manager)request.getSession().getAttribute("manager");
	BigliettoDAO bigliettodao= new BigliettoDAO();
	Collection<Biglietto> biglietti= bigliettodao.doRetrieveAll();
	
	if(c != null)
	{
%>
 		
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Utente</a> </li>
		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
		
		<li class="dropdown4"><a href="#">Personalizza Viaggio</a>
		
 			 <div class="dropdown4-content">
   				 <a href="richiestaCorsa.jsp"> Richiesta Corsa </a>
    				<a href="richiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="richiestaTratta.jsp"> Richiesta Tratta </a>
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	
	<div style="margin-top:80px;">


</div>



<form id="form">
<h2><center> Ciao <%=c.getNome() %> <%=c.getCognome() %></center></h2>

<fieldset class="field">
	
		<div class="tableRow">
			<label class="rcolor" for="indirizzo">Indirizzo</label>
			<input type="text" id="indirizzo" name="indirizzo" value= <%=c.getIndirizzo() %> readonly> 
			<a href="cambioIndirizzo.jsp">Modifica Indirizzo </a>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="provincia">Provincia </label>
 			<input type="text" id="provincia" name="provincia" value= <%=c.getCitta() %> readonly>
        
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="email">Email</label>
			<input type="email" id="email" name="email" value= <%=c.getEmail() %> readonly>
			<a href="cambioEmail.jsp">Modifica Email </a>
		</div>
		
		<div class="tableRow">
			<label class="rcolor" for="email">Telefono</label>
			<input type="number" id="telefono" name="numerotelefono" value= <%=c.getNumerotel()%> readonly>
		</div>
		
		
		
		</fieldset>
		
		<fieldset class="field">
			
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username</label>
			<input type="text" id="user" name="username" value= <%=c.getUsername()%> readonly> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password</label>
			<input type="password" id="Password" name="Password" value="*****" readonly>
			<a href="cambioPass.jsp">Modifica Password </a>

		</div>
		
		
	</fieldset>
	</form>
	<center><h2 style="
    color: #333;
    margin-top: 65px;
">I tuoi biglietti acquistati: </h2> </center>
	
	<%
	for(Biglietto b:biglietti)
	{
		if(c.getId()==b.getCliente().getId())
		{

		
%>

	
	
	
	<table>
 
  <tr>
    <td>Quantita</td>
    <td>Data acquisto</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td> <%=b.getQuantita() %></td>
    <td><%=b.getAcquistodata() %></td>
    <td></td>
    <td></td>
    
  </tr>
  <tr>
    <td>Data</td>
    <td>Orario</td>
    <td>Partenza</td>
    <td>Arrivo</td>
  </tr>
  <tr>
    <td><%=b.getCorsa().getDatapart() %></td>
    <td><%=b.getCorsa().getOrapart() %></td>
    <td><%=b.getCorsa().getTratta().getPartenza() %></td>
     <td><%=b.getCorsa().getTratta().getArrivo() %></td>
  </tr>
  <tr>
    <td>Nome e cognome</td>
    <td>Duarata Viaggio</td>
    <td></td>
  </tr>
  <tr>
    <td><%=b.getCliente().getNome() %> <%=b.getCliente().getCognome()%></td>
    <td><%=b.getCorsa().getDurata() %></td>
    <td></td>
    
    <td><%=b.getCorsa().getCosto() %></td>
  </tr>
</table>
<%	}
	%>	<div style="
    margin-top: 35px;
"> </div> <% 
	}
}

	
	
	
	
	if(a != null){%>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Utente</a> </li>
		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
		
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	
	<div style="margin-top:80px;">


</div>
	
	<form id="form">
<h2><center> Ciao <%=a.getNome() %> <%=a.getCognome() %></center></h2>
<fieldset class="field">
			
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username</label>
			<input type="text" id="user" name="username" value= <%=a.getUsername()%> readonly> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password</label>
			<input type="password" id="Password" name="Password" value="*****" readonly>
			<a href="cambioPass.jsp">Modifica Password </a>

		</div>
		
		
	</fieldset>
	</form>
	
	<%}else if(m != null){ %>
<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li> <a href="chisiamo.jsp">L'azienda</a></li>
		<li> <a href="areaPers.jsp">Area Admin</a> </li>
		<li> <a href="eliminaFermata.jsp">Elimina Fermata</a> </li>
		
		<li class="dropdown"><a href="#">Visualizza</a>
		
 			 <div class="dropdown-content">
   				 <a href="corsa.jsp"> Le nostre Corse </a>
    			<a href="visualizzaAutisti.jsp"> I nostri autisti </a>
  				<a href="visualizzaAutobus.jsp">I nostri bus </a>
    		</div>
		</li>
		
		<li class="dropdown1"><a href="#">Aggiungi</a>
		
 			 <div class="dropdown1-content">
   				<a href="aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="aggiungiTratta.jsp"> Aggiungi Tratta </a>
    		</div>
		</li>
		
		<li class="dropdown2"><a href="#">Visualizza Richieste</a>
		
 			 <div class="dropdown2-content">
   				 <a href="visualizzarichiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="visualizzarichiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="visualizzarichiestaTratta.jsp"> Richiesta Tratta </a>
  	
    		</div>
		</li>
		
		<div id="lright" style="float:right">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
  	

<div style="margin-top:80px;">


</div>


<form id="form">
<h2><center> Ciao <%=m.getNome() %> <%=m.getCognome() %></center></h2>
<fieldset class="field">
			
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username</label>
			<input type="text" id="user" name="username" value= <%=m.getUsername()%> readonly> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password</label>
			<input type="password" id="Password" name="Password" value="*****" readonly>
			<a href="cambioPass.jsp">Modifica Password </a>
		</div>
		
		
	</fieldset>
	</form>
	<%} %>


</body>
</html>