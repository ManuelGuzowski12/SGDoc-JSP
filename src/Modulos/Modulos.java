package Modulos;

public class Modulos {
	private String id;
	private String nombre;
	private String descripcion;
	private String url;
	private String id_padre;
	public String getid(){
		return this.id;
	}
	public void setid(String value){
		this.id = value;
	}
	public String getnombre(){
		return this.nombre;
	}
	public void setnombre(String value){
		this.nombre = value;
	}
	public String getdesc(){
		return this.descripcion;
	}
	public void setdesc(String value){
		this.descripcion = value;
	}
	public String getUrl(){
		return this.url;
	}
	public void setUrl(String value){
		this.url = value;
	}
	public String getidPadre(){
		return this.id_padre;
	}
	public void setidPadre(String value){
		this.id_padre = value;
	}
}
