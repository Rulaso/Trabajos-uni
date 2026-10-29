package ar.edu.unlp.info.oo1.ejercicio21;

import java.time.LocalDate;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class PropietarioTest{
	private Propietario p1;
	private Propiedad propiedad1;
	private Propiedad propiedad2;
	private DateLapse l1;
	
	@BeforeEach
	void setup() {
		p1 = new Propietario("nombre", "dirección", 1234);
		propiedad1 = new Propiedad("nombre", "descripción", 10);
		propiedad2 = new Propiedad("nombre", "descripción", 100);
		l1 = new DateLapse(LocalDate.of(2026, 10, 1), LocalDate.of(2026, 10, 10));
	}
	
	@Test
	void TestAgregarPropiedad() {
		assertTrue(p1.agregarPropiedad(propiedad1));
		assertFalse(p1.agregarPropiedad(propiedad1));
		assertTrue(p1.agregarPropiedad(propiedad2));
	}
	
	

	@Test
	void TestQuitarPropiedad() {
		assertEquals(0 , p1.getCantidad());
		p1.agregarPropiedad(propiedad1);
		assertEquals(1, p1.getCantidad());
		assertTrue(p1.quitarPropiedad(propiedad1));
		assertEquals(0, p1.getCantidad());
	}
	
	@Test
	void TestCalcularIngresos() {
		p1.agregarPropiedad(propiedad1);
		propiedad1.reservar(l1);
		assertEquals(67.5, p1.calcularIngresos(l1));
		p1.agregarPropiedad(propiedad2);
		propiedad2.reservar(l1);
		assertEquals(742.5, p1.calcularIngresos(l1));
	}
}