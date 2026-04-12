package Practica2;

public class prefijoTest{
	public static void main(String[] args) {
		// --- Construcción del "arbol 1" ---
        BinaryTree<Integer> root1 = new BinaryTree<Integer>(65);
        BinaryTree<Integer> nodo37 = new BinaryTree<Integer>(37);
        nodo37.addRightChild(new BinaryTree<Integer>(47));
        BinaryTree<Integer> nodo81 = new BinaryTree<Integer>(81);
        nodo81.addRightChild(new BinaryTree<Integer>(93));
        root1.addLeftChild(nodo37);
        root1.addRightChild(nodo81);

        
        // --- Construccion del "arbol 2" ---
        BinaryTree<Integer> root2 = new BinaryTree<Integer>(65);
        BinaryTree<Integer> nodo37_2 = new BinaryTree<Integer>(37);
        BinaryTree<Integer> nodo22 = new BinaryTree<Integer>(22);
        nodo37_2.addLeftChild(nodo22);
        nodo37_2.addRightChild(new BinaryTree<Integer>(47));
        nodo22.addLeftChild(new BinaryTree<Integer>(11));
        nodo22.addRightChild(new BinaryTree<Integer>(29));
        BinaryTree<Integer> nodo81_2 = new BinaryTree<Integer>(81);
        BinaryTree<Integer> nodo93 = new BinaryTree<Integer>(93);
        nodo93.addLeftChild(new BinaryTree<Integer>(85));
        nodo93.addRightChild(new BinaryTree<Integer>(94));
        nodo81_2.addLeftChild(new BinaryTree<Integer>(76));
        nodo81_2.addRightChild(nodo93);
        root2.addLeftChild(nodo37_2);
        root2.addRightChild(nodo81_2);
        
        // --- Construccion del "arbol 3" --- 
        BinaryTree<Integer> root3 = new BinaryTree<Integer>(65);
        BinaryTree<Integer> nodo37_3 = new BinaryTree<Integer>(37);
        BinaryTree<Integer> nodo22_3 = new BinaryTree<Integer>(22);
        nodo22_3.addLeftChild(new BinaryTree<Integer>(11));
        nodo22_3.addRightChild(new BinaryTree<Integer>(29));
        nodo37_3.addLeftChild(nodo22_3);
        nodo37_3.addRightChild(new BinaryTree<Integer>(47));
        BinaryTree<Integer>nodo81_3 = new BinaryTree<Integer>(81);
        nodo81_3.addLeftChild(new BinaryTree<Integer>(76));
        root3.addLeftChild(nodo37_3);
        root3.addRightChild(nodo81_3);
        
        // --- TERMINO LA ETAPA DE CONSTRUCCION DE ARBOLES ---
        
        root1.printPreorden();
        System.out.println("TERMINE ");
        System.out.println();
        root2.printPreorden();
        System.out.println("TERMINE");
        System.out.println();
        root3.printPreorden();
        System.out.println("TERMINE");
        System.out.println();
       
		Prefijo prueba = new Prefijo();
		
		if(prueba.esPrefijo(root1, root2)) {
			System.out.println("DEVOLVIO TRUE");
		} else {
			System.out.println("DEVOLVIO FALSE");
		}
		
	}
	
	
}