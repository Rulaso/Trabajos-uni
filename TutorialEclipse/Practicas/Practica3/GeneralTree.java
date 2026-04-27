package Practica3;

import java.util.LinkedList;
import java.util.List;
import java.util.Iterator;
import Practica2.Queue;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	/**
	 * @return
	 */
	public int altura() {	
		int contador = 0;
		GeneralTree<T> aux = new GeneralTree<T>();
		aux.setData(this.getData());
		aux.setChildren(this.getChildren());
		contador = buscarCamino(aux);
		return contador;
	}
	
	private int buscarCamino(GeneralTree<T> a) {
		int res;
		if (a.isLeaf()) {
			res = 0;
		} else {
			res = -1;
			List<GeneralTree<T>> hijos = a.getChildren();
			for (GeneralTree<T> hijo: hijos) {
				int alturaHijo = this.buscarCamino(hijo);
				
				if(alturaHijo > res) {
					res = alturaHijo;
				}
			}
		}
		return res +1;
	}
	
	public int nivel(T dato){
		int cont=0;
		GeneralTree<T> a = new GeneralTree<T>();
		a.setData(this.getData());
		a.setChildren(this.getChildren());
		cont = buscarNodo(a, dato);
		return cont;
	  }

	private int buscarNodo(GeneralTree<T> a, T dato) {
		int cont = 0;
		if(a.getData().equals(dato)) {
			cont = 1;
		} else {
			List<GeneralTree<T>> hijos = a.getChildren();
			Iterator<GeneralTree<T>> iterador = hijos.iterator();
			while(iterador.hasNext() && cont==0) {
				cont = buscarNodo(iterador.next(), dato);
				if(cont != 0) {
					cont++;
				}
			}
		}
		return cont;
	}
	
	
	public int ancho(){
		int cont = 0, max = -1;
		GeneralTree<T> a = new GeneralTree<T>();
		a.setData(this.getData());
		a.setChildren(this.getChildren());
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		if(a != null && !a.isEmpty()) {
			max = 1;
			cola.enqueue(a);
			cola.enqueue(null);
			while(!cola.isEmpty()) {
				GeneralTree<T> nodo = cola.dequeue();
				if(nodo != null) {
					List<GeneralTree<T>> hijos = nodo.getChildren();
					for(GeneralTree<T> hijo: hijos) {
						cont++;
						cola.enqueue(hijo);
					}
				} else {
					if(max < cont) {
						max = cont;
					}
					cont =0;
					if(!cola.isEmpty()) {
						cola.enqueue(null);
					}	
				}
			}		
		}		
		return max;
	}
}