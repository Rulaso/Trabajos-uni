package Punto2;

import java.util.List;
import java.util.ArrayList;

public class Metodos{
	public static List ListarMultiplos(int n, List array) {
		int num=0;
		for (int i=0;i<n;i++) {
			
			num+=n;
			array.add(num);
			
			System.out.println(array.get(i));
		}
		
		return array;
	}
	
}