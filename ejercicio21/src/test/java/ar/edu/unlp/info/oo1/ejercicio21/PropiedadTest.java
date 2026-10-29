package ar.edu.unlp.info.oo1.ejercicio21;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class PropiedadTest{
	private Propiedad p1;
	private Propiedad p2;
	private Propiedad p3;
	private DateLapse l1;
	private DateLapse l2;
	private DateLapse l3;
	private DateLapse l4;
	private Reserva r1;
	
	@BeforeEach
	void setup() {
		p1 = new Propiedad("nombre", "descripción", 10);
		p2 = new Propiedad("nombre", "descripción", 100);
		p3 = new Propiedad("nombre largo", "descripción", 50);
		l1 = new DateLapse(LocalDate.of(2026, 10, 1), LocalDate.of(2026, 10, 26));
		l2 = new DateLapse(LocalDate.of(2026, 9, 20), LocalDate.of(2026, 10, 5));
		l3 = new DateLapse(LocalDate.of(2026, 1, 10), LocalDate.of(2026, 2, 10));
		l4 = new DateLapse(LocalDate.of(2026, 1, 1), LocalDate.of(2026, 12, 31));
		
	}
	
	@Test 
	void TestReservar() {
		assertTrue(p1.estaDisponible(l1));
		p1.reservar(l1);
		assertEquals(1, p1.getCantidad());
		
		p1.reservar(l2);
		assertEquals(1, p1.getCantidad());
		assertFalse(p1.estaDisponible(l1));
		
		p1.reservar(l3);
		assertEquals(2, p1.getCantidad());
		
		p2.reservar(l1);
		assertEquals(1, p2.getCantidad());
	}
	
	@Test
	void TestEstaDisponible() {
		assertTrue(p1.estaDisponible(l1));
		p1.reservar(l1);
		assertFalse(p1.estaDisponible(l1));
	}
	
	@Test
	void TestCalcularTotal() {
		p1.reservar(l1);
		p1.reservar(l3);
		assertEquals(560.0, p1.calcularTotal(l4));
		assertEquals(0, p2.calcularTotal(l4));
	}
	
	@Test
	void TestLiberar() {
		 r1 = p1.reservar(l1);
		assertFalse(p1.estaDisponible(l1));
		assertTrue(p1.liberar(r1));
		assertFalse(p1.liberar(r1));

	}
}