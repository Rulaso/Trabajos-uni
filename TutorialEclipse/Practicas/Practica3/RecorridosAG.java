package Practica3;

import java.util.LinkedList;
import java.util.List;
import java.util.Iterator;
import Practica2.Queue;

public class RecorridosAG{
	
	public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a, Integer n){
		List<Integer> resultado = new LinkedList<Integer>();
		if(a != null && !a.isEmpty()) {
			buscarImparesMayores(a, n, resultado);
		}
		return resultado;
	}
	
	private List<Integer> buscarImparesMayores(GeneralTree<Integer> a, Integer n, List<Integer> resultado){
		if(a.getData()%2==1 && a.getData() > n) {
			resultado.add(a.getData());
		}
		if(a.hasChildren()) {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
			while(iterador.hasNext()) {
				GeneralTree<Integer> hijo = iterador.next();
				buscarImparesMayores(hijo, n, resultado);
			}
		}
		return resultado;
	}
	
	public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a, Integer n){
		List<Integer> resultado = new LinkedList<Integer>();
		if(a != null && !a.isEmpty()) {
			buscarImparesMayoresInOrden(a, n, resultado);
		}
		return resultado;
	}
	
	private List<Integer> buscarImparesMayoresInOrden(GeneralTree <Integer> a, Integer n, List<Integer> resultado){
		List<GeneralTree<Integer>> hijos = a.getChildren();
		Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
 
		if(iterador.hasNext()) {
			 
			GeneralTree<Integer> hijo = iterador.next();
			buscarImparesMayoresInOrden(hijo, n, resultado);
		}
		if(a.getData()%2==1 && a.getData() > n) {
			resultado.add(a.getData());
		}
		while(iterador.hasNext()) {
			GeneralTree<Integer>hijo = iterador.next();
			buscarImparesMayoresInOrden(hijo, n, resultado);
		}
		return resultado;
	}
	
	public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a, Integer n) {
		List<Integer> resultado = new LinkedList<Integer>();
		if(a != null && !a.isEmpty()) {
			buscarImparesMayoresPostOrden(a, n, resultado);
		}
		return resultado;
	}
	
	private List<Integer> buscarImparesMayoresPostOrden(GeneralTree<Integer> a, Integer n, List<Integer> resultado){
		if(a.hasChildren()) {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
			while(iterador.hasNext()) {
				GeneralTree<Integer> hijo = iterador.next();
				buscarImparesMayoresPostOrden(hijo, n, resultado);
			}
		}
		if(a.getData()%2==1 && a.getData() > n) {
			resultado.add(a.getData());
		}
		return resultado;
	}

	
	public static void preorder(GeneralTree<Integer> nodo) {
		if( nodo != null && !nodo.isEmpty()) {
			System.out.print(nodo.getData() + " ");
			if(nodo.hasChildren()) {
				List<GeneralTree<Integer>> hijos = nodo.getChildren();
				Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
				while(iterador.hasNext()) {
					GeneralTree<Integer> hijo = iterador.next();
					preorder(hijo);
				}
			}
		}
	}
	
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a, Integer n) {
		List<Integer> resultado = new LinkedList<Integer>();
		if(a!=null && !a.isEmpty()) {
			Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
			cola.enqueue(a);
			while(!cola.isEmpty()) {
				GeneralTree<Integer> nodo = cola.dequeue();
				if(nodo.getData()%2==1 && nodo.getData() > n) {
					resultado.add(nodo.getData());
				}
				if(nodo.hasChildren()) {
					List<GeneralTree<Integer>> hijos = nodo.getChildren();
					Iterator<GeneralTree<Integer>> iterador = hijos.iterator();
					while(iterador.hasNext()) {
						GeneralTree<Integer> hijo = iterador.next();
						cola.enqueue(hijo);
					}
				}
			}
		}
		return resultado;
	}
	
}