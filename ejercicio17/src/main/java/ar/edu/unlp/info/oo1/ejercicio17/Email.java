package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.List;
import java.util.LinkedList;

public class Email{
	private String titulo;
	private String cuerpo;
	private List<Archivo> archivos;
	
	public Email(String titulo, String cuerpo) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		archivos = new LinkedList<Archivo>();
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public String getCuerpo() {
		return cuerpo;
	}
	
	public List<Archivo> adjuntos(){
		return archivos;
	}
	
	public void agregarArchivo(Archivo a) {
		archivos.add(a);
	}
	
	public void quitarArchivo(Archivo a) {
		archivos.remove(a);
	}
	
	public int tamaño() {
		return archivos.stream().mapToInt(Archivo::tamaño).sum();
	}
}