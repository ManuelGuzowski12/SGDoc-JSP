<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
 <%@ page import= "GestionDocumental.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/colorgraph.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.file-input.js"></script>
<script type="text/javascript" charset="UTF-8" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="js/bootstrap.min.js"></script>
<style type="text/css">
	body{
		padding-bottom: 70px;
		background-color: #eeeff4;
		font-family: Lucida Grande, "Tahoma";}
</style>
<title>Busqueda SGDoc</title>
</head>
<body>
	<% 
		documentos doc = new documentos();
		ResultSet rs = doc.Recuperar();
		
	%>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class="container">
		
		<div class="col-md-12"> 
		
				<table class="table table-bordered table-striped display" id="myTable">
				<thead>
				<tr class="info">
					<th>ID Documento</th>
					<th>Fecha de Creacion</th>
					<th>Id usuario </th>
					<th>Nombre</th>
					<th>Departamento</th>
					<th>Vizualizar </th>
					<th>Editar</th>
				</tr>
				</thead>
				<tbody>
				<%
					while(rs.next())	
					{
					%>
						<tr>
						<td><%=rs.getString("id_documento")%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getInt(3) %></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getInt(6) %></td>
						<td><a class="btn btn-info" href="vizualizar.jsp?id_documento=<%out.print(rs.getString("id_documento"));%>">Vizualizar</a></td>
						<td><a class="btn btn-success" href="editardoc.jsp?id_documento=<%out.print(rs.getString("id_documento"));%>">Modificar</a></td>
						</tr>
					<%			
					}
					%>
					</tbody>
					</table>
					<script type="text/javascript">
					 $(document).ready(function(){
			                $('#myTable').DataTable();
			            });
					</script>
				
		</div>
	</div>
</body>
</html>