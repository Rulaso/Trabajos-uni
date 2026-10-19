package ar.edu.unlp.info.oo1.ejercicio19;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.ChronoUnit.*;

public class DateLapse{
	private LocalDate fechaIni;
	private int sizeInDays;
	
	public DateLapse(LocalDate fechaIni, int sizeInDays) {
		this.fechaIni = fechaIni;
		this.sizeInDays = sizeInDays;
	}
	public LocalDate getFrom() {
		return fechaIni;
	}
	
	public LocalDate getTo() {
		return fechaIni.plusDays(sizeInDays);
	}
	
	public int sizeInDays() {
		return sizeInDays;
	}
	
	public boolean includesDate(LocalDate other) {
		return (fechaIni.isAfter(other) && fechaIni.plusDays(sizeInDays).isBefore(other)) || fechaIni.equals(other) || fechaIni.plusDays(sizeInDays).equals(other);
	}
}