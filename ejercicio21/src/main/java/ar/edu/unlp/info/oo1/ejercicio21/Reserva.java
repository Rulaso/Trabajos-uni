package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;


public class Reserva{
	private Propiedad p;
	private DateLapse periodo;
	private double precioAcordado;
	
	public Reserva(Propiedad p, DateLapse periodo) {
		this.p = p;
		this.periodo = periodo;
		this.precioAcordado = p.getPrecio();
	}
	
	public double calcularPrecio() {
		return precioAcordado * periodo.sizeInDays();
	}
	
	public DateLapse getLapso() {
		return periodo;
	}
	
	public boolean cancelarReserva() {
		p.liberar(this);
		return true;
	}
}