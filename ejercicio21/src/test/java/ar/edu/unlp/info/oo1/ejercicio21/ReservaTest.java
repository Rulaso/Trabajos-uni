package ar.edu.unlp.info.oo1.ejercicio21;

import java.time.LocalDate;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ar.edu.unlp.info.oo1.ejercicio18.*;

public class ReservaTest{
	private Reserva r1;
	private Propiedad p1;
	private DateLapse l1;
	
	@BeforeEach
	void setup(){		
		p1 = new Propiedad("nombre", "descripición", 10);
		l1 = new DateLapse(LocalDate.of(2026, 10, 1), LocalDate.of(2026, 10, 10));
		r1 = new Reserva(p1, l1);
	}
	
	@Test
	void TestPrecioAcordad() {
		assertEquals(90, r1.calcularPrecio());
	}
	
	@Test
	void TestCancelarReserva() {
		assertFalse(r1.cancelarReserva());
	}
}