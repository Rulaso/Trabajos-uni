package ar.edu.unlp.info.oo1.ejercicio16;

public class Esfera extends Pieza{
    private double radio;

    public Esfera(String color, String material, double radio) {
        super(color, material);
        this.radio = radio;
    }

	@Override
	public double calcularVolumen(String texto) {
		return (4/3) * Math.PI * Math.pow(radio, 2);
	}

	@Override
	public double calcularSuperficie(String texto) {
		return 4 * Math.PI * Math.pow(radio, 2);
	}
}