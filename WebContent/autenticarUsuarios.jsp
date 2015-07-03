<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "UsuariosPK.*"%> 
	<%@ page import = "Visuales.*"%>
	<%@ page import ="java.sql.ResultSet" %>
	<%@ page import = "java.util.LinkedList"%>
	<% String user = request.getParameter("nick");
		String pass= request.getParameter("pass");
	if(UsuariosDatos.Auth(user, pass)){
		String id = UsuariosDatos.buscarId(user, pass);
		session.setAttribute("id", id );
		request.getRequestDispatcher("Menu.jsp").forward(request, response);
		
	}else{
		request.setAttribute("errorMSG", "No Estas Resgistrado");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		
		response.sendRedirect("./Login.jsp");
	}
	
	%>
