package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PlazoFijoTest{
	private PlazoFijo p1;
	
	@BeforeEach
	void setup() {
		p1 = new PlazoFijo(10,10);
	}
	
	@Test
	void TestValorUnitario() {
		assertEquals(10, p1.valorActual());
	}
	
}