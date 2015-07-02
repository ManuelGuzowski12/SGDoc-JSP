<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*, java.text.*"%> 
    <%@ page import= "GestionDocumental.*" %>
    <%@ page import= "adminFisica.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Racks rsk = new Racks();
Bodega bod = new Bodega();
Rack_bodega rbod = new Rack_bodega();

String rk = request.getParameter("id_rack");
int id_rack = Integer.parseInt(rk.trim());
rbod.setId_rack(id_rack);

String bog = request.getParameter("id_bodega");
int id_bodega = Integer.parseInt(bog.trim());
rbod.setId_bodega(id_bodega);

String id_user = request.getParameter("id_usuario");
int id_usuario = Integer.parseInt(id_user.trim());
rbod.setId_usuario(id_usuario);
	
String fecha = request.getParameter("fecha");
rbod.setFecha_insert(fecha);

rbod.insertRack_bodega();

%>
<b>Rack guardado en la Bodega</b>
<a href=FormRB.jsp>Regresar</a>
</body>
</html>