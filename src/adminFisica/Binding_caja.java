package adminFisica;
import java.sql.*;
public class Binding_caja {
	private int id_binding;
	private int id_caja;
	private int id_usuario;
	private String fecha_insert;
	
	public Binding_caja(){
		id_binding = 0;
		id_caja = 0;
		id_usuario = 0;
		fecha_insert = "";
	}
	
	public int getId_binding() 
	{
		return id_binding;
	}
	public void setId_binding(int id_binding)
	{
		this.id_binding = id_binding;
	}
	public int getId_caja()
	{
		return id_caja;
	}
	public void setId_caja(int id_caja)
	{
		this.id_caja= id_caja;
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
	
	
	public void insertBinding_caja () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into binding_caja ( id_binding, id_caja, id_usuario, fecha_insert ) values ('"+ getId_binding() + "','" + getId_caja() + "','" + getId_usuario() +"','" + getFecha_insert() +"')";
		st.executeUpdate(query); 
		
	}
	
	//cuanta cuantos cuantos registros hay con un binding del id que le envio
	
		public int count(int id_caja) throws ClassNotFoundException, SQLException
		{
			
		int cont = 0;
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " SELECT COUNT(*) FROM binding_caja where id_caja = '"+id_caja+"'";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				cont = rs.getInt(1);
			}
			
			return cont; 
		}
}
