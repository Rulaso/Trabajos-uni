package Punto1;

public class Metodos{
	
	public static void mostrarConFor(int a, int b) {
		for (int i = a;i<=b;i++) {
			System.out.println(i);
		}
		System.out.println("SE IMPRIMIERON LOS VALORES CON UN FOR");
	}
	
	public static void mostrarConWhile(int a, int b) {
		while(a<=b){
			System.out.println(a);
			a++;
		}
		System.out.println("SE IMPRIMIERON LOS VALORES CON UN WHILE");
	}
	
	public static int mostrarRecursivo(int a, int b) {
		if(a>b) {
			System.out.println("SE IMPRIMIERON RECURSIVAMENTE");
			return 0;
		} else {
			System.out.println(a);
			a++;
			mostrarRecursivo(a, b);
			return 0;
		}
	}
	
}