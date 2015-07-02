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
	Cajas caja = new Cajas();
	departamentos depto = new departamentos();
	Caja_rack cajar = new Caja_rack();
	Tipos tipo = new Tipos();
	
	 int idrack;
	 int iddep;
	 int cap;
	 int tipr;
	 int cont;
	
	String caj = request.getParameter("id_caja");
	int id_caja = Integer.parseInt(caj.trim());
	cajar.setId_caja(id_caja);
	
	
	String rk = request.getParameter("id_rack");
	int id_rack = Integer.parseInt(rk.trim());
	cajar.setId_rack(id_rack);
	 
		
	String id_user = request.getParameter("id_usuario");
	int id_usuario = Integer.parseInt(id_user.trim());
	cajar.setId_usuario(id_usuario);
		
	String fecha = request.getParameter("fecha");
	cajar.setFecha_insert(fecha);
	
	
	idrack = rsk.GetId_dep(id_rack);
	iddep = caja.GetId_dep(id_caja);
	//-----------------------------
	tipr = tipo.Get_tiprack(id_rack);
	cap =  tipo.RecuperarcapR(tipr);
	cont = cajar.count(id_rack);
	
	if((idrack == iddep) && (cont < cap))
	{
		cajar.insertCaja_rack();
		out.println("<h3>Creado Correctamente</h3>");
		out.println(cont);
		out.println(cap);
	}
	else
		out.println("<b>Inserte en departamento indicado o en un binding que tenga espacio</b>");
		
	%>
	
	<a href=FormCR.jsp>Regresar</a>
</body>
</html>