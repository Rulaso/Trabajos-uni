package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.List;
import java.util.LinkedList;

public class Carpeta{
	private List<Email> emails;
	private String nombre;
	
	public Carpeta(String nombre) {
		this.nombre = nombre;
		emails = new LinkedList<Email>();
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void mover(Email e, Carpeta c) {
		c.emails.add(e);
		emails.remove(e);
	}
	
	public Email buscar(String texto) {
		return emails.stream().filter(email -> email.getTitulo().equals(texto) || email.getCuerpo().equals(texto)).findFirst().orElse(null);
	}
	
	public int tamaño() {
		return emails.stream().mapToInt(Email::tamaño).sum();
	}
}