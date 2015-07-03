<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/colorgraph.css">
<style type="text/css">
	body{
		padding-bottom: 70px;
		background-color: #eeeff4;
		font-family: Lucida Grande, "Tahoma";}
</style>
<title>Mensaje</title>
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class = "container">
		
			<div class="row">
			
				<div class="col-md-4"></div>
				<div class="col-md-4">
						<h3><span class="label label-danger visible-lg"><%=request.getAttribute("Message") %></span></h3>
						<hr class="colorgraph-01"><br>
						<form action="imagen.jsp" class="form-inline">
							<button type="submit" class="btn btn-lg btn-success btn-block">
								Agregar Imagen  <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
							</button>
						</form><br>
						<form action="registrar_documento.jsp" class="form-inline">
							<button type="submit" class="btn btn-lg btn-primary btn-block">
								Registrar Documento Nuevo  <span class="glyphicon glyphicon-open-file" aria-hidden="true"></span>
							</button>
						</form><br>
						<form action="busqueda.jsp" class="form-inline">
							<button type="submit" class="btn btn-lg btn-info btn-block">
								Buscar Documento  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</form>
				</div>
				<div class="col-md-4"></div>
			</div>
	</div>
</body>
</html>