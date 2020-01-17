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
<LINK rel= "stylesheet" href="aggiungiCorsa.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>
<%
	Autista autista= (Autista)request.getSession().getAttribute("autista");
	Cliente cliente= (Cliente)request.getSession().getAttribute("cliente");
	Manager manager= (Manager)request.getSession().getAttribute("manager");
	
	if(cliente != null)
	{
%>
 		<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
  <a href="chisiamo.jsp">L'azienda</a>
  <a href="areaPers.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Personalizza il tuo Viaggio </a> 
  	<div class="dropdown-content">
  	<a href="richiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="richiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="richiestaTratta.jsp"> Richiesta Tratta </a>
  	
  	</div>
  	</li>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="logout.jsp" style="float:right">Logout</a>
  
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
 <%}
	
	
	else if(autista != null){%>
	<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
  <a href="areaPers.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="logout.jsp" style="float:right">Logout</a>
  
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
	<%}else if(manager != null){ %>
	
		<div class="topnav">
  <ul> 
 <li> <a href="home.jsp">Home</a> </li>
  <li> <a href="chisiamo.jsp">L'azienda</a> </li>
  <li> <a href="areaPers.jsp">Area Admin</a> </li>
  <li> <a href="eliminaFermata.jsp">Elimina Fermata</a> </li>
  
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Visualizza </a> 
  	<div class="dropdown-content">
  	<a href="corsa.jsp">Le nostre corse</a>
  	<a href="visualizzaAutisti.jsp"> I nostri Autisti </a>
  	<a href="visualizzaAutobus.jsp"> I nostri Bus </a>
  	
  	</div>
  	</li>
  
  
  <li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Aggiungi </a> 
  	<div class="dropdown-content">
  	<a href="aggiungiCorsa.jsp"> Aggiungi Corsa </a>
  	<a href="aggiungiBus.jsp"> Aggiungi Autobus </a>
  	<a href="aggiungiAutista.jsp"> Aggiungi Autista </a>
  	<a href="aggiungiFermata.jsp"> Aggiungi Fermata </a>
  	<a href="aggiungiTratta.jsp"> Aggiungi Tratta </a>
  	</div>
  	</li>
  	
  	<li class="dropdown"> 
  	<a href="javascript:void(0)" class="dropbnt"> Visualizza Richieste </a> 
  	<div class="dropdown-content">
  	<a href="visualizzarichiestaCorsa.jsp"> Richiesta Corsa </a>
  	<a href="visualizzarichiestaFermata.jsp"> Richiesta Fermata </a>
  	<a href="visualizzarichiestaTratta.jsp"> Richiesta Tratta </a>
  	
  	</div>
  	</li>
  	
  	<div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="logout.jsp" style="float:right">Logout</a>
  
</div>
  </ul>
  
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
	<%} else{ %>


<div class="topnav">
<div class="topnavleft" style="padding-left: 60px;
    font-size: 20px;">
  <a href="home.jsp">Home</a>
  <a href="chisiamo.jsp">L'azienda</a>
  <a href="areaPers.jsp">Area Utente</a>
  <a href="corsa.jsp">Le nostre corse</a>
  </div>
  
  <div class="topnavright" style="padding-right: 60px;
    font-size: 20px;">
  <a class="selected" href="login.jsp" style="float:right">Login</a>
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
 
 <%} %>

</body>
</html>