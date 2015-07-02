package adminFisica;
import java.sql.*;
public class Caja_rack {
	private int id_caja;
	private int id_rack;
	private String fecha_insert;
	private int id_usuario;
	
	
	public Caja_rack(){
		id_caja = 0;
		id_rack = 0;
		fecha_insert = "";
		id_usuario = 0;
	}
	
	public int getId_caja() 
	{
		return id_caja;
	}
	public void setId_caja(int id_caja)
	{
		this.id_caja = id_caja;
	}
	public int getId_rack()
	{
		return id_rack;
	}
	public void setId_rack(int id_rack)
	{
		this.id_rack= id_rack;
	}
	public String getFecha_insert()
	{
		return fecha_insert;
	}
	public void setFecha_insert(String fecha_insert)
	{
		this.fecha_insert = fecha_insert;
	}
	public int getId_usuario()
	{
		return id_usuario;
	}
	public void setId_usuario(int id_usuario)
	{
		this.id_usuario = id_usuario;
	}
	
	public void insertCaja_rack () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into cajas_racks( id_caja, id_rack, fecha_insert, id_usuario) values ('" + getId_caja() + "','"+ getId_rack() + "','" + getFecha_insert() +"','" + getId_usuario() +"')";
		st.executeUpdate(query); 
		
	}
	
	//cuanta cuantos cuantos registros hay con una caja del id que le envio
	
		public int count(int id_rack) throws ClassNotFoundException, SQLException
		{
			
		int cont = 0;
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " SELECT COUNT(*) FROM cajas_racks where id_rack = '"+id_rack+"'";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				cont = rs.getInt(1);
			}
			
			return cont; 
		}
	
}
