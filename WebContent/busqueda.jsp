<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
 <%@ page import= "GestionDocumental.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
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
		ResultSet rs = doc.Buscar();
		
	%>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class="container"> 
		<div class="col-md-4">
		 	<form class="form-group has-feedback">
	       		 <input type="text" id="buscar" class="form-control" placeholder="Buscar documento por...">
	       		 <i class="glyphicon glyphicon-search form-control-feedback"></i>
	         </form>
	      </div>
     </div>
	<div class="container">
		
		<div class="col-md-12"> 
		
				<table class="table table-bordered " id="tabla">
				<tr class="info">
					<th>ID Documento</th>
					<th>Fecha de Creacion</th>
					<th>Nombre</th>
					<th>Vizualizar </th>
				</tr>
				<%
			
					while(rs.next())
			
					{
			
					%>
						<tr >
				
						<td><%=rs.getString("id_documento")%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><a href="vizualizar.jsp?id_documento=<%out.print(rs.getString("id_documento"));%>">Vizualizar</a></td>
						</tr>
					<%
			
					}
			
					%>
					</table>
					<script type="text/javascript">
					$(document).ready(function()
							{
								$('#buscar').keyup(function()
								{
									searchTable($(this).val());
								});
							});
							
							function searchTable(inputVal)
							{
								var table = $('#tabla');
								table.find('tr').each(function(index, row)
								{
									var allCells = $(row).find('td');
									if(allCells.length > 0)
									{
										var found = false;
										allCells.each(function(index, td)
										{
											var regExp = new RegExp(inputVal, 'i');
											if(regExp.test($(td).text()))
											{
												found = true;
												return false;
											}
										});
										if(found == true)$(row).show();else $(row).hide();
									}
								});
							}
					</script>
				
		</div>
	</div>
</body>
</html>