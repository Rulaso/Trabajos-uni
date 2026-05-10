package Practica2;

public class Transformacion{
	private BinaryTree<Integer> arbol;
	
	public Transformacion(BinaryTree<Integer> ab) {
		this.arbol =  ab;
	}
	
	public BinaryTree<Integer> suma(){
		BinaryTree<Integer> nuevo = new BinaryTree<Integer>();
		if(arbol != null && !arbol.isEmpty()) {
			sumarPostOrden(arbol, nuevo);
		}
		return nuevo;
	}
	
	private int sumarPostOrden(BinaryTree<Integer> arbol, BinaryTree<Integer> nue) {
		int actual = 0;
		if(arbol.isLeaf()) {
			nue.setData(0);
			actual = arbol.getData();
		} else {
			int izq = 0, der = 0;
			if(arbol.hasLeftChild()) {
				nue.addLeftChild(new BinaryTree<Integer>());
				izq = sumarPostOrden(arbol.getLeftChild(), nue.getLeftChild());
			}
			if(arbol.hasRightChild()) {
				nue.addRightChild(new BinaryTree<Integer>());
				der = sumarPostOrden(arbol.getRightChild(), nue.getRightChild());
			}
			nue.setData(izq + der);
			actual = izq + der;
		}
		return actual;
	}
	
}