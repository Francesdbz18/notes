package complejo;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Clase que trata un número complejo, con su parte imaginaria y su parte real. Permite sumarlos, introducirlos y mostrarlos por pantalla.
 * @author Francesco Fevoli
 * @version 1.0
 */
public class Main {

    /**
     * Permite al usuario introducir dos números complejos para posteriormente verlos y sumarlos.
     */
    public static void menu () {
        Complejo a = new Complejo(); //Se inicializan ambos Complejo a 0.
        Complejo b = new Complejo();
        System.out.println("Introduzca dos números complejos.");
        System.out.println("Número complejo a:");
        introducirComplejo(a); //Se introducen ambos complejos.
        System.out.println("Número complejo b:");
        introducirComplejo(b);
        System.out.println("Ahora se procederá a hacer la suma de: ");
        System.out.println("Número complejo a: "+a.toString());
        System.out.println("Número complejo b: "+b.toString());
        Complejo suma = a.sumar(b); //Se inicializa un nuevo complejo con la suma de los dos anteriores.
        System.out.println("Suma de ambos números complejos: "+ suma.toString());
    }

    /**
     * Método para introducir ambos números complejos, con tratamiento de excepciones.
     * @param complejo
     */
    private static void introducirComplejo(Complejo complejo) {
        Scanner sc = new Scanner(System.in);
        boolean repetir;
        do {
            repetir = false;
            try {
                System.out.println("Parte real: ");
                complejo.cambiaReal(sc.nextDouble());
            } catch (InputMismatchException e) { //Da una excepción si lo que se introdujo por teclado no es un número.
                repetir = true;
                System.err.println("ERROR: Sólo puede introducir números. Inténtelo de nuevo.");
                sc.nextLine();
            }
        } while (repetir);

        do {
            repetir = false;
            try {
                System.out.println("Parte imaginaria: ");
                complejo.cambiaImag(sc.nextDouble());
                sc.nextLine();
            } catch (InputMismatchException e) {
                repetir = true;
                System.err.println("ERROR: Sólo puede introducir números. Inténtelo de nuevo.");
                sc.nextLine();
            }
        } while (repetir);
    }

    /**
     * Método principal.
     * @param args
     */
    public static void main(String[] args) {
        menu();
    }
}