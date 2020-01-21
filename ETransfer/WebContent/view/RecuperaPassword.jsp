<%@page import="utenti.Manager"%>
<%@page import="utenti.Cliente"%>
<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recupera password</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
</head>
<body>
<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

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
  

<div style="margin-top:80px;">


</div>
<div id="form">
	<form action="../EmailSendingServlet" method="post">
		<fieldset>
		<h2 id=titolo> Recupero Password</h2>
			<fieldset id="primoF">
				<div class="tableRow">
					<label class="rcolor" for="username">Indirizzo Email:</label>
					<input type="text" id="username"  name="recipient" placeholder="Inserire email.." required> 
				</div>
				
				<div class="tableRow">
					<input type="hidden"  value="Recupero Password" name="subject" size="50"/>
				</div>
			</fieldset>
			
	<input class="submit" type="submit" value="Invia" style="margin-left: 140px;"/>
          
          </fieldset>
		</div>
        
           
        
        
         
    </form>
</div>
</body>
</html>