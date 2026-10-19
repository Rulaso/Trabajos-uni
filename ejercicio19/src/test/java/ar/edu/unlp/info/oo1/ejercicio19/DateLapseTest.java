package ar.edu.unlp.info.oo1.ejercicio19;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DateLapseTest{
	private DateLapse d;
	
	@BeforeEach
	void setup() {
		d = new DateLapse(LocalDate.of(2005, 10, 1), 7688);
	}
	
	@Test
	void TestGetFrom() {
		assertEquals(LocalDate.of(2005, 10, 1), d.getFrom());
	}
	
	@Test
	void TestGetTo() {
		assertEquals(LocalDate.of(2026, 10, 19), d.getTo());
	}
	
	@Test
	void TestSizeInDays() {
		assertEquals(7688, d.sizeInDays());
	}
	
	@Test
	void TestIncludesDates() {
		assertFalse(d.includesDate(LocalDate.of(2026, 10, 20)));
		assertFalse(d.includesDate(LocalDate.of(2005, 9, 30)));
		assertTrue(d.includesDate(LocalDate.of(2005, 10, 1)));
		assertTrue(d.includesDate(LocalDate.of(2026, 10, 19)));
	}
}