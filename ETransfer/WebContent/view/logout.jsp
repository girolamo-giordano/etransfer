<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<form>
<div class="succText"> Logout effettuato con successo, sarai reindirizzato alla homepage
<%
request.getSession().setAttribute("cliente",null);
request.getSession().setAttribute("autista", null);
request.getSession().setAttribute("manager",null);
%> </div>
<script>
  setTimeout(function() {
      document.location = "home.jsp";
  }, 2000);
</script>
</form>
</body>
</html>