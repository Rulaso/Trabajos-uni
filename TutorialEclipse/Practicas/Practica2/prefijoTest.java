package Practica2;

public class prefijoTest{
	public static void main(String[] args) {
		// --- Construcción del "arbol 1" ---
        // Instanciar los nodos individuales con sus valores enteros
        BinaryTree<Integer> root1 = new BinaryTree<>(65);
        BinaryTree<Integer> node37 = new BinaryTree<>(37);
        BinaryTree<Integer> node81 = new BinaryTree<>(81);
        BinaryTree<Integer> node47 = new BinaryTree<>(47);
        BinaryTree<Integer> node93 = new BinaryTree<>(93);

        // Armar la estructura del arbol 1 usando addLeftChild() y addRightChild()
        root1.addLeftChild(node37);
        root1.addRightChild(node81);

        node37.addRightChild(node47); // El hijo izquierdo permanece nulo por defecto
        
        node81.addRightChild(node93); // El hijo izquierdo permanece nulo por defecto

        


        // --- Construcción del "arbol 2" ---
        // Instanciar todos los nodos necesarios para el arbol 2
        BinaryTree<Integer> root2 = new BinaryTree<>(65);
        BinaryTree<Integer> node37_2 = new BinaryTree<>(37);
        BinaryTree<Integer> node81_2 = new BinaryTree<>(81);
        BinaryTree<Integer> node22 = new BinaryTree<>(22);
        BinaryTree<Integer> node47_2 = new BinaryTree<>(47);
        BinaryTree<Integer> node76 = new BinaryTree<>(76);
        BinaryTree<Integer> node93_2 = new BinaryTree<>(93);
        BinaryTree<Integer> node11 = new BinaryTree<>(11);
        BinaryTree<Integer> node29 = new BinaryTree<>(29);
        BinaryTree<Integer> node85 = new BinaryTree<>(85);
        BinaryTree<Integer> node94 = new BinaryTree<>(94);

        // Armar la estructura del arbol 2 (nivel por nivel)
        // Nivel 0 (Raíz)
        root2.addLeftChild(node37_2);
        root2.addRightChild(node81_2);

        // Nivel 1 (Hijos de la raíz)
        node37_2.addLeftChild(node22);
        node37_2.addRightChild(node47_2);
        node81_2.addLeftChild(node76);
        node81_2.addRightChild(node93_2);

        // Nivel 2 (Hijos de los nodos 22 y 93)
        node22.addLeftChild(node11);
        node22.addRightChild(node29);
        node93_2.addLeftChild(node85);
        node93_2.addRightChild(node94);
        
        BinaryTree<Integer> node11_3 = new BinaryTree<>(11);
        BinaryTree<Integer> node29_3 = new BinaryTree<>(29);
        BinaryTree<Integer> node47_3 = new BinaryTree<>(47);
        BinaryTree<Integer> node76_3 = new BinaryTree<>(76);

        // Nivel 2
        BinaryTree<Integer> node22_3 = new BinaryTree<>(22);
        node22.addLeftChild(node11);
        node22.addRightChild(node29);

        // Nivel 1 (los hijos directos de la raíz original)
        BinaryTree<Integer> node37_3 = new BinaryTree<>(37);
        node37.addLeftChild(node22);
        node37.addRightChild(node47);

        BinaryTree<Integer> node81_3 = new BinaryTree<>(81);
        node81.addLeftChild(node76);
        // El hijo derecho de 81 no se define, permanece null

        // --- Creación de la nueva raíz "root 3" ---
        // Creamos el nodo raíz con el valor 3
        BinaryTree<Integer> root3 = new BinaryTree<>(65);

        // --- Conexión de la nueva raíz a los subárboles originales ---
        // Conectamos los subárboles originales como hijos de la nueva raíz
        root3.addLeftChild(node37);
        root3.addRightChild(node81);

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