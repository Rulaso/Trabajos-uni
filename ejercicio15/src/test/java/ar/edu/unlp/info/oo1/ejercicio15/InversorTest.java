package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InversorTest{
	private Inversor i;
	private Accion a1;
	private PlazoFijo p1;
	
	@BeforeEach
	void setup() {
		i = new Inversor();
		a1 = new Accion("accion1", 20, 10);
		p1 = new PlazoFijo(10,10);
	}
	
	@Test
	void TestAgregarInversor() {
		assertEquals(0, i.getCantidad());
		i.agregarInversion(a1);
		assertEquals(1, i.getCantidad());
	}
	
	@Test
	void TestQuitarInversion() {
		i.agregarInversion(a1);
		assertEquals(1, i.getCantidad());
		i.quitarInversion(a1);
		assertEquals(0, i.getCantidad());
	}
	
	@Test
	void TestValorInversion() {
		i.agregarInversion(a1);
		i.agregarInversion(p1);
		assertEquals(210, i.valorInversion());
	}
}