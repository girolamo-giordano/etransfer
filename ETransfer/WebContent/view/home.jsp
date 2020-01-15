<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ETransfer</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
</head>
<header class="top"> 
<img src="../foto/logo.jpeg">
</header>
<body>
	<nav>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Azienda</a></li>
		
		<li class="dropdown"><a href="areautente.jsp">Area Cliente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei viaggi</a>
    		</div>
		</li>
			
	
		
		
		<li><a href="catalogo.jsp">Corse</a></li>
		<div id="lright">
			<li><a href="login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrati</a></li>
			
		</div>
	</ul>
	</div>
	</nav>
	<div>
		<img id="imageHome" src="../foto/pullman.jpg">
	</div>
	
	<div>
		<img id="barra" src="../foto/barra.png">
	</div>
	
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