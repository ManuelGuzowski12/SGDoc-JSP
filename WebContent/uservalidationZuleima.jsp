<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "Usuarios.*"%>
<%@page import= "java.text.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Usuarios user;
	user = new Usuarios();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	user.setUsername(username);
	user.setPassword(password);
	user.Existe();
	if (user.getStatus() == 0)
	{
		user.setUsername("null");	
	}
	else
	{
		session.setAttribute("userlogin", user.getIdusuario());
		response.sendRedirect("FormDB.jsp");
	}
	
%>

	
</body>
</html>