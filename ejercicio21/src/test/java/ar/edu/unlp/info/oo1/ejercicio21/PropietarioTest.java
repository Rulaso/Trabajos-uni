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
	
	@BeforeEach
	void setup() {
		p1 = new Propietario("nombre", "dirección", 1234);
		propiedad1 = new Propiedad("nombre", "descripción", 10);
		propiedad2 = new Propiedad("nombre", "descripción", 100);
	}
	
	@Test
	void TestAgregarPropiedad() {
		assertTrue(p1.agregarPropiedad(propiedad1));
		assertFalse(p1.agregarPropiedad(propiedad1));
		assertTrue(p1.agregarPropiedad(propiedad2));
	}
	
	@Test
	void TestQuitarPropiedad() {
		assertFalse()
	}
}