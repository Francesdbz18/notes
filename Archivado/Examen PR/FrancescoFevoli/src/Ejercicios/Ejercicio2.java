/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios;
import java.util.Scanner;

/**
 *
 * @author Francesco Fevoli Chacón
 */
public class Ejercicio2 {
    public static void ABC (char mayus) {
        char letra;
        boolean enye;
        if (mayus == 'M') {
            for (int i = 65; i < 91; i++) { //El índice empieza desde 65, que en la tabla de caracteres del código ASCII es la A.
                letra = (char) i;
                if (i == 90) System.out.print(letra + ".");
                else {
                    System.out.print(letra + " ");
                    enye = (i == 78)? true:false; //Cuando se imprima la N (78), la condición se cumplirá y se imprimirá la Ñ.
                    if (enye) {
                        letra = 'Ñ';
                        System.out.print(letra + " ");
                    }
                }
            }
        }
        if (mayus == 'm') {
            for (int i = 97; i < 123; i++) { //El índice empieza desde 97, que en la tabla de caracteres del código ASCII es la a.
                letra = (char) i;
                if (i == 122) System.out.print(letra + ".");
                else {
                    System.out.print(letra + " ");
                    enye = (i == 110)? true:false; //Cuando se imprima la n (110), la condición se cumplirá y se imprimirá la ñ.
                    if (enye) {
                        letra = 'ñ';
                        System.out.print(Character.toLowerCase(letra) + " ");
                    }
                }
            }
        }
    }
    public static void menu () {
        Scanner teclado = new Scanner(System.in);
        char mayus = 'a';
        System.out.print("Este programa imprime el abecedario español en mayúsculas o en minúsculas.\nm: Imprime el abecedario español en minúsculas.\nM: Imprime el abecedario español en mayúsculas.\ns o S: Sale del programa.");
        while (mayus != 's') {
            System.out.print("\nElija su opción: ");
            mayus = teclado.next().charAt(0);
            switch (mayus) {
                case 'm':
                    ABC(mayus);
                    break;
                case 'M':
                    ABC(mayus);
                    break;
                case 's':
                    System.out.println("Saliendo...");
                    break;
                case 'S':
                    System.out.println("Saliendo...");
                    mayus = 's'; //Cambia la S por una s para que el bucle while finalice.
                    break;
                default:
                    System.out.println("Introduzca una opción válida.");
                    break;
            }
        }
    }
    public static void main(String[] args) {
        menu();
    }
}
