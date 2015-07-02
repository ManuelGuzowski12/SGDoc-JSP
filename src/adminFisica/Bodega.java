package adminFisica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Bodega {
	private int id_bodega;
	private int capacidad;
	private String nombre;
	private String codigo;
	
	//constructor
	public Bodega(){
	id_bodega = 0;
	capacidad = 0;
	nombre = "";
	codigo = "";
	}
	public int getId_bodega()
	{
		return id_bodega;
	}
	public void setId_bodega(int id_bodega)
	{
		this.id_bodega = id_bodega;
	}
	
	public int getCapacidad()
	{
		return capacidad;
	}
	public void setCapacidad(int capacidad)
	{
		this.capacidad = capacidad;
	}
	
	public String getNombre()
	{
		return nombre;
	}
	public void setNombre(String nombre)
	{
		this.nombre = nombre;
	}
	public String getCodigo()
	{
		return codigo;
	}
	public void setCodigo(String codigo)
	{
		this.codigo = codigo;
	}
	public void CrearBodega () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into bodega ( capacidad, nombre, codigo) values ('" +getCapacidad()+ "','" +getNombre()+ "','" +getCodigo()+"')";
		st.executeUpdate(query); 
		
	}
	//recupera el id de la bodega y el codigo para mostrar en el dropdown
			public ResultSet Recuperar() throws ClassNotFoundException, SQLException
			{
				
			
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
				
				Statement st = con.createStatement();
				
				String query = " select id_bodega, codigo from bodega";
				
				ResultSet rs = st.executeQuery(query);
				
				return rs;
			}
}
