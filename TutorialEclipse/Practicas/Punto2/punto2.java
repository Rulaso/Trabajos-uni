package Punto2;


import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;

public class punto2{
	
public static void main(String[] args) {
	
	int n;
	List<Integer> multiplos = new ArrayList<>();
	Scanner s = new Scanner(System.in);		//CREO LA CLASE CON LA VARIABLE QUE VA A TOMAR EL VALOR DE LA LECTURA
			//LEO EL VALOR CON NEXT INT
	multiplos = Metodos.ListarMultiplos(s.nextInt(), multiplos);
	s.close();		//CIERRO EL SCANNER
	
}
}