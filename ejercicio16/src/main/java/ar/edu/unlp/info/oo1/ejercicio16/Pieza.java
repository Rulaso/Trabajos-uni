package ar.edu.unlp.info.oo1.ejercicio16;

public abstract class Pieza {
	private String color;
	private String material;
	
	public Pieza(String color, String material) {
		this.color = color;
		this.material = material;
	}
	
	public abstract double calcularVolumen(String texto);
	public abstract double calcularSuperficie(String texto);
	
	public String getColor() {
		return color;
	}
	
	public String getMaterial() {
		return material;
	}
}