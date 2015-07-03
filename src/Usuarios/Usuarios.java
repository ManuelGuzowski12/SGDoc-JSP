package Usuarios;

import java.sql.*;

public class Usuarios {
	private String username;
	private String password;
	private int id_usuario;
	private String id_persona;
	private int status;
	
	public Usuarios(){
		username = "";
		password = "";
		id_usuario = 0;
		id_persona = "";
	}
	
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	private String getPassword()
	{
		return password;
	}
	public String getIdpersona()
	{
		return id_persona;
		
	}
	
	public void setIdpersona(String id_persona)
	{
		this.id_persona = id_persona;
		
	}
	
	public int getIdusuario()
	{
		return id_usuario;
	}
	
	public void setIdusuario(int id_usuario)
	{
		this.id_usuario = id_usuario;
	}
	
	private void setStatus(int status)
	{
		this.status = status;
	}
	public int getStatus()
	{
		return status;
	}
	
	public void Existe() throws ClassNotFoundException, SQLException
	{
		
		setStatus(0);
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select id_usuario, id_persona from usuarios where username = '"+ getUsername()+"' and password = '"+ getPassword()+"'";
		
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next()){
			setIdusuario(rs.getInt(1));
			setIdpersona(rs.getString(2));
			setStatus(1);
		}
	}	
	
}