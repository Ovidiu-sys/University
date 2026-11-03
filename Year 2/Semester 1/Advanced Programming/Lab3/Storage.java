// P3: Creaţi următoarea ierarhie de clase: Disc(superclasa), SSD(subclasa), HDD(subclasa).
//Un disc are un nume şi o capacitate. Un SSD are în plus o stare (1 dacă
//este “write-protected”, 0 altfel). Un HDD are în plus un controler (de
//tip sir de caractere; exemplu: “IDE”, “SCSI”). Superclasa are un
//constructor (cu parametri) şi o funcţie de afişare (afişează valorile
//datelor membru). Clasa SSD are un constructor, o funcţie de afişare şi o
//funcţie care setează (modifică) starea SSD-ului. Clasa HDD are un
//constructor şi o funcţie de afişare. Scrieţi un program Java care
//lucrează cu obiecte de tipul celor 3 clase.

class Disc{

    protected String nume;
    protected int capacitate;

    public Disc(String nume, int capacitate){
        this.nume = nume;
        this.capacitate = capacitate;
    }

    public void afisare(){
        System.out.println("Nume disc: " + nume);
        System.out.println("Capacitate: " + capacitate + " GB");
    }
}

class SSD extends Disc {
    private int stare;

    public SSD(String nume, int capacitate, int stare){
        super(nume, capacitate);
        this.stare = stare;
    }

    public void setStare(int stare){
        this.stare = stare;
    }

    @Override
    public void afisare(){
        super.afisare();
        System.out.println("Stare " + stare + (stare == 1 ? " (Write-Protected)" : " (Writable)"));
    }
}

class HDD extends Disc{
    private String controller;

    public HDD(String nume, int capacitate, String controller){
        super(nume,capacitate);
        this.controller = controller;
    }

    @Override
    public void afisare(){
        super.afisare();
        System.out.println("Controller: " + controller);
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println("Testare Clasa Disc");
        Disc discGen = new Disc("Generic Storage", 256);
        discGen.afisare();

        System.out.println("\nTestare Clasa SSD");
        SSD ssd = new SSD("Kingston NV2", 1000, 0);
        ssd.afisare();

        System.out.println("\nModificare stare SSD");
        ssd.setStare(1);
        ssd.afisare();

        System.out.println("\nTestare Clasa HDD");
        HDD hdd = new HDD("Seagate IronWolf", 4000, "SCSI");
        hdd.afisare();
    }
}
