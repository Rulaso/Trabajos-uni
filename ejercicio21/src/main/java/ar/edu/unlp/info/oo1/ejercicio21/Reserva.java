package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;


public class Reserva{
	private List<Propiedad> disponibles;
	
	public Reserva() {
		disponibles = new LinkedList<Propiedad>();
	}
}