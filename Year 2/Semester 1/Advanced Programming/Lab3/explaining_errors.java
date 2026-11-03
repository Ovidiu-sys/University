// P2 Modificaţi clasa Film astfel:
//-adăugaţi clasei o metodă statică care să returneze valoarea datei membru durata.
//-încercaţi
//să apelaţi metoda afisare( ) în cadrul metodei printCinema( ) şi
//invers, apelaţi metoda printCinema( ) în cadrul metodei afisare( ).
//Explicaţi la fiecare caz în parte rezultatele obţinute.


class Film {
    static int pretBilet=30000;
    static String cinematograf="Patria";
    public String nume;
    public int durata; // in minute
    public boolean luatOscar;

    static int getDurata(){
        return durata; // Eroare/nu compileaza. Câmpul durata este de instanță (non-static), ceea ce înseamnă că fiecare obiect de tip Film
        // are propria sa valoare pentru durată. O metodă static aparține clasei, nu unui obiect anume, și poate fi apelată fără a crea un obiect
    }

    public Film(String num,int nrMin,boolean oscar) {
        nume=num;
        durata=nrMin;
        luatOscar=oscar;
    }

    static int getPretBilet() {
        return pretBilet;
    }

    static void printCinema(Film f) {
        afisare(); // Eroare. O metodă statică nu are acces direct la metode ne-statice (afisare()), deoarece metodele nestatice
        // necesită o instanță de obiect pentru a fi executate
        System.out.println("Filmul "+f.nume+" este difuzat la cinematograful "+cinematograf);
    }

    public void afisare() {
        printCinema(this);// Codul se compilează și rulează cu succes. O metodă nestatică (de instanță) se execută în contextul unui obiect existent
        // și are acces complet la toate elementele statice ale clasei
        System.out.println("Nume: "+nume);
        System.out.println("Durata (in minute): "+durata);
        if(luatOscar)
            System.out.println("Filmul a primit premiul Oscar\n");
        else
            System.out.println("Filmul nu a primit premiul Oscar\n");
    }

    public static void main(String args[ ]) {
        System.out.println("Pretul unui bilet este: "
                +Film.getPretBilet()+" lei");
        Film f1=new Film("Titanic",180,true);
        f1.afisare();
        Film.printCinema(f1);
    }
}
