package ar.edu.unlp.info.oo1.ejercicio18;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.ChronoUnit.*;

public class DateLapse{
	private LocalDate fechaIni;
	private LocalDate fechaFin;
	
	public DateLapse(LocalDate fechaIni, LocalDate fechaFin) {
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
	}
	public LocalDate getFrom() {
		return fechaIni;
	}
	
	public LocalDate getTo() {
		return fechaFin;
	}
	
	public int sizeInDays() {
		long dias =  fechaIni.until(fechaFin, ChronoUnit.DAYS);
		return (int) dias;
	}
	
	public boolean includesDate(LocalDate other) {
		return (fechaIni.isAfter(other) && fechaFin.isBefore(other)) || fechaIni.equals(other) || fechaFin.equals(other);
	}
	
	public boolean overlaps(DateLapse anotherDateLapse) {
		return (this.includesDate(anotherDateLapse.getFrom())) || (this.includesDate(anotherDateLapse.getTo()));
	}
}