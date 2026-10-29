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
		return (fechaIni.isBefore(other) && fechaFin.isAfter(other)) || fechaIni.equals(other) || fechaFin.equals(other);
	}
	
	public boolean overlaps(DateLapse anotherDateLapse) {
		boolean r1 = this.includesDate(anotherDateLapse.getFrom());
		boolean r2 = this.includesDate(anotherDateLapse.getTo());
		boolean r3 = anotherDateLapse.includesDate(this.getFrom());
		boolean r4 = anotherDateLapse.includesDate(this.getTo());
		boolean result = (r1 || r2 || r3 || r4);
		return result;
	}
}