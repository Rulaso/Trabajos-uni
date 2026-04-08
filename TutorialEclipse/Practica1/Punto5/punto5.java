package Punto5;

import java.util.ArrayList;
import java.util.List;

public class punto5{
	public static void main(String[] args) {
		List<Integer> numeros = new ArrayList<>();
		List<Integer> resultados = new ArrayList<>();
		
		numeros.add(1);
		numeros.add(2);
		numeros.add(3);
		numeros.add(4);
		numeros.add(5);
		
		Metodos.puntoA(numeros, resultados);
		
		System.out.println("Maximo " + resultados.get(0));
		System.out.println("Minimo " +resultados.get(1));
		System.out.println("Promedio "+ resultados.get(2));
		
		Dato result= new Dato();
		
		Metodos.puntoB(numeros, result);
		
		System.out.println("Minimo " + result.getMinimo());
		System.out.println("Maximo " + result.getMaximo());
		System.out.println("Promedio " + result.getPromedio());
		
	}
	
}