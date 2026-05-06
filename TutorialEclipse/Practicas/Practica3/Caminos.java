package Practica3;

import java.util.List;
import java.util.LinkedList;

public class Caminos{
	private GeneralTree<Integer> a;
	
	public Caminos(GeneralTree<Integer> a) {
		this.a = a;
	}
	
	public List<Integer> cmainoALaHojaMasLejana(){
		//Instancio una nueva lista con el resultado
		List<Integer> camino = new LinkedList<Integer>();
		//verifico que el arbol no sea nulo ni vacio
		if(this.a != null && !this.a.isEmpty()) {
			//Llamo al procedimiento recursivo buscar camino que me devuelve el resultado en la lista "camino"
			buscarCamino(this.a,new LinkedList<Integer>(), camino);
		}	
		//retorno el camino
		return camino;
	}
	
	private static void buscarCamino(GeneralTree<Integer> a, List<Integer> caminoActual, List<Integer> caminoLargo){
		//agrego un nodo al camino actual (el que uso durante el recorrido)
		caminoActual.add(a.getData());
		
		//cuando el nodo actual sea una hoja me meto a la actualizacion
		if(a.isLeaf()) {
			
			//como me pide devolver el mas largo, si el tamaño de la lista actual es mayor al tamaño de la lista 
			//resultante, entonces vacio la lista resultante y la lleno con la lista actual
			if(caminoActual.size() > caminoLargo.size()) {
				caminoLargo.clear();
				caminoLargo.addAll(caminoActual);
			}
		//Si el nodo no es una hoja
		} else {
			//Recorro todos los subArboles nacidos a partir del nodo actual
			for(GeneralTree<Integer> hijo: a.getChildren()) {
				buscarCamino(hijo, caminoActual, caminoLargo);
			}
		}	
		//elimino el ultimo nodo del camino actual para hacer el backtracking con las recursiones anteriores
		caminoActual.remove(caminoActual.size() -1);		
	}
}