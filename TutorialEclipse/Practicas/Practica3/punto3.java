package Practica3;

public class punto3{
	public static void main(String[] args) {
		GeneralTree<Integer> raiz =  new GeneralTree<Integer>(2);
		GeneralTree<Integer> nodo1 = new GeneralTree<Integer>(1);
		GeneralTree<Integer> nodo4 = new GeneralTree<Integer>(4);
		GeneralTree<Integer> nodo6 = new GeneralTree<Integer>(5);
		GeneralTree<Integer> nodo10 = new GeneralTree<Integer>(10);
		GeneralTree<Integer> nodo9 = new GeneralTree<Integer>(9);
		GeneralTree<Integer> nodo7 = new GeneralTree<Integer>(7);
		raiz.addChild(nodo1);
		raiz.addChild(nodo4);
		raiz.addChild(nodo6);
		nodo1.addChild(nodo7);
		nodo4.addChild(nodo10);
		nodo6.addChild(nodo9);
		nodo6.addChild(new GeneralTree<Integer>(16));
		nodo6.addChild(new GeneralTree<Integer>(15));
		
		int alt = raiz.altura();
		
		System.out.println("La altura es "+alt);
		
		//int nivel = raiz.nivel(15);
		
		//System.out.println("El nivel es "+nivel);
	}
}