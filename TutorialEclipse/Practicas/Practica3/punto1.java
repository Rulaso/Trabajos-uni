package Practica3;
import java.util.List;
public class punto1{
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
		RecorridosAG prueba = new RecorridosAG();
		
		
		RecorridosAG.preorder(raiz);
		
		List<Integer> resultado = prueba.numerosImparesMayoresQuePreOrden(raiz, 0);
		int i= 0;
		System.out.println();
		for (i=0;i<resultado.size();i++) {
			System.out.print(resultado.get(i) + " ");
		}
		
		resultado = prueba.numerosImparesMayoresQueInOrden(raiz, 0);
		System.out.println();
		for (i=0;i<resultado.size();i++) {
			System.out.print(resultado.get(i) + " ");
		}
		
		resultado = prueba.numerosImparesMayoresQuePostOrden(raiz, 0);
		
		System.out.println();
		for (i=0;i<resultado.size();i++) {
			System.out.print(resultado.get(i) + " ");
		}
		
		resultado = prueba.numerosImparesMayoresQuePorNiveles(raiz, 0);
		
		System.out.println();
		for (i=0;i<resultado.size();i++) {
			System.out.print(resultado.get(i) + " ");
		}
		
	}
	
	
}