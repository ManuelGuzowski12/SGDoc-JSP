<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, GestionDocumental.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vizualizar</title>
</head>
<body>

	<%
				//imagenes imagen = new imagenes();
				String id_doc=request.getParameter("id_documento");
				int id = Integer.parseInt(id_doc.trim());
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement(); 
				
				Blob file = null;
		        byte[ ] fileData = null;
		        
		        String sql = "SELECT imagen FROM imagenes WHERE id_documento = '"+id+"'";
		        
		            //InputStream sImage;
		            ResultSet rs= st.executeQuery(sql);
		            if (rs.next()) 
	                {
	                    file = rs.getBlob("imagen");
	                    fileData = file.getBytes(1,(int)file.length());
	                } else 
	                {
	                    out.println("No se encontraron imagenes!");
	                    return;
	                }
	                
	                response.setContentType("application/pdf");
	                response.setHeader("Content-Disposition", "inline");
	                response.setContentLength(fileData.length);
	                OutputStream output = response.getOutputStream();
	                output.write(fileData);
	                output.flush();
	%>
	 <br><br>
     <a href="busqueda.jsp">Regresar</a> 
</body>
</html>