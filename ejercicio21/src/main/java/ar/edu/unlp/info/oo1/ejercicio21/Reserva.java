package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;


public class Reserva{
	private Propiedad p;
	
	public Reserva(Propiedad p) {
		this.p = p;
	}
	

	
	public double calcularPrecio(Propiedad p, DateLapse periodo) {
		return p.calcularPrecio(periodo);
	}
	
	public boolean reservar(Propiedad p, DateLapse periodo) {
		if(p.estaDisponible(periodo)) {
			p.reservar(periodo);
			return true;
		}
		return false;
	}
	
	public boolean ponerDisponible(Propiedad p, DateLapse periodo) {
		if(!p.estaDisponible(periodo)) {
			p.liberar(periodo);
			return true;
		}
		return false;
	}
}