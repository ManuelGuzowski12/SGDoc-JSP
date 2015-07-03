<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
 <%@ page import= "GestionDocumental.*" %>
 
<!DOCTYPE html>
<html>
<head>
<title>Registrar Documento</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	body{
		padding-bottom: 70px;
		background-color: #eeeff4;
		font-family: Lucida Grande, "Tahoma";}
</style>
</head>
<body>
    <% 
    	DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy"); 
    %>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class = "container">
		
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4"> 
				<h1><span class="label label-info visible-lg">Registrar Documento</span></h1><br>
				<form action="plantilla.jsp" method="post">
					<div class="form-group">
						<b>Nombre del Documento</b><input type="text" class="form-control" placeholder="Nombre del Documento" name="nombre_doc">
					</div>
					<div class="form-group">
						<b>Fecha de Registro</b><input type="text" class="form-control" name="fecha" value="<%=fecha.format(new java.util.Date())%>">
					</div>
					<div class="form-group">
						<b>Tipo de Documento</b>
							<div class="dropdown">
								<select name="tipo_doc" class="form-control">                      
									<option value="0">Seleccionar tipo de Documento</option>
									
									<% 	tipo_doc user = new tipo_doc();
										ResultSet rs = user.Recuperar();
										while(rs.next())
										{
									%>
										<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
									<%
										}
									%>
								</select>
							</div>
					</div>
						<div class="form-group">
						<b>Departamento</b>
							<div class="dropdown">
								<select name="id_dep" class="form-control">                      
									<option value="0">Seleccionar Departamento</option>
									
									<% 	departamentos dep = new departamentos();
										rs = dep.Recuperar();
										while(rs.next())
										{
									%>
										<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
									<%
										}
									%>
								</select>
							</div>
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" value="<% out.println(session.getAttribute("id")); %>" name="username">
					</div>
					<button type="submit" class="btn btn-lg btn-primary btn-block" >Enviar</button>
				</form>
				</div>
				<div class="col-md-4"></div>
			</div>
	</div>
	
</body>
</html>