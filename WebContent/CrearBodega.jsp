<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
     <%@ page import= "adminFisica.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
		<title>Crear Bodega</title>
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
			<b class="navbar-brand">Crear Bodega</b>
			</nav>
			<div class = "container">
				
					<div class="row">
						
						<div class="col-md-5"> 
						<br>
						<br>
					<form action="InsertarBodega.jsp" method="post" class="form-group">
							
							<div class="form-group">
								<b>Capacidad</b>
								<br>
								<input type="text" class="form-control" placeholder="Inserte Capacidad" name="capacidad">
							</div>
							
							<div class="form-group">
								<b>Nombre de Bodega</b>
								<br>
								<input type="text" class="form-control" placeholder="Inserte nombre" name="nombre">
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