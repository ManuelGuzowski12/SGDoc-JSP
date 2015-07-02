<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*, java.text.*, java.sql.*"%> 
     <%@ page import= "GestionDocumental.*" %>
     <%@ page import= "adminFisica.*" %>
     <%@ page import= "Usuarios.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Departamentos</title>

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

<div class = "container">
		
			<div class="row">
						<div class="col-md-4"> 
					  <div>
						<b>Departamentos </b>
						<div class="dropdown">
								<select name="id_dep" class="form-control">                      
									<option value="0">Seleccionar Departamento</option>
									
									<% 	departamentos dep = new departamentos();
									ResultSet rs = dep.Recuperar();
										while(rs.next())
										{
									%>
										<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
									<%
										}
									%>
									
								</select>
								<br>
								<a href="valida_dep.jsp"><input type="button" value="Ingresar"></a>
							</div>
						</div>
						</div>
			</div>
</div>
</body>
</html>