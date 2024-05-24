package sumaNegativos;

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Programa que trata un array bidimensional, con una dimensión de enteros negativos y otra de enteros positivos.
 * @author Francesco Fevoli
 * @version 1.0
 */
public class Main {
    /**
     * Scanner como variable global para su uso en varias funciones y métodos.
     */
    private static final Scanner sc = new Scanner(System.in);

    /** Inicializa el array de enteros de dos dimensiones y 5 índices en cada dimensión.
     * @return Array bidimensional de enteros.
     */
    private static int [][] inicializarArray (){
        int[][] numeros;
        numeros = new int [2][];
        numeros [0] = new int[5];
        numeros [1] = new int[5];
        return numeros;
    }

    /**
     * Permite al usuario introducir los números negativos.
     * @param negativos Array de enteros.
     * @return Array de enteros negativos.
     * @throws IllegalArgumentException Si los números no son negativos.
     */
    private static int[] introducirNegativos (int[] negativos){
        boolean repetir;
        for (int i = 0; i < negativos.length; i++) {
            do {
                repetir = false;
                try {
                    System.out.println("Introduzca un número negativo: ");
                    negativos[i] = sc.nextInt();
                    if (negativos [i] >= 0) {
                        throw new IllegalArgumentException("Número no negativo."); //Excepción si los números no son negativos.
                    }
                    sc.nextLine();
                } catch (InputMismatchException e) {
                    System.err.println("ERROR: Sólo puede introducir números. Inténtelo de nuevo.");
                    repetir = true;
                    sc.nextLine();
                }
                catch (NumberFormatException e) {
                    System.err.println("ERROR: Valor no válido. Inténtelo de nuevo.");
                    repetir = true;
                    sc.nextLine();
                } catch(IllegalArgumentException e2)  {
                    e2.printStackTrace();
                    System.out.println("ERROR: "+e2.getMessage());
                    repetir = true;
                }
            }while (repetir);
        }
        return negativos;
    }

    /**
     * Permite al usuario introducir los números positivos..
     * @param positivos Array de enteros.
     * @return Array de enteros positivos.
     * @throws IllegalArgumentException Si los números no son positivos.
     */
    private static int[] introducirPositivos (int[] positivos){
        boolean repetir;
        for (int i = 0; i < positivos.length; i++) {
            do {
                repetir = false;
                try {
                    System.out.println("Introduzca un número positivo: ");
                    positivos[i] = sc.nextInt();
                    if (positivos [i] < 0) {
                        throw new IllegalArgumentException("Número no positivo."); //Excepción si los números no son positivos.
                    }
                    sc.nextLine();
                } catch (InputMismatchException e) {
                    System.err.println("ERROR: Sólo puede introducir números. Inténtelo de nuevo.");
                    repetir = true;
                    sc.nextLine();
                }
                catch (NumberFormatException e) {
                    System.err.println("ERROR: Valor no válido. Inténtelo de nuevo.");
                    repetir = true;
                    sc.nextLine();
                } catch(IllegalArgumentException e3)  {
                    e3.printStackTrace();
                    System.out.println("ERROR: "+e3.getMessage());
                    repetir = true;
                }
            }while (repetir);
        }
        return positivos;
    }

    /**
     * Suma todos los componentes de un array de enteros.
     * @param sumandos
     * @return Suma del array.
     */
    private static int sumarArray (int[] sumandos) {
        int suma = 0;
        for (int i = 0; i < sumandos.length; i++) {
            suma += sumandos[i];
        }
        return suma;
    }


    /**
     * Menu de opciones para el programa.
     * @param numeros Array bidimensional de enteros.
     */
    private static void menu (int[][] numeros) {
        int opcion = 1;
        System.out.println("Este programa permite gestionar un array bidimensional de números negativos y positivos.\nOpciones:\n1. Introducir valores en el array.\n2. Calcular la media.\n3.Calcular la suma.\n4. Mostrar el array ordenado de menor a mayor.\n0. Salir");
        while (opcion != 0) {
            boolean repetir;
            do {
                repetir = false;
                try {
                    System.out.println("Introduzca su opción: ");
                    opcion = sc.nextInt();
                } catch (InputMismatchException e) {
                    System.err.println("ERROR: Sólo puede introducir números. Inténtelo de nuevo.");
                    repetir = true;
                    sc.nextLine();
                }
            } while (repetir);
            switch (opcion) {
                case 1:
                    introducirNegativos(numeros[0]);
                    introducirPositivos(numeros[1]);
                    break;
                case 2:
                    System.out.println("Media del array de números negativos: " + (double) sumarArray(numeros[0]) / numeros[0].length);
                    System.out.println("Media del array de números positivos: " + (double) sumarArray(numeros[1]) / numeros[1].length);
                    System.out.println("Media de ambos arrays: " + (double) (sumarArray(numeros[0]) + sumarArray(numeros[1])) / (numeros[0].length + numeros[1].length));
                    break;
                case 3:
                    System.out.println("Suma del array de números negativos: " + sumarArray(numeros[0]));
                    System.out.println("Suma del array de números positivos: " + sumarArray(numeros[1]));
                    System.out.println("Suma de ambos arrays: " + (sumarArray(numeros[0]) + sumarArray(numeros[1])));
                    break;
                case 4:
                    Arrays.sort(numeros[0]);
                    Arrays.sort(numeros[1]);
                    System.out.println("Array bidimensional de números negativos y positivos: "+ Arrays.deepToString(numeros));
                    break;
                case 0:
                    System.out.println("Saliendo...");
                    break;
                default:
                    System.err.println("Introduzca un número válido.");
                    break;
            }
        }
    }

    /**
     * Método principal del programa.
     * @param args
     */
    public static void main(String[] args) {
        menu(inicializarArray());
    }
}
