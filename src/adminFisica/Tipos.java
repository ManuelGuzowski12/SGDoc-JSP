package adminFisica;
import java.sql.*;
public class Tipos {
	private int id_tipo;
	private int capacidad;
	
	public Tipos()
	{
		id_tipo = 0;
		capacidad= 0;
	}
	
	
	public int getId_tipo() 
	{
		return id_tipo;
	}
	public void setId_tipo(int id_tipo)
	{
		this.id_tipo = id_tipo;
	}
	public int getCapacidad()
	{
		return capacidad;
	}
	public void setCapacidad(int capacidad)
	{
		this.capacidad = capacidad;
	}
	
	public ResultSet RecuperarBinding() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select * from tipobinding";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	
	public ResultSet RecuperarCaja() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select * from tipocaja";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	
	public ResultSet RecuperarRack() throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select * from tiporack";
		
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	//cpacidad del binding
	public int Recuperarcap(int id_tipo) throws ClassNotFoundException, SQLException
	{
		
		int cap=0;
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = " select capacidad  from tipobinding where id_tipo = '"+id_tipo+"'";
		
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
			cap= rs.getInt(1);
		}
		
		return cap;
	}
	
	
	
	//cpacidad de la caja
		public int RecuperarcapC(int id_tipo) throws ClassNotFoundException, SQLException
		{
			
			int cap=0;
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select capacidad  from tipocaja where id_tipo = '"+id_tipo+"'";
			
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				cap= rs.getInt(1);
			}
			
			return cap;
		}
	
		
		//cpacidad del rack
				public int RecuperarcapR(int id_tipo) throws ClassNotFoundException, SQLException
				{
					
					int cap=0;
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
					
					Statement st = con.createStatement();
					
					String query = " select capacidad  from tiporack where id_tipo = '"+id_tipo+"'";
					
					ResultSet rs = st.executeQuery(query);
					
					while(rs.next())
					{
						cap= rs.getInt(1);
					}
					
					return cap;
				}
	//------------------------------------------
	//compara el id del tipo binding
	public int Get_tipbing(int id_binding) throws ClassNotFoundException, SQLException
	{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "SELECT id_tipo FROM binding where id_binding = '"+id_binding+"'";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
			id_tipo = rs.getInt(1);
		}
		
		return id_tipo;
	}
	
	//compara el id del tipo para caja 
		public int Get_tipcaja(int id_caja) throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = "SELECT id_tipo FROM cajas where id_caja = '"+id_caja+"'";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				id_tipo = rs.getInt(1);
			}
			
			return id_tipo;
		}
		
		//compara el id del tipo para rack 
				public int Get_tiprack(int id_rack) throws ClassNotFoundException, SQLException
				{
					
				
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
					
					Statement st = con.createStatement();
					
					String query = "SELECT id_tipo FROM racks where id_rack = '"+id_rack+"'";
					ResultSet rs = st.executeQuery(query);
					
					while(rs.next())
					{
						id_tipo = rs.getInt(1);
					}
					
					return id_tipo;
				}
	
}