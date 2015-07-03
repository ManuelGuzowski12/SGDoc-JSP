package PermisosPK;

public class Permisos {
	private String  usuario;
	private String modulo;
	private boolean permiso;
	public String getUsuario(){
		return this.usuario;
	}
	public void setUsuario(String value){
		this.usuario = value;
	}
	public String getModulo(){
		return this.modulo;
	}
	public void setModulo(String value){
		this.modulo = value;
	}
	public boolean getPermiso(){
		return this.permiso;
	}
	public void setPermiso(String value){
		if(value.equals("0")){
			this.permiso = false;
		}else{
			this.permiso =true;
		}
		
	}
}
