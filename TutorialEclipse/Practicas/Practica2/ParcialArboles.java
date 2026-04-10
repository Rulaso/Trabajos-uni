package Practica2;

public class ParcialArboles{
	private BinaryTree<Integer> ab;
	
	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public boolean isLeftTree(int num) {
		//Busco el nodo que contiene el valor ingresado. Devuelve null si el nodo no se encontro 
		boolean aux;
		BinaryTree<Integer> nodo = buscarNodo(num, this.ab);
		if(nodo != null) {
		//Si encontre el nodo calculo que subArbol tiene mas subArboles con un solo hijo
			System.out.println("Encontre el nodo");
			int iz = -1;
			int de = -1;
			//recupero el total de nodos que cumplen con el enunciado, tanto del hijo izquierdo como del derecho
			if(nodo.hasLeftChild()) {
			
				iz = contarNodos(nodo.getLeftChild());
			}
			if(nodo.hasRightChild()) {
				de = contarNodos(nodo.getRightChild());	
			}
		//Si el izquierdo es mayor que el derecho retorno true, de lo contrario false
			if(iz > de) {
				aux = true;
			} else {
				aux = false;
			}
			
		} else {
		//Si no encontre el nodo directamente retorno false ya que no se encuentra dentro del arbol
			System.out.println("No encontre el nodo");
			aux = false;
		}
		return aux;
	}
	
	private BinaryTree<Integer> buscarNodo(int num, BinaryTree<Integer> nodo) {
		//Asigno un nodo auxiliar
		BinaryTree<Integer> aux = null;
		if (nodo.getData() != null && nodo.getData() != num) {
		//hago un recorrido preorden para encontrar al nodo que contiene el valor
			if(nodo.hasLeftChild() && aux == null) {
				aux = buscarNodo(num, nodo.getLeftChild());
			}
			if(nodo.hasRightChild() && aux == null) {
				aux = buscarNodo(num, nodo.getRightChild());
			}
		}
		
		//Si encontre el nodo lo guardo en la variable auxiliar
		if(nodo.getData() != null && nodo.getData() == num) {
			 aux = nodo;
		}
		
		return aux;
	}
	
	private int contarNodos(BinaryTree<Integer> nodo) {
		int cant=0;
		BinaryTree<Integer> aux = nodo;
		//Si es una hoja retorna el valor 0
		if(!aux.isLeaf()) {
			if(aux.hasLeftChild()) {
			//Si tiene hijo izquierdo pero no derecho, aumenta el contador y llama recursivamente con su hijo izquierdo
				if(!aux.hasRightChild()) {
					cant++;
				}
				cant += contarNodos(aux.getLeftChild());
			}
			if(aux.hasRightChild()) {
			//Si tiene hijo derecho pero no tiene izquierdo, aumenta el contador y llama recursivamente con su hijo derecho
				if(!aux.hasLeftChild()) {
					cant++;
				}
				cant += contarNodos(aux.getRightChild());
			}
		}
		//Siempre se retorna la cantidad actual
		return cant;
	}
	
}