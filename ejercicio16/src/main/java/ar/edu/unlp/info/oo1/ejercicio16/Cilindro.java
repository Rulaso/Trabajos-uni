package ar.edu.unlp.info.oo1.ejercicio16;

public class Cilindro extends Pieza{
    private double radio;
    private double altura;

    public Cilindro(String color, String material, double radio, double altura) {
        super(color, material);
        this.radio = radio;
        this.altura = altura;
    }

	@Override
	public double calcularVolumen(String texto) {
        return altura * Math.PI * Math.pow(radio, 2);
	}

	@Override
	public double calcularSuperficie(String texto) {
        return 2 * Math.PI * radio * altura + 2 * Math.PI * Math.pow(radio, 2);
	}
}