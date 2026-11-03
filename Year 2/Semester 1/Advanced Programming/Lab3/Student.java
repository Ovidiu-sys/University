// P1
// Scrieţi clasa Student. Fiecare student are un nume, an, grupă, şi două
//note obţinute la o anumită materie - una pe semestrul 1 iar cealaltă pe
//semestrul 2. Clasa conţine un constructor ce iniţializează datele membru
//ale clasei la valorile parametrilor săi, o funcţie care calculează şi
//returnează media celor două note, şi o funcţie de afişare ce afişează
//valorile datelor membru şi valoarea mediei. Scrieţi un program complet
//în care să utilizaţi obiecte ale clasei Student.


class Student{

    private String nume;
    private int an;
    private int grupa;
    private double sem1;
    private double sem2;

    public Student(String nume, int an, int grupa, double sem1, double sem2){
        this.nume = nume;
        this.an = an;
        this.grupa = grupa;
        this.sem1 = sem1;
        this.sem2 = sem2;
    }

    public double medie(){
        return (sem1+sem2)/2.0;
    }

    public void afisare(){
        System.out.println("Nume student: " + nume);
        System.out.println("An de studiu: " + an);
        System.out.println("Grupă: " + grupa);
        System.out.println("Nota Semestrul 1: " + sem1);
        System.out.println("Nota Semestrul 2: " + sem2);
        System.out.println("Media celor două note: " + medie());
        System.out.println("\n\n\n");
    }
};

public class Main {
    public static void main(String[] args) {
        Student s1 = new Student("Popescu Ion", 2, 21, 8.50, 9.50);
        Student s2 = new Student("Ionescu Maria", 1, 22, 10.00, 9.00);

        s1.afisare();
        s2.afisare();
    }
}
