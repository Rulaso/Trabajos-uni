 package Practica2;
 
 public class Prefijo {
	 
	 public Prefijo() {
		 
	 }
	 
	 public boolean esPrefijo(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {
		 boolean aux = false;
		 if(a1 != null && a2 != null && !a1.isEmpty() && !a2.isEmpty()) {
			 aux = compararNodos(a1, a2);
			 
		 }
		 
		 
		 return aux;
	 }
	 
	 private boolean compararNodos(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {
		 boolean aux = false;
		 if(a1.getData() == a2.getData()) {
			 System.out.println("son iguales, el valor es " + a1.getData());
			 aux = true;
			 if(a1.hasLeftChild() && !a2.hasLeftChild()) {
				 aux = false;
			 } else { 
			 	if(a1.hasLeftChild()) {
			 		aux = compararNodos(a1.getLeftChild(), a2.getLeftChild());
			 	}
			 }
			 if(a1.hasRightChild() && !a2.hasRightChild()) {
				 aux = false;
			 } else {
				 if(a1.hasRightChild() && aux) {
					 aux = compararNodos(a1.getRightChild(), a2.getRightChild());
				 }
			 }
		 } 
		 return aux;
	 }

 }