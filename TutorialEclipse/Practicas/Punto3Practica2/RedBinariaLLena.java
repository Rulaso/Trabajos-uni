package Punto3Practica2;

public class RedBinariaLLena {
	BinaryTree<Integer> ab;
	
	public RedBinariaLLena(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public int retardoReenvio() {
		int aux = this.calcularRetardo(ab);
		return aux;
	}
	
	//Utilizo un recorrido postOrder de forma recursiva
	
	private int calcularRetardo(BinaryTree<Integer> ab) {
		int aux=0, aux2=0;		//Inicializo las variables en 0
		if(ab.isLeaf()) {
			return ab.getData();			//si es una hoja no tiene retardo entonces retorno su valor
		}
		if(ab.hasLeftChild()) {
			aux+= calcularRetardo(ab.getLeftChild());		//Si tiene hijo izquierdo sumo su retardo en la variable aux
		}
		if(ab.hasRightChild()) {
			aux2+= calcularRetardo(ab.getRightChild());		//Si tiene hijo derecho sumo su retardo en la variable aux2
		}
		if(aux2 >= aux) {
			aux = aux2;				//El que tenga menor retardo lo guardo en la variable aux
		}
		return aux += ab.getData();		//proceso la raiz y retorno la suma de su retardo y aux
	}
	
}