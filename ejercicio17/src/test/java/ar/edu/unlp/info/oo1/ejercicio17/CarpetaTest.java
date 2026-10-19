package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CarpetaTest{
	private Carpeta c1;
	private Carpeta c2;
	private Email e2;
	private Email e1;
	private Archivo a1;
	private Archivo a2;
	
	@BeforeEach
	void setup() {
		c1 = new Carpeta("nombre");
		c1 = new Carpeta("nombre");
		e1 = new Email("titulo", "cuerpo");
		e2 = new Email("titulo", "cuerpo2");
		a1 = new Archivo("nombre");
		a2 = new Archivo("nombre");
		e1.adjuntos().add(a1);
		e2.adjuntos().add(a1);
		e2.adjuntos().add(a2);
	}
	
	@Test
	void TestGetNombre() {
		assertEquals("nombre", c1.getNombre());
	}
	
	@Test
	void TestMover() {
		assertEquals(e1.getTitulo(), c1.buscar("nombre"));
		assertEquals(0, c1.);
	}
	
}