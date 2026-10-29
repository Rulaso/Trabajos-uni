package ar.edu.unlp.info.oo1.ejercicio21;


import java.time.LocalDate;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class UsuarioTest{
	private Usuario u1;
	private Usuario u2;
	private DateLapse l1;
	private DateLapse l2;
	private DateLapse l3;
	private Propiedad p1;
	private Propiedad p2;
	
	@BeforeEach
	void setup() {
		u1 = new Usuario("nombre", "descripción", 123);
		u2 = new Usuario("nombre", "descripción", 123);
		l1 = new DateLapse(LocalDate.of(2026, 10, 1), LocalDate.of(2026, 10, 26));
		l2 = new DateLapse(LocalDate.of(2026, 9, 20), LocalDate.of(2026, 10, 5));
		l3 = new DateLapse(LocalDate.of(2026, 1, 10), LocalDate.of(2026, 2, 10));
		p1 = new Propiedad("nombre", "descripción", 10);
		p2 = new Propiedad("nombre", "descripción", 100);
	}
	
	@Test
	void TestCrearReserva() {
		assertTrue(u1.crearReserva(p1, l1));
		assertFalse(u1.crearReserva(p1, l2));
		assertTrue(u1.crearReserva(p1, l3));
		assertFalse(u1.crearReserva(p1, l2));
		assertFalse(u2.crearReserva(p1, l1));
		assertTrue(u1.crearReserva(p2, l1));
		assertFalse(u2.crearReserva(p2, l1));
	}
	
	
	//Como testeo la reserva si el usuario no crea la reserva y crearReserva devuelve un boolean?
	//uso el tamaño de la lista reservas?
	@Test
	void TestCancelarReserva() {
		u1.crearReserva(p1, l1);
		
	}
	
	@Test
	void TestConsultarPrecio() {
		Reserva r = new Reserva(p1, l1);
		assertEquals(260, u1.consultarPrecio(r));
	}
	
	@Test
	void TestConsultarDisponibilidad() {
		assertTrue(u1.consultarDisponibilidad(p1, l1));
		u1.crearReserva(p1, l1);
		assertFalse(u1.consultarDisponibilidad(p1, l1));
		assertFalse(u2.consultarDisponibilidad(p1, l1));
	}
}