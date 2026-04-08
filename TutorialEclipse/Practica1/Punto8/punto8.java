package Punto8;

public class punto8{
	public static void main(String[] args) {
		Queue<Integer> prueba = new Queue<Integer>();
		
		System.out.println(prueba.size());
		if(prueba.isEmpty()) {
			System.out.println("LA COLA ESTA VACIA");
		} else {
			System.out.println("LA COLA TIENE ELEMENTOS");
		}
		
		prueba.enqueue(22);
		prueba.enqueue(33);
		
		System.out.println(prueba.size());
		
		System.out.println(prueba.toString());
		
		prueba.dequeue();
		
		System.out.println(prueba.toString());
		
		prueba.enqueue(12);
		prueba.enqueue(123);
		prueba.dequeue();
		
		System.out.println(prueba.toString());
		
		System.out.println(prueba.head());
	}
	
	
}