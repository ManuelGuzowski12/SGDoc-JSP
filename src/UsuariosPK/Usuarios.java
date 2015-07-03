package UsuariosPK;



public class Usuarios{
	private String idPersona;
	private String nombre;
	private String apellido;
	private String direccion;
	private String sexo;
	private int id;
	private String nick;
	private String pass;
	public String getIdPersona(){
		return this.idPersona;
	}
	public void setIdPersona(String value){
		this.idPersona = value;
	}
	public String getnombre(){
		return this.nombre;
	}
	public void setnombre(String value){
		this.nombre = value;
	}
	public String getapellido(){
		return this.apellido;
	}
	public void setapellido(String value){
		this.apellido = value;
	}
	public String getdireccion(){
		return this.direccion;
	}
	public void setdireccion(String value){
		this.direccion = value;
	}
	public String getsexo(){
		return this.sexo;
	}
	public void setsexo(String value){
		this.sexo = value;
	}
	public int getId(){
		return this.id;
	}
	public void setId(int value){
		this.id = value;
	}
	public String getnick(){
		return this.nick;
	}
	public void setnick(String value){
		this.nick = value;
	}
	public String getpass(){
		return this.pass;
	}
	public void setpass(String value){
		this.pass = value;
	}
	
}
