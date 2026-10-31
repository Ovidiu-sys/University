// PROBLEMA 4:
// Scrieti un program Java ce constă din următoarele: Se construieşte un vector
//unidimensional cu elemente de tip float şi se iniţializează elementele
//cu valori arbitrare alese de programator (atât pozitive cât şi
//negative). Într-o buclă iterativă se vor afişa valorile acestor elemente
//cu următoarea specificare: dacă se întâlneşte un element negativ nu se
//va afişa ci se va sări la următorul element din vector.

void main() {

    float[] nr = {12.5f, -3.4f, 0.0f, 7.8f, -15.2f, -0.1f, 42.0f};

    for (int i=0;i<nr.length;i++){
        if( nr[i] < 0 )
            continue;
        System.out.println("Float pozitiv: "+ nr[i]);
    }

}
