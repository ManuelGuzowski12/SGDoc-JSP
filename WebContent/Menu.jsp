<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import = "UsuariosPK.*"%> 
        <%@ page import = "Modulos.*" %>
	<%@ page import = "Visuales.*"%>
	<%@ page import ="java.sql.ResultSet" %>
	<%@ page import = "java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="css/estilos.css" rel="stylesheet">
    	<script src="js/md5.js" type="text/javascript"></script>
    	<link rel="stylesheet" href="css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8 card card-fondo">
<% 
	String id = session.getAttribute("id").toString();
	if(id ==""){
		out.println("NO HAY DATOS");
	}else{
		LinkedList<Modulos> lista = ModulosDatos.getModuloUsuarioTodos(session.getAttribute("id").toString());
        for (int i=0;i<lista.size();i++){
        	%>
        	<div class="col-md-4 col-sm-6 col-xs-12">
            <div class="card card-f">
                <center><div class="card-image">
                    
                    <span class="card-title"><i class="fa fa-server fa-4x"></i></span>
                </div></center>
                
                <div class="card-content">
                    <p></p>
                </div>
                
                <div class="card-button">
                <center>
                    <form action="<%=lista.get(i).getUrl()%>" method="POST">
                    <input type="hidden" value="<%= lista.get(i).getid()%>" name="id_modulo"/>
                    <button class="btn card-button" type="submit"><%=lista.get(i).getnombre() %></button>
                    </form>
                    
                </center>
                </div>
            </div>
        </div>
        	<%
        	
        }
	}

	%>
		</div>
	</div>
</div>
<script src="js/jquery.js"></script>
		
		<script src="js/bootstrap.js"></script>
		<script src="js/nuevo.js"></script>
</body>
</html>