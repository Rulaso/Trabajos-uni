package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;


public class Reserva{
	private Propiedad p;
	private DateLapse periodo;
	
	public Reserva(Propiedad p, DateLapse periodo) {
		this.p = p;
		this.periodo = periodo;
		this.reservar();
	}
	

	public double calcularPrecio() {
		return p.getPrecio() * periodo.sizeInDays();
	}
	
	public boolean reservar() {
		return p.reservar(periodo);
	}
	
	public boolean ponerDisponible() {
		if(!p.estaDisponible(periodo)) {
			p.liberar(periodo);
			return true;
		}
		return false;
	}
}