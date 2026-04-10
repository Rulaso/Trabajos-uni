package Practica2;

import java.util.List;
import java.util.LinkedList;

public class Test{
	public static void main(String[] args) {
		BinaryTree<Integer> prueba = new BinaryTree<>(10);
		BinaryTree<Integer> hijoIZ = new BinaryTree<>(20);
		hijoIZ.addLeftChild(new BinaryTree<Integer>(90));
		hijoIZ.addRightChild(new BinaryTree<Integer>(55));
		BinaryTree<Integer> hijoDE = new BinaryTree<Integer>(44);
		hijoDE.addLeftChild(new BinaryTree<Integer>(22));
		hijoDE.addRightChild(new BinaryTree<Integer>(12));
		prueba.addLeftChild(hijoIZ);
		prueba.addRightChild(hijoDE);
		
		prueba.entreNiveles(0, 2);
		System.out.println("TERMINE");
		
		/*ContadorArbol pruebaPares = new ContadorArbol(prueba);
		
		List<Integer> aaa = new LinkedList<Integer>(); 
		aaa.addAll(pruebaPares.numerosPares());
		
		for (int i=0; i<aaa.size();i++) {
			System.out.println(aaa.get(i));
		}
		
		RedBinariaLLena pruebaRetardo = new RedBinariaLLena(prueba);	
		System.out.println(pruebaRetardo.retardoReenvio());
		
		ProfundidadDeArbolBinario pruebaProf = new ProfundidadDeArbolBinario(prueba);
		
		System.out.println(pruebaProf.sumaElementosProfundidad(2));*/
		BinaryTree<Integer> transformado = new BinaryTree<Integer>();
		Transformacion pruebaTrans =  new Transformacion(prueba);
		
		transformado = pruebaTrans.Suma();
		
		transformado.entreNiveles(0, 2);
	}
}