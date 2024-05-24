package complejo;

/**
 * Objeto que representa un número complejo, con su parte imaginaria y su parte real.
 * @author Francesco Fevoli
 * @version 1.0
 */
public class Complejo {
    /**
     * Parte real del número complejo almacenada en una variable de tipo double.
     */
    private double real;

    /**
     * Parte imaginaria del número complejo almacenada en una variable de tipo double.
     */
    private double imag;

    /**
     * Constructor de un objeto de tipo Complejo con los atributos inicializados a cero.
     */
    public Complejo () {
        real = 0;
        imag = 0;
    }

    /**
     * Constructor de un objeto de tipo Completo con los atributos de la clase pasados como parámetros.
     * @param real
     * @param imag
     */
    public Complejo (double real, double imag) {
        this.real = real;
        this.imag = imag;
    }

    /**
     * Devuelve la parte real del objeto como una variable de tipo double.
     * @return Parte real.
     */
    public double getReal() {
        return real;
    }

    /**
     * Cambia la parte real por un double pasado como argumento.
     * @param real Número que pasará a ser la parte real.
     */
    public void cambiaReal(double real) {
        this.real = real;
    }

    /**
     * Devuelve la parte imaginaria del objeto como una variable de tipo double.
     * @return Parte imaginaria.
     */
    public double getImag() {
        return imag;
    }

    /**
     *  Cambia la parte imaginaria por un double pasado como argumento
     * @param imag Número que pasará a ser la parte imaginaria.
     */
    public void cambiaImag(double imag) {
        this.imag = imag;
    }

    /**
     * Imprime por pantalla la parte real del número complejo.
     */
    void consultaReal() {
        System.out.println("Parte real: "+real);
    }

    /**
     * Imprime por pantalla la parte imaginaria del número complejo.
     */
    void consultaImaginaria() {
        System.out.println("Parte imaginaria: "+imag+"i");
    }

    /**
     * Suma dos números complejos.
     * @param b Segundo número complejo.
     * @return Suma.
     */
    Complejo sumar (Complejo b) {
        Complejo suma = new Complejo();
        suma.cambiaReal(real+b.real);
        suma.cambiaImag(imag + b.imag);
        return suma;
    }

    @Override
    public String toString() {
        return real+" + "+imag+"i";
    }
}
