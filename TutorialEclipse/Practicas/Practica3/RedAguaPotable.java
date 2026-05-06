package Practica3;
import java.util.List;
import java.util.Iterator;

public class RedAguaPotable{
	private GeneralTree<Character> a;
	
	public RedAguaPotable(GeneralTree<Character> a) {
		this.a = a;
	}
	
	public double minimoCaudal(double caudal) {
		double minimoCaudal = caudal;
		if(this.a != null && !this.a.isEmpty()){
			minimoCaudal = buscarMinimoPreOrder(a, caudal);
		}
		return minimoCaudal;
	}
	
	private double buscarMinimoPreOrder(GeneralTree<Character> a, double caudal) {
		double posibleMinimo = 99999;
		if(a.isLeaf()) {
			posibleMinimo = caudal;
		} else {
			List<GeneralTree<Character>> hijos = a.getChildren();
			if(hijos.size() != 0) {
				caudal = caudal/(double) hijos.size();
			}
			Iterator<GeneralTree<Character>> iterador = hijos.iterator();
			while(iterador.hasNext()) {
				GeneralTree<Character> hijo = iterador.next();
				double actual = buscarMinimoPreOrder(hijo, caudal);
				if(actual < posibleMinimo) {
					posibleMinimo = actual;
				}
			}
		}
	
		return posibleMinimo;
	}
}