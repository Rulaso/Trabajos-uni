package Punto3;

import java.util.ArrayList;
import java.util.List;

public class punto3{
	public static void main(String[] args) {
		Estudiante est1 = new Estudiante("Tiago", "Roveta",4, "AAA@gmail.com", "AAAAA");
		Estudiante est2 = new Estudiante("Juanito", "Mariposas", 3, "BBB@gmail.com", "BBB");
		Profesor prof1 = new Profesor("nombre1", "apellido1", "mail1@gmail.com", "catedra1", "facultad1");
		Profesor prof2 = new Profesor("nombre2", "apellido2", "mail2@gmail.com", "catedra2", "facultad2");
		Profesor prof3 = new Profesor("nombre3", "apellido3", "mail3@gmail.com", "catedra3", "facultad3");
		List <Estudiante> estudiantes = new ArrayList<>();
		List <Profesor> profesores = new ArrayList<>();
		
		estudiantes.add(est1);
		estudiantes.add(est2);
		profesores.add(prof1);
		profesores.add(prof2);
		profesores.add(prof3);
		
		for (int i=0;i<2;i++) {
			System.out.println(estudiantes.get(i).tusDatos());
		}
		
		for (int i=0; i<3;i++) {
			System.out.println(profesores.get(i).tusDatos());
		}
		
	}
}