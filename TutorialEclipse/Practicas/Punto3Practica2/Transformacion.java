package Punto3Practica2;

public class Transformacion{
	private BinaryTree<Integer> ab;
	
	public Transformacion(BinaryTree<Integer> ab) {
		this.ab =  ab;
	}
	
	public BinaryTree<Integer> Suma(){
		BinaryTree<Integer> abAux;
		int total = 0;
		
		total = this.sumarNodos(ab, total);
		System.out.println(total);
		
		return this.ab;
	}
	
	private int sumarNodos(BinaryTree<Integer> ab, int total) {
		int aux1= 0, aux2= 0;
		if(ab.isLeaf()) {
			aux1 = ab.getData();
			ab.setData(0);
			return aux1;
		} else {
			if(ab.hasLeftChild()) {
				aux1+= sumarNodos(ab.getLeftChild(), total);
			}
			if(ab.hasRightChild()) {
				aux2+= sumarNodos(ab.getRightChild(), total);
			}
		}
		total = aux1 + aux2;
		ab.setData(total);
		return total;
	}
	
}