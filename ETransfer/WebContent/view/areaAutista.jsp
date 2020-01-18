<%@page import="utenti.Autista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Area Autista</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="areaPers.css" type="text/css">

</head>
<body>

<div id="logo"> 
<img style="height: 290px;
    margin-left: 87px;" src="../foto/logo.jpeg">
</div>

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

<%Autista c=(Autista)request.getSession().getAttribute("autista"); %>

<form id="form">
<h2><center> Ciao <%=c.getNome() %> <%=c.getCognome() %></center></h2>
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


</body>
</html>