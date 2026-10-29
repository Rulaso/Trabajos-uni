package ar.edu.unlp.info.oo1.ejercicio21;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.LinkedList;

public class Propiedad{
	private List<Reserva> reservada;
	private String nombre;
	private String direccion;
	private double precio;
	
	public Propiedad(String nombre, String direccion, double precio) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.precio = precio;
		reservada = new LinkedList<Reserva>();
	}
	
	public boolean estaDisponible(DateLapse periodo) {
		return reservada.stream().noneMatch(reserva -> reserva.getLapso().overlaps(periodo));
	}
		
	public Reserva reservar(DateLapse periodo) {
		if(this.estaDisponible(periodo)) {
			Reserva r = new Reserva(this, periodo);
			reservada.add(r);
			return r;
		}
		return null;
	}
		
	public boolean liberar(Reserva r) {
		return reservada.remove(r);	
	}
	
	//Que pasa si tengo una reserva que no esta totalemnte dentro del rango? actualmente incluye a la suma los dias que estan fuera del mismo
	public double calcularTotal(DateLapse rango) {
		List<Reserva> superpuestos = reservada.stream().filter(reserva -> reserva.getLapso().overlaps(rango)).collect(Collectors.toList());
		int cant = superpuestos.stream().mapToInt(reserva -> reserva.getLapso().sizeInDays()).sum();
		return precio * cant;
	}
	
	public double getPrecio() {
		return precio;
	}
	
	public int getCantidad() {
		return reservada.size();
	}
	
}