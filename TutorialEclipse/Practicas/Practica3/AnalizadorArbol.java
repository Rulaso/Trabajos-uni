package Practica3;

import java.util.List;
import Practica2.Queue;
public class AnalizadorArbol {
	
	public AnalizadorArbol() {}
	
	public double devolverMaximoPromedio(GeneralTree<AreaEmpresa> arbol) {
		double mayorPromedio = 0;
		if(arbol != null && !arbol.isEmpty()) {
			mayorPromedio = buscarMayorPromedioPorNivel(arbol);
		}
		return mayorPromedio;
	}
	
	private double buscarMayorPromedioPorNivel(GeneralTree<AreaEmpresa> a) {
		int cont = 0; int valAct = 0;
		double mayorActual = -1;
		Queue<GeneralTree<AreaEmpresa>> cola = new Queue<GeneralTree<AreaEmpresa>>();
		cola.enqueue(a);
		cola.enqueue(null);
		while(!cola.isEmpty()) {
			GeneralTree<AreaEmpresa> nodo = cola.dequeue();
			if(nodo != null) {
				valAct += nodo.getData().getRetardo();
				cont++;
				List<GeneralTree<AreaEmpresa>> hijos = nodo.getChildren();
				for (GeneralTree<AreaEmpresa> hijo: hijos) {
					cola.enqueue(hijo);
				}

			} else {
				if(!cola.isEmpty()) {
					cola.enqueue(null);
				}
				double promAct = valAct/(double) cont;
				cont =0;
				valAct = 0;
				if(promAct > mayorActual) {
					mayorActual = promAct;
				}
			}
			
		}
		
		return mayorActual;
	}
}