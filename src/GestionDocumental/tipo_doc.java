package GestionDocumental;

import java.sql.*;
public class tipo_doc {
	
	private int id_tipodoc;
	private String descripcion;
	
	public tipo_doc()
	{
		id_tipodoc = 0;
		descripcion = "";
	}

	
	public int getId() {
		return id_tipodoc;
	}
	public void setId(int id_tipodoc) {
		this.id_tipodoc = id_tipodoc;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setNombre(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public ResultSet Recuperar() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select * from tipo_doc";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	public ResultSet GetbyTipo() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select id_tipodoc, descripcion from tipo_doc where id_tipodoc = '"+getId()+"'";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
}
