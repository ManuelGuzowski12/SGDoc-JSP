<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
     <%@ page import= "GestionDocumental.*" %>
     <%@ page import= "adminFisica.*" %>
     <%@ page import= "Usuarios.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Caja a Rack</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	
	 <% 
    	DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy"); 
     %>
     
	body{
		padding-bottom: 70px;
		background-color: #c1bfea;
		font: oblique 120% sans-serif bold;
		font-size: x-large
		}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse">
	<b class="navbar-brand">Insertar Cajas en racks </b>
	</nav>
	<div class = "container">
		
			<div class="row">
				
				<div class="col-md-8"> 
				<br>
				<br>
			<form action="InsertCR.jsp" method="post" class="form-group">
						
						<div>
						<b>Cajas</b>
						<div class="dropdown">
								<select name="id_caja" class="form-control">                      
									<option value="0">Seleccionar Cajas</option>
									
									<% 	Cajas caj = new Cajas();
									ResultSet rs = caj.Recuperarcaj();
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
						
						<br>
						<div>
						<b>Racks</b>
						<div class="dropdown">
								<select name="id_rack" class="form-control">                      
									<option value="0">Seleccionar racks</option>
									
									<% 	Racks rks = new Racks();
									 rs = rks.Recuperar();
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
						<br>
						
						
						<div class="form-group">
							<input type="hidden" class="form-control" value="<% out.println(session.getAttribute("id")); %>" name="id_usuario">
						</div>
						<br>
						
						<div class="form-group">
						<b>Fecha de Registro</b><input type="text" class="form-control" name="fecha" value="<%=fecha.format(new java.util.Date())%>">
						</div>
						
							
						
					<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
				</div>
		   </div>
	</div>

</body>
</html>