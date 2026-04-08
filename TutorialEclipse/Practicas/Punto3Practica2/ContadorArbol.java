package Punto3Practica2;

import java.util.List;
import java.util.LinkedList;

public class ContadorArbol {
	private BinaryTree<Integer> ab;
	
	public ContadorArbol(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public List numerosPares(){
		List<Integer> pares = new LinkedList<Integer>();
		this.recursivo(ab, pares);
		return pares;
	}
	
	private List recursivo(BinaryTree<Integer> ab, List pares) {
		if(ab.getData() % 2 == 0) {
			pares.add(ab.getData());
		}
		if(ab.hasLeftChild()) {
			this.recursivo(ab.getLeftChild(), pares);
		}
		if(ab.hasRightChild()) {
			this.recursivo(ab.getRightChild(), pares);
		}
		
		
		
		return pares;
	}
	
}