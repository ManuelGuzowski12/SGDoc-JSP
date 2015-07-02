<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
     <%@ page import= "GestionDocumental.*" %>
     <%@ page import= "adminFisica.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Crear Binding</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	body{
		padding-bottom: 70px;
		background-color: #c1bfea;
		font: oblique 120% sans-serif bold;
		font-size: x-large}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse">
	<b class="navbar-brand">Crear Binding</b>
	</nav>
	<div class = "container">
		
			<div class="row">
				
				<div class="col-md-12"> 
				<br>
				<br>
			<form action="InsertBinding.jsp" method="post" class="form-inline"  role="form">
					
					<div class="form-group">
						<b>Tipo de Binding</b>
							<div class="dropdown">
								<select name="tipo_Binding" class="form-control">                      
									<option value="0">Seleccionar tipo de Binding</option>
									
									<% 	Tipos utp = new Tipos();
										ResultSet rs = utp.RecuperarBinding();
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
						<b>Departamentos</b>
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
						<b>Código</b>
						<br>
						<input type="text" class="form-control" placeholder="Inserte Código" name="codigo">
					</div>
					<br>
					<button type="submit" class="btn btn-primary">Enviar</button>
					
					</form>
				 </div>
			       
					
					
			
	 
			</div>
				
     </div>

</body>
</html>