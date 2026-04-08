package Punto7;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import Punto3.Estudiante;

public class TestArrayList{
	 public static void main(String[] args) {
		List<Integer> numeros = new ArrayList<>(); 
		numeros.add(5);
		numeros.add(7);
		numeros.add(9);
		numeros.add(2);
		numeros.add(15);
		numeros.add(65);
		numeros.add(24);
		numeros.add(36);
		numeros.add(1);
		
		for (int i=0;i<numeros.size();i++) {
			System.out.println(numeros.get(i));
		}
		
		generarEstudiantes();
	 }
	 
	 public static void generarEstudiantes() {
		 List<Estudiante> estudiantes = new ArrayList<>();
		 
		 Estudiante e1 = new Estudiante("Tiago", "Roveta",4, "AAA@gmail.com", "AAAAA");
		 Estudiante e2 = new Estudiante("Tiago1", "Roveta1",4, "AAA@gmail.com", "AAAAA");
		 Estudiante e3 = new Estudiante("Tiago2", "Roveta2",4, "AAA@gmail.com", "AAAAA");
		 
		 estudiantes.add(e1);
		 estudiantes.add(e2);
		 estudiantes.add(e3);
		 
		 List<Estudiante> estudiantes2;
		 
		 estudiantes2 = estudiantes;
		 
		 for(int i=0;i<estudiantes.size();i++) {
			 System.out.println(estudiantes.get(i).tusDatos());
		 }
		 System.out.println();
		 
		 for(int i=0;i<estudiantes2.size();i++) {
			 System.out.println(estudiantes2.get(i).tusDatos());
		 }

		 estudiantes2.get(0).setNombre("THIAGO");
		 
		 for(int i=0;i<estudiantes.size();i++) {
			 System.out.println(estudiantes.get(i).tusDatos());
		 }
		 System.out.println();
		 
		 for(int i=0;i<estudiantes2.size();i++) {
			 System.out.println(estudiantes2.get(i).tusDatos());
		 }
		 
	 }
	 
}