package Punto7;

public class Estudiante extends Persona{
	private int comision;
	private String direccion;
	
	public Estudiante(String nombre, String apellido, int comision, String email, String direccion) {
		super(nombre, apellido, email);
		this.comision = comision;
		this.direccion = direccion;
	}

	public int getComision() {
		return comision;
	}

	public void setComision(int comision) {
		this.comision = comision;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String tusDatos() {
		String aux;
		aux = "Nombre " + getNombre() + ", Apellido " + getApellido() + ", Email " + getEmail() + ", Comision "+ getComision();
		aux+= ", Direccion " + getDireccion();
		return aux;
	}
	
}