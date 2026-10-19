package ar.edu.unlp.info.oo1.ejercicio15;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements Inversion{
	private double valorInicial;
	private double interesesDiarios;
	private LocalDate fechaInicial;
	
	public PlazoFijo(double valorInicial, double interesesDiarios) {
		this.valorInicial = valorInicial;
		this.interesesDiarios = interesesDiarios;
		fechaInicial = LocalDate.now();
	}
	
	@Override
	public double valorActual() {
		LocalDate actual = LocalDate.now();
		Long diasLong = ChronoUnit.DAYS.between(fechaInicial, actual);
		return valorInicial + (valorInicial * interesesDiarios * Math.toIntExact(diasLong));
	}
}