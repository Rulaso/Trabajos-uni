package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AccionTest{
	private Accion a1;
	
	@BeforeEach
	void setup() {
		a1 = new Accion("nombre1", 20, 100);
	}
	
	@Test
	void TestValorUnitario() {
		assertEquals(2000, a1.valorActual());
	}
}