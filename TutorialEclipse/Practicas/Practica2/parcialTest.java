package Practica2;


public class parcialTest{

	
	public static void main(String[] args) {
		BinaryTree<Integer> raiz = new BinaryTree<Integer>(2);
		BinaryTree<Integer> hijoIZ = new BinaryTree<Integer>(7);
		BinaryTree<Integer> subHijoIZ = new BinaryTree<Integer>(23);
		subHijoIZ.addLeftChild(new BinaryTree<Integer>(-3));
		BinaryTree<Integer> subHijoDE = new BinaryTree<Integer>(6);
		subHijoDE.addLeftChild(new BinaryTree<Integer>(55));
		subHijoDE.addRightChild(new BinaryTree<Integer>(11));
		hijoIZ.addLeftChild(subHijoIZ);
		hijoIZ.addRightChild(subHijoDE);
		BinaryTree<Integer> hijoDE = new BinaryTree<Integer>(-5);
		BinaryTree<Integer> subArbolDE = new BinaryTree<Integer>(19);
		BinaryTree<Integer> subSubArbolDE = new BinaryTree<Integer>(4);
		subSubArbolDE.addRightChild(new BinaryTree<Integer>(18));
		subArbolDE.addRightChild(subSubArbolDE);
		hijoDE.addLeftChild(subArbolDE);
		raiz.addLeftChild(hijoIZ);
		raiz.addRightChild(hijoDE);
		
		raiz.entreNiveles(0, 5);
		
		ParcialArboles prueba = new ParcialArboles(raiz);
		
		if(prueba.isLeftTree(7)) {
			System.out.println("EL MODO DEVOLVIO TRUE");
		} else {
			System.out.println("EL NODO DEVOLVIO FALSE");
		}
		
	}
	

}