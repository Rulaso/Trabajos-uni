package Punto5;

public class Dato {
	private int minimo;
	private int	maximo;
	private double promedio;
	
	public Dato(int minimo, int maximo, double promedio) {
		this.minimo = minimo;
		this.maximo = maximo;
		this.promedio = promedio;
	}
	public Dato() {
		
	}
	public int getMinimo() {
		return minimo;
	}
	public void setMinimo(int minimo) {
		this.minimo = minimo;
	}
	public int getMaximo() {
		return maximo;
	}
	public void setMaximo(int maximo) {
		this.maximo = maximo;
	}
	public double getPromedio() {
		return promedio;
	}
	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}	
}