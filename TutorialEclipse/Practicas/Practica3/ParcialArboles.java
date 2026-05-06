package Practica3;

import java.util.List;
import java.util.Iterator;
import java.util.LinkedList;
import Practica2.Queue;

public class ParcialArboles{
	
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		boolean resultado = false;
		if(arbol != null && !arbol.isEmpty()) {
			resultado = verificarSeleccion(arbol);
		}
		return resultado;
	}
	
	private static boolean verificarSeleccion(GeneralTree<Integer> a) {
		int minAct = 99999;
		boolean resultado = true;
		if(a.isLeaf()) {
			resultado = true;
		} else {

			List<GeneralTree<Integer>> hijos = a.getChildren();
			Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
			while(iterador.hasNext() && resultado == true) {
				GeneralTree<Integer> hijo = iterador.next();
				if(hijo.getData() < minAct) {
					minAct = hijo.getData();
				}
				resultado = verificarSeleccion(hijo);
			}
			if(minAct != a.getData() && resultado == true) {
				resultado = false;
			}
		}
		return resultado;
	}
	
	public static List<Integer> resolver(GeneralTree<Integer> arbol){
		List<Integer> resultado = new LinkedList<Integer>();
		List<Integer> max = new LinkedList<Integer>();
		max.add(-1);
		if(arbol != null && !arbol.isEmpty()) {
			buscarCaminoMaximo(arbol, resultado, new LinkedList<Integer>(), 0, 0, max);
		}
		return resultado;
	}
	
	private static void buscarCaminoMaximo(GeneralTree<Integer> a, List<Integer> resultado, List<Integer> caminoActual, int nivel, int valorActual, List<Integer> valorMaximo) {
		if(a.getData()!= 0) {
			caminoActual.add(a.getData());
			valorActual += a.getData() * nivel;
		}

		if(a.isLeaf()) {
			if(valorActual > valorMaximo.get(0)) {
				resultado.clear();
				resultado.addAll(caminoActual);
				valorMaximo.set(0, valorActual);
			}
		} else {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
			while(iterador.hasNext()) {
				GeneralTree<Integer> hijo = iterador.next();
				buscarCaminoMaximo(hijo, resultado, caminoActual, nivel +1, valorActual, valorMaximo);
			}
		}
		if(a.getData() != 0) {
			caminoActual.remove(caminoActual.size() -1);
		}
	}
	
	public static boolean resolverCreciente(GeneralTree<Integer> arbol) {
		boolean esCreciente = true;
		int nodos = 0, nivel = 1;
		if(arbol != null && !arbol.isEmpty()) {
			Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
			cola.enqueue(arbol);
			cola.enqueue(null);
			while(!cola.isEmpty() && esCreciente) {
				GeneralTree<Integer> nodo = cola.dequeue();
				if(nodo != null) {
					nodos++;
					List<GeneralTree<Integer>> hijos = nodo.getChildren();
					for(GeneralTree<Integer> hijo: hijos) {
						cola.enqueue(hijo);
					}
				} else {
					if(nodos != nivel) {
						esCreciente = false;
					}
					nivel++;
					nodos = 0;
					if(!cola.isEmpty()) {
						cola.enqueue(null);
					}
				}
			}
			
		} else {
			esCreciente = false;
		}
		return esCreciente;
	}
}