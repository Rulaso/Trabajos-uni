package Practica2;

public class Transformacion{
	private BinaryTree<Integer> ab;
	
	public Transformacion(BinaryTree<Integer> ab) {
		this.ab =  ab;
	}
	
	public BinaryTree<Integer> Suma(){
		
		int total = 0;
		
		if(this.ab != null && !this.ab.isEmpty()) {
			sumarNodos(this.ab);
		}
		
		return this.ab;
	}
	
	private int sumarNodos(BinaryTree<Integer> ab) {
		int sumaIZ=0, sumaDE = 0;
		
		if(ab.hasLeftChild()) {
			sumaIZ+= sumarNodos(ab.getLeftChild());
		}
		if(ab.hasRightChild()) {
			sumaDE+= sumarNodos(ab.getRightChild());
		}
		int original = ab.getData();
		ab.setData(sumaIZ + sumaDE);
		
		return original + ab.getData();
	}
	
}