<%@page import="utenti.Manager"%>
<%@page import="utenti.Cliente"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ETransfer</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
</head>
<body>
<%
	Autista autista= (Autista)request.getSession().getAttribute("autista");
	Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");
	Manager manager= (Manager)request.getSession().getAttribute("manager");
	
	if(cliente != null)
	{
%>
 		Ciao cliente <%=cliente.getNome() %>
 <%}
	if(autista != null){%>
	Ciao autista <%=autista.getNome() %>
	<%}if(manager != null){ %>
	
	ciao manager <%=manager.getNome() %>
	<%} %>

<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>


<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
  <a href="chisiamo.jsp">L'azienda</a>
  <a href="areautente.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a href="Login.jsp" style="float:right">Login</a>
  <a href="registrazione.jsp" style="float:right">Registrazione</a>
</div>
</div>

<div class="row">
  <div class="leftcolumn">
   

      <div class="busimg">
       
      <a href="flotta.jsp">
       <img src="../foto/pullman.jpg"> 
       </a>
      </div>
      
       <div class="barraimg">
      <a href="barra.jsp">
       <img style="margin-top: 143px;
    margin-left: 35px;" src="../foto/barra.png">
       </a>
      </div>
      

     
    
    
    
    
  </div>
  
  
  <div class="rightcolumn">
    <div class="card">
      <h2 style="padding-left:85px">Chi siamo</h2>
      <div class="fakeimg" style="height:100px;">
      <a href="chisiamo.jsp">
       <img style="height:208px; width:322px" src="../foto/chisiamo.png">
       </a>
       </div>
      
    </div>
    
    
   <div class="card">
      <h3 style="padding-left:85px">Corse Consigliate</h3>
      <div class="fakeimg">
      <a href="corsa.jsp">
       <img src="../foto/andriaroma.png">
       </a>
       </div>
       
     <div class="fakeimg"><a href="corsa.jsp">
       <img src="../foto/barimatera.png">
       </a>
       </div>
       
      <div class="fakeimg"><a href="corsa.jsp">
       <img src="../foto/foggiamilano.png">
       </a>
       </div>
    </div>
    
  </div>
</div>

<div class="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>