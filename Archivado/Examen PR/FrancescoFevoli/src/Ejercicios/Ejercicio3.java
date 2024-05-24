/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios;
import java.util.Scanner;
import java.lang.Math;
/**
 *
 * @author alumno
 */
public class Ejercicio3 {
    public static void ecuacion (int a, int b, int c) {
        double sol1, sol2;
        int denom, suma;
        double raiz;
        if (((b*b)-4*a*c) < 0 || a == 0) { //En caso de ser la raíz cuadrada negativa (número complejo) o el denominador 0, el programa devolverá que la ecuación no tiene soluciones reales.
            System.out.println("No tiene soluciones reales.");
        }
        else { //La fórmula de la ecuación de segundo grado es: (-b +- (b^2 - 4*a*c)^-1)/2*a
            denom = 2 * a; //El denominador de la fórmula, el 2*a.
            suma = b * -1; //El primer elemento, -b.
            raiz = Math.sqrt((b*b)-4*a*c); //Los elementos dentro de la raíz cuadrada: (b^2 - 4*a*c)^-1.
            sol1 = (double) (suma + raiz)/denom; //La primera solución es sumando el -b con la raíz cuadrada.
            System.out.printf("La solución 1 es: %.2f", sol1); //Se muestran únicamente dos decimales.
            sol2 = (double) (suma - raiz)/denom; //La segunda solución es restándole la raíz cuadrada a -b.
            System.out.printf("\nLa solución 2 es: %.2f",sol2);
        }
    }
    public static void main(String[] args) {
        int a, b, c;
        Scanner teclado = new Scanner(System.in);
        System.out.println("Introduzca los parámetros a, b y c de la ecuación de segundo grado, separándolos pulsando la tecla Entrar.");
        a = teclado.nextInt();
        teclado.nextLine();
        b = teclado.nextInt();
        teclado.nextLine();
        c = teclado.nextInt();
        ecuacion(a, b, c);
    }
}

