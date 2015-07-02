package adminFisica;
import java.sql.*;
public class Racks {
	private int id_rack;
	private int id_tipo;
	private int id_dep;
	private String codigo;
	//constructor
	public Racks(){
		id_rack = 0;
		id_tipo = 0;
		id_dep = 0;
		codigo = "";
	}
	
	public int getId_rack()
	{
		return id_rack;
	}
	public void setId_rack(int id_rack)
	{
		this.id_rack = id_rack;
	}
	
	public int getId_tipo()
	{
		return id_tipo;
	}
	public void setId_tipo(int id_tipo)
	{
		this.id_tipo = id_tipo;
	}
	public int getId_dep()
	{
		return id_dep;
	}
	public void setId_dep(int id_dep)
	{
		this.id_dep = id_dep;
	}
	public String getCodigo()
	{
		return codigo;
	}
	public void setCodigo(String codigo)
	{
		this.codigo = codigo;
	}
	
	//innserta el rack
	public void CrearRack () throws ClassNotFoundException, SQLException
	{
         Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
		
		Statement st = con.createStatement();
		
		String query = "insert into racks ( id_tipo, id_dep, codigo) values ('"+getId_tipo() +"','" +getId_dep()+ "','" +getCodigo()+"')";
		st.executeUpdate(query); 
		
	}
	
	//recupera el id del rack y el codigo para mostrar en el dropdown
		public ResultSet Recuperar() throws ClassNotFoundException, SQLException
		{
			
		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = " select id_rack, codigo from racks";
			
			ResultSet rs = st.executeQuery(query);
			
			return rs;
		}
		
		//recupera el id del depto y lo compara con el id del rack
		public int GetId_dep(int iddep) throws ClassNotFoundException, SQLException
		{
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
			
			Statement st = con.createStatement();
			
			String query = "SELECT id_dep FROM racks where id_rack ='"+iddep+"'";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				iddep = rs.getInt(1);
			}
			
			return iddep;
		}	
		
		//recupera los rack que no esta aun guardados en el pivote
				public ResultSet Recuperarrsk() throws ClassNotFoundException, SQLException
				{
					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgdoc","root","12345");
					
					Statement st = con.createStatement();
					
					String query = " select id_rack, codigo from racks where id_rack not in (select id_rack from racks_bodega )";
					
					ResultSet rs = st.executeQuery(query);
					
					return rs;
				}
	
}
