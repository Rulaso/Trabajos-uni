package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class Usuario{
	private String nombre;
	private String direccion;
	private int DNI;
	private List<Reserva> reservas;
	
	public Usuario(String nombre, String direccion, int DNI) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.DNI = DNI;
		reservas = new LinkedList<Reserva>();
	}
	
	public boolean crearReserva(Propiedad p, DateLapse lapso) {
		Reserva r = new Reserva(p, lapso);
		if(r.reservar()) {
			reservas.add(r);
			return true;
		}
		return false;
	}
	
	public boolean consultarDisponibilidad(Propiedad p, DateLapse lapso) {
		return p.estaDisponible(lapso);
	}
	
	public double consultarPrecio(Reserva r) {
		return r.calcularPrecio();
	}
	
	public boolean cancelarReserva(Reserva r) {
		if(reservas.contains(r)) {
			r.ponerDisponible();
			return reservas.remove(r);
		}
		return false;
	}
	
}