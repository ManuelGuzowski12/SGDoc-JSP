<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>
  <%@page import="org.json.simple.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema","root","");


PreparedStatement  st =con.prepareStatement("INSERT INTO inventarios(id,marca,modelo,descripcion,serie) values(?,?,?,?,?)");
st.setString(1,request.getParameter("idinv"));
st.setString(2,request.getParameter("marca"));
st.setString(3,request.getParameter("modelo"));
st.setString(4,request.getParameter("descripcion"));
st.setString(5,request.getParameter("serie"));

st.execute();


ResultSet rs = st.executeQuery("select * from inventarios where id = '"+ request.getParameter("idinv") +"'");
boolean listo = false;
while(rs.next()){
	listo = true;
	
}
JSONObject obj=new JSONObject();
if(listo==true){
	
    obj.put("mensaje","1");
    out.print(obj);
    out.flush();
}else{
	obj.put("mensaje","0");
	out.print(obj);
    out.flush();
}
%>
