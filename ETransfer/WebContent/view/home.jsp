<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ETransfer</title>
</head>
<header class="top"> 
<img src="../foto/etransfer.png">
</header>
<body>
	<nav>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Chi siamo</a></li>
		
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei viaggi</a>
    		</div>
		</li>
			
	
		
		
		<li><a href="catalogo.jsp">Corse</a></li>
		<div id="lright">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrati</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
	</nav>
<div class="fadein">
 <div id="footer">
      &copy; 2020, E-Transfer
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</div>
</body>
</html>