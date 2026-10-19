package ar.edu.unlp.info.oo1.ejercicio15;

public class Accion implements Inversion{
	private String nombre;
	private int cant;
	private double valorUnitario;
	
	public Accion(String nombre, int cant, double valorUnitario) {
		this.nombre = nombre;
		this.cant = cant;
		this.valorUnitario = valorUnitario;
	}
	
	public double valorActual() {
		return cant * valorUnitario;
	}
}