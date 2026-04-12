 package Practica2;
 
 public class Prefijo {
	 
	 public Prefijo() {
		 
	 }
	 
	 public boolean esPrefijo(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {
		 boolean aux = false;
		 if(a1 != null && a2 != null && !a1.isEmpty() && !a2.isEmpty()) {
			 //Si ninguno es null ni estan vacios comienza la comparacion de los nodos
			 if(a1.getData() == a2.getData()) {
				 //Si los valores que contienen son iguales avanzo
				 aux = true;
				 if(a1.hasLeftChild() && !a2.hasLeftChild()) {
					 //si el arbol 2 no tiene hijo izquierdo retorno false
					 aux = false;
				 } else { 
					 //Si el arbol 1 tiene hijo izquierdo comparo sus subarboles izquierdos
				 	if(a1.hasLeftChild()) {
				 		aux = esPrefijo(a1.getLeftChild(), a2.getLeftChild());
				 	}
				 }
				 if(a1.hasRightChild() && !a2.hasRightChild()) {
					 //Si el arbol 2 no tiene hijo derecho retorno false
					 aux = false;
				 } else {
					 if(a1.hasRightChild() && aux) {
						 //si el arbol 1 tiene hijo derecho comparo sus subarboles derechos
						 aux = esPrefijo(a1.getRightChild(), a2.getRightChild());
					 }
				 }
			 }
			 
		 }
		 //retorno el resultado en aux
		 return aux;
	 }
 }