package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmailTest{
	private Email e;
	private Archivo a1;
	private Archivo a2;
	
	@BeforeEach
	void setUp() {
		e = new Email("titulo", "cuerpo");
		a1 = new Archivo("nombre");
		a2 = new Archivo("nombre");
	}
	
	@Test
	void TestGetTitulo() {
		assertEquals("titulo", e.getTitulo());
	}
	
	@Test
	void TestGetCuerpo() {
		assertEquals("cuerpo", e.getCuerpo());
	}
	
	@Test
	void TestAdjuntos() {
		e.agregarArchivo(a1);
		e.agregarArchivo(a2);
		assertEquals(a1, e.adjuntos().get(0));
		assertEquals(a2, e.adjuntos().get(1));
		assertEquals(2, e.adjuntos().size());
	}
	
	@Test
	void TestAgregarAdjunto() {
		assertEquals(0, e.adjuntos().size());
		e.agregarArchivo(a1);
		assertEquals(a1, e.adjuntos().get(0));
		assertEquals(1, e.adjuntos().size());
	}
	
	@Test 
	void TestQuitarAdjunto() {
		assertEquals(0, e.adjuntos().size());
		e.agregarArchivo(a1);
		assertEquals(1, e.adjuntos().size());
		e.quitarArchivo(a2);
		assertEquals(1, e.adjuntos().size());
		e.quitarArchivo(a1);
		assertEquals(0, e.adjuntos().size());
	}
	
	@Test
	void TestTamaño() {
		assertEquals(0, e.tamaño());
		e.agregarArchivo(a1);
		e.agregarArchivo(a2);
		assertEquals(12, e.tamaño());
	}
}