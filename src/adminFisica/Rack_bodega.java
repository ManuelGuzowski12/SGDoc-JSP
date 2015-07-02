package adminFisica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Rack_bodega {
	private int id_rack;
	private int id_bodega;
	private int id_usuario;
	private String fecha_insert;
	
	public Rack_bodega(){
		id_rack = 0;
		id_bodega = 0;
		id_usuario = 0;
		fecha_insert = "";
	}
	
	public int getId_rack()
	{
		return id_rack;
	}
	public void setId_rack(int id_rack)
	{
		this.id_rack= id_rack;
	}
	
	public int getId_bodega()
	{
		return id_bodega;
	}
	public void setId_bodega(int id_bodega)
	{
		this.id_bodega= id_bodega;
	}
	
	public int getId_usuario()
	{
		return id_usuario;
	}
	public void setId_usuario(int id_usuario)
	{
		this.id_usuario = id_usuario;
	}
	
	public String getFecha_insert()
	{
		return fecha_insert;
	}
	public void setFecha_insert(String fecha_insert)
	{
		this.fecha_insert = fecha_insert;
	}
	
	public void insertRack_bodega () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into racks_bodega ( id_rack, id_bodega, id_usuario, fecha_insert) values ('"+ getId_rack() + "','" + getId_bodega() + "','" + getId_usuario() +"','" + getFecha_insert() +"')";
		st.executeUpdate(query); 
		
	}
	
}
