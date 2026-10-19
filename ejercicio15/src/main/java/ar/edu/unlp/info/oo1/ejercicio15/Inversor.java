package ar.edu.unlp.info.oo1.ejercicio15;

import java.util.List;
import java.util.LinkedList;

public class Inversor{
	private List<Inversion> inversiones;
	
	public Inversor() {
		inversiones = new LinkedList<Inversion>();
	}
	
	public double valorInversion() {
		return inversiones.stream().mapToDouble(Inversion::valorActual).sum();
	}
	
	public void agregarInversion(Inversion i) {
		inversiones.add(i);
	}
	
	public void quitarInversion(Inversion i) {
		inversiones.remove(i);
	}
	
	public int getCantidad() {
		return inversiones.size();
	}
}