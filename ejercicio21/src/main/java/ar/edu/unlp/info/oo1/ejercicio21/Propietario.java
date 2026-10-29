package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.List;
import java.util.LinkedList;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class Propietario extends Usuario {
	private List<Propiedad> propiedades;
	
	public Propietario(String nombre, String dirección, int DNI) {
		super(nombre, dirección, DNI);
		propiedades = new LinkedList<Propiedad>();
	}
	
	public boolean agregarPropiedad(Propiedad p) {
		if(propiedades.contains(p)) {
			return false;
		}
		return propiedades.add(p);
	}
	
	public boolean quitarPropiedad(Propiedad p) {
		return propiedades.remove(p);
	}
	
	public double calcularIngresos(DateLapse rango) {
		return 0.75 * propiedades.stream().mapToDouble(propiedad -> propiedad.calcularTotal(rango)).sum();
	}
	
	public int getCantidad() {
		return propiedades.size();
	}
}