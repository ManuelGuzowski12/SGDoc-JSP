<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>
<%@page contentType="text/html; charset=UTF-8"%>
  <%@page import="org.json.simple.*"%>
  
<%

String username=request.getParameter("username");
//username = "4-764-1881";
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SGdoc","root","");

Statement st=con.createStatement();

String query="select * from personas where id_persona like '%"+username+"%'  limit 1";

ResultSet rs=st.executeQuery(query);

%>

<%
int lectura = 0;
while(rs.next())

{

 lectura = 1;

JSONObject obj=new JSONObject();
    obj.put("id_persona",rs.getString(1));
    obj.put("nombre",rs.getString(2));
    obj.put("apellido",rs.getString(3));
    obj.put("direccion",rs.getString(4));
    obj.put("sexo",rs.getString(5));
    out.print(obj);
    out.flush();
  /*  
    JSONObject obj=new JSONObject();
    obj.put("name","foo");
    obj.put("num",new Integer(100));
    obj.put("balance",new Double(1000.21));
    obj.put("is_vip",new Boolean(true));
    obj.put("nickname",null);
    out.print(obj);
    out.flush();
*/

}
if (lectura==0){
	  
    JSONObject obj=new JSONObject();
    obj.put("firstname","foo");
    obj.put("lastname","foo");
    //obj.put("balance",new Double(1000.21));
    //obj.put("is_vip",new Boolean(true));
    //obj.put("nickname",null);
    //out.print(obj);
    out.flush();

	
}
%>


  <%
    
  %>