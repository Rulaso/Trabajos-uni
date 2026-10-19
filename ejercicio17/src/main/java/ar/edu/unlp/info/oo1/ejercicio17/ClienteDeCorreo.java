package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.List;
import java.util.LinkedList;
import java.util.stream.Stream;

public class ClienteDeCorreo{
	private Carpeta inbox;
	private List<Carpeta> carpetas;
	
	public ClienteDeCorreo() {
		inbox = new Carpeta("inbox");
		carpetas = new LinkedList<Carpeta>();
	}
	
	public Email buscar(String texto) {
		return Stream.concat(Stream.of(inbox), carpetas.stream()).map(carpeta -> carpeta.buscar(texto)).filter(email -> email != null).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return Stream.concat(Stream.of(inbox), carpetas.stream()).mapToInt(Carpeta::tamaño).sum();
	}
	
	public void agregarCarpeta(Carpeta c) {
		carpetas.add(c);
	}
	
	public void quitarCarpeta(Carpeta c) {
		carpetas.remove(c);
	}
}