<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "UsuariosPK.*"%> 
<%@ page import = "Visuales.*"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/estilos.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
        <ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
  <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home"></div>
  <div role="tabpanel" class="tab-pane" id="profile"><%@ include file="Usuarios.jsp" %></div>
  <div role="tabpanel" class="tab-pane" id="messages"></div>
  <div role="tabpanel" class="tab-pane" id="settings">...</div>
</div>

<script>
  
</script>
  </div>
</div>
<script src="js/jquery.js"></script>

<script src="js/bootstrap.js"></script>
<script src="js/nuevo.js"></script>
</body>
</html>