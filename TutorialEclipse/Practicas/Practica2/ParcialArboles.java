package Practica2;

public class ParcialArboles{
	private BinaryTree<Integer> ab;
	
	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public boolean isLeftTree(int num) {
		boolean aux = false;
		if(this.ab != null && !this.ab.isEmpty()) {
			BinaryTree<Integer> nodo = buscarNodo(num, this.ab);
			System.out.println("Encontre el nodo");
			int iz = -1;
			int de = -1;
			if(nodo.hasLeftChild()) {
				iz = contarNodos(nodo.getLeftChild());
			}
			if(nodo.hasRightChild()) {
				de = contarNodos(nodo.getRightChild());
			}
			if(iz > de) {
				aux = true;
			}
			
		}
		return aux;
			
	}
	
	private BinaryTree<Integer> buscarNodo(int num, BinaryTree<Integer> nodo) {
		if(nodo.getData() == num) {
			return nodo;
		}
		BinaryTree<Integer> aux = nodo;
		if(aux.hasLeftChild()) {
			aux = buscarNodo(num, aux.getLeftChild());
		}
		if(aux == null && aux.hasRightChild()) {
			aux = buscarNodo(num, aux.getRightChild());
		}
		
		return aux;
	}
	
	private int contarNodos(BinaryTree<Integer> nodo) {
		int cant=0;
		if(nodo.hasLeftChild() ^ nodo.hasRightChild()) {
			cant++;
		}
		if(nodo.hasLeftChild()) {
			cant+= contarNodos(nodo.getLeftChild());
		}
		if(nodo.hasRightChild()) {
			cant+= contarNodos(nodo.getRightChild());
		}
		return cant;
	}
	
	
}