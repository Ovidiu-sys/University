// PROBLEMA P2:
// Scrieţi un program Java care să determine numărul de parametri
//furnizaţi în linia de comandă la execuţia programului. Dacă acest număr
//este 0, atunci programul afişează “0 argumente”; dacă în linia de
//comandă se furnizează un singur parametru atunci programul
//afişează “1 argument” precum şi valoarea acestui argument; altfel se va afişa textul “mai multe argumente” şi valorile acestora.


import java.util.Scanner;

void main(String[] args) {

    if (args.length == 0)
        System.out.println("0 argumente");
    else if (args.length == 1){
        System.out.println("1 argument");
        System.out.println("Valoare este: " + args[0]);
    }
    else{
        System.out.println("mai multe argumente");
        System.out.println("Valorile acestora sunt: ");
        for (int i=0;i<args.length;i++) {
            System.out.println("args["+i+"] = " + args[i]);
        }
    }
}
