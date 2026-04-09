package Punto3Practica2;

public class ProfundidadDeArbolBinario{
	private BinaryTree<Integer> ab;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	public int sumaElementosProfundidad(int capa) {
		BinaryTree<Integer> abAux;
		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
		cola.enqueue(this.ab);
		cola.enqueue(null);
		int nivel=0, cant=0;
		while(!cola.isEmpty()) {
			abAux = cola.dequeue();
			if(abAux != null){
				if(nivel == capa) {
					cant+= abAux.getData();
				}
				if(abAux.hasLeftChild()) {
					cola.enqueue(abAux.getLeftChild());
				}
				if(abAux.hasRightChild()) {
					cola.enqueue(abAux.getRightChild());
				}
			} else if(!cola.isEmpty()) {
				cola.enqueue(null);
				nivel++;
			}
		}
		
		return cant;
		
	}
}