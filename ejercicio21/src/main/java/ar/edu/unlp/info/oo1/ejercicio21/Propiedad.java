package ar.edu.unlp.info.oo1.ejercicio21;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;
import java.util.List;
import java.util.LinkedList;

public class Propiedad{
	private List<DateLapse> reservada;
	private String nombre;
	private String direccion;
	private double precio;
	
	public Propiedad(String nombre, String direccion, double precio) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.precio = precio;
		reservada = new LinkedList<DateLapse>();
	}
	
	public boolean estaDisponible(DateLapse periodo) {
		return reservada.stream().noneMatch(dateLapse -> dateLapse.overlaps(periodo));
	}
		
	public boolean reservar(DateLapse periodo) {
		if(this.estaDisponible(periodo)) {
			reservada.add(periodo);
			return true;
		}
		return false;
	}
		
	public boolean liberar(DateLapse periodo) {
		if(!this.estaDisponible(periodo)) {
			reservada.remove(periodo);
			return true;
		}
		return false;
	}
	
	//Que pasa si tengo una reserva que no esta totalemnte dentro del rango? actualmente incluye a la suma los dias que estan fuera del mismo
	public double calcularTotal(DateLapse rango) {
		return precio * reservada.stream().filter(dateLapse -> dateLapse.overlaps(rango)).mapToInt(dateLapse -> dateLapse.sizeInDays()).sum();
	}
	
	public double getPrecio() {
		return precio;
	}
	
}