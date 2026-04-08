package Punto5;

import java.util.ArrayList;
import java.util.List;

public class Metodos {
	
	public static List puntoA(List<Integer> numeros, List<Integer> resultados) {
		int max=-1, min = 999;
		int total=0;
		int prom;
		
		for (int i=0;i<numeros.size();i++) {
			total+= numeros.get(i);
			
			if(max < numeros.get(i)) {
				max = numeros.get(i);
			}
			if(min > numeros.get(i)) {
				min = numeros.get(i);
			}
		}
		prom = total/numeros.size();
		resultados.add(max);
		resultados.add(min);
		resultados.add(prom);
		
		return resultados;
		
	}
	
	public static void puntoB(List<Integer> numeros, Dato result) {
		int max=-1, min = 999;
		int total=0;
		int prom;
		
		for (int i=0;i<numeros.size();i++) {
			total+= numeros.get(i);
			
			if(max < numeros.get(i)) {
				max = numeros.get(i);
			}
			if(min > numeros.get(i)) {
				min = numeros.get(i);
			}
		}
		prom = total/numeros.size();
		
		result.setMaximo(max);
		result.setMinimo(min);
		result.setPromedio(prom);
		
		
	}
}