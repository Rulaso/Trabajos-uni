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
		c2 = new Carpeta("nombre");
		e1 = new Email("titulo", "cuerpo");
		e2 = new Email("titulo2", "cuerpo2");
		a1 = new Archivo("nombre1");
		a2 = new Archivo("nombre2");
		e1.adjuntos().add(a1);
		e2.adjuntos().add(a1);
		e2.adjuntos().add(a2);
		c1.agregarMail(e1);
		c2.agregarMail(e1);
		c2.agregarMail(e2);
	}
	
	@Test
	void TestGetNombre() {
		assertEquals("nombre", c1.getNombre());
	}
	
	@Test
	void TestMover() {
		assertEquals(e1, c1.buscar("titulo"));
		assertEquals(2, c2.cantidad());
		c1.mover(e1, c2);
		assertEquals(e1, c2.buscar("titulo"));
		assertEquals(null, c1.buscar("titulo"));
	}
	
	@Test 
	void TestTamaño(){ 
		assertEquals(7, c1.tamaño());
		assertEquals(21, c2.tamaño());
	}
	
}