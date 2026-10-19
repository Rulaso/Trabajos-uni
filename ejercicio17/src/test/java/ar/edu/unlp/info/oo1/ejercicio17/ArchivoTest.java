package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArchivoTest{
	private Archivo a;
	
	@BeforeEach
	void setup() {
		a = new Archivo("cinco");
	}
	
	@Test
	void TestTamaño() {
		assertEquals(5, a.tamaño());
	}
	
	@Test
	void TestGetNombre() {
		assertEquals("cinco", a.getNombre());
	}
}