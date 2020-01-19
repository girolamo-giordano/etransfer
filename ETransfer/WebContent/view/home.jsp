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

<div class="row">
  <div class="leftcolumn">
   

      <div class="busimg" style="
    position: relative;
    top: -20px;">
       <h2 style="
    left: 660px;
    position: relative;
    top: 115px;
"> I nostri autobus</h2>
       
      <a href="visualizzaAutobus.jsp">
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
	

<div class="row">
  <div class="leftcolumn">
   

      <div class="busimg" style="
    position: relative;
    top: -20px;">
       <h2 style="
    left: 660px;
    position: relative;
    top: 115px;
"> I nostri autobus</h2>
       
      <a href="visualizzaAutobus.jsp">
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
  	

  </ul>
  
</div>
  
 

<div class="row">

  <div class="leftcolumn">
   

      <div class="busimg" style="
    position: relative;
    top: -20px;">
       <h2 style="
    left: 660px;
    position: relative;
    top: 115px;
"> I nostri autobus</h2>
      <a href="visualizzaAutobus.jsp">
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




	
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp">L'azienda</a> </li>
  		<li> <a href="corsa.jsp">Le nostre corse</a> </li>
  		<li> <a href="visualizzaAutobus.jsp">I nostri autobus</a> </li>
		
		
		
		<div id="lright" style="float:right">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrazione</a></li>
		</div>
	</ul>
	</div>

<div class="row">
  <div class="leftcolumn">
   

     <div class="busimg" style="
    position: relative;
    top: -20px;">
       <h2 style="
    left: 660px;
    position: relative;
    top: 115px;
"> I nostri autobus</h2>
       
      <a href="visualizzaAutobus.jsp">
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