<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import = "UsuariosPK.*"%> 
        <%@ page import = "Modulos.*" %>
	<%@ page import ="java.sql.ResultSet" %>
	<%@ page import = "java.util.LinkedList"%>
<%
	UsuariosDatos.EliminarUsuario(request.getParameter("id_persona"));
	response.sendRedirect("Usuarios.jsp");
%>