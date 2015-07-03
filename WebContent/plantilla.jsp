<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
 <%@ page import= "GestionDocumental.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Plantilla Documento</title>
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
		plantillas plantilla = new plantillas();
		tipo_doc tipo = new tipo_doc();
		departamentos dep = new departamentos();
		
    %>
	<nav class="navbar navbar-default navbar-inverse">
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"aria-hidden="true"> Home</span></a>
	</nav>
	<div class = "container">
		
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4"> 
					
					<h1><span class="label label-info visible-lg">Ingresar Datos</span></h1><br>
					<form method="post" action="insertar_doc.jsp">
						<div class="form-group">
							<%String id_dep = request.getParameter("id_dep"); %>
							<input type="hidden" class="form-control" value="<%=id_dep%>" name="id_dep">
						</div>
						<div class="form-group">
							<%String nombre = request.getParameter("nombre_doc"); %>
							<input type="hidden" class="form-control" value="<%=nombre%>" name="nombre">
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" name="fecha" value="<%=fecha.format(new java.util.Date())%>">
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" value="<% out.println(session.getAttribute("id")); %>" name="username">
						</div>
						<%	int tipo_doc = Integer.parseInt(request.getParameter("tipo_doc"));
							
							tipo.setId(tipo_doc);
							ResultSet t = tipo.GetbyTipo();
							while(t.next())
							{
						%>
						<div class="form-group">
							<input type="hidden" class="form-control" value="<%=t.getString(1)%>" name="tipodoc">
						</div>
						<% 
							}
							plantilla.setIdtipodoc(tipo_doc);
							ResultSet rs = plantilla.Plantilla();
							while(rs.next())
							{
								
							%>
							<div class="form-group">
								<b><%=rs.getString(3)%></b><input type="text" class="form-control" name="<%=rs.getString(2) %>">
							</div>
							<%
							}
							
							%>
							
							<button type="submit" class="btn btn-lg btn-primary btn-block" >Resgistrar Documento</button>
					</form>
				</div>
				
				<div class="col-md-4"></div>
			</div>
	</div>
</body>
</html>