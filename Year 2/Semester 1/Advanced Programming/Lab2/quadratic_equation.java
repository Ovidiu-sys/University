// PROBLEMA P1: Scrieţi un program Java pentru a rezolva ecuaţia de gradul doi.

import java.util.Scanner;

void main(){

    Scanner scanner = new Scanner(System.in);

    System.out.print("Introduceti a: ");
    double a = scanner.nextDouble();

    System.out.print("Introduceti b: ");
    double b = scanner.nextDouble();

    System.out.print("Introduceti c:"); // citim a,b,c
    double c = scanner.nextDouble();

    if(a==0){
        if(b == 0){ // verificam pentru fiecare caz in parte si ne asiguram ca se poate calcula delta corect
            if (c == 0)
                System.out.print("Ecuatia are o infinitate de solutii 0=0");
            else
                System.out.print("Ecuatia nu are solutii");
        }
        else {
            double x = -c / b;
            System.out.print("Ecuatia este de fapt de gradul 1 ( a=0 ). Solutia este x = " + x);
        }
    }
    else{
        double delta = b*b - 4*a*c; // delta = b^2 - 4ac

        if(delta > 0) {
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            double x2 = ( -b - Math.sqrt(delta)) / (2 * a); // calculam x1,x2 pentru delta pozitiv
            System.out.print("Ecuatia are doua radacini reale si distincte: \n");
            System.out.println("x1 = " + x1);
            System.out.println("x2 = " + x2);
        }
        else if(delta == 0 ){
            double x = -b / (2*a);   // x1 == x2 pentru delta = 0
            System.out.print("Ecuatia are o radacina reala dubla:\n");
            System.out.print("x1 == x2 == " + x);
        }
        else{
            double ptintreaga = -b / (2*a);
            double ptimaginara = Math.sqrt(-delta) / (2*a); // pentru delta < 0, x1,x2 sunt solutii complexe. 
            System.out.print("Ecuatia are doua solutii complexe conjugate: \n");
            System.out.printf("x1 = %.2f + %.2fi\n", ptintreaga, ptimaginara);
            System.out.printf("x2 = %.2f - %.2fi\n", ptintreaga, ptimaginara);
        }
    }
    scanner.close();
};
