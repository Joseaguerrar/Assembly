#include <iostream>
#include <fstream>

using namespace std;

extern "C" float* producto_cruz (float[], float[]);

int main () {
    ifstream archivo_entrada("vectores.txt");
    ofstream archivo_salida("resultados.txt");

    if (!archivo_entrada.is_open() || !archivo_salida.is_open()){
        cout << "Error al abrir los archivos." << endl;
        return 1;
    }

    float vector1[3];
    float vector2[3]; 
    float* resultado = new float[3];
    
    while(archivo_entrada >> vector1[0] >> vector1[1] >> vector1[2] >> vector2[0] >> vector2[1] >> vector2[2]){
        resultado = producto_cruz(vector1, vector2);
        archivo_salida << resultado[0] << ", " << resultado[1] << ", " << resultado[2] << endl; 
    }

    // Primer vector
    //cout << "Ingrese el primer vector (3 números separados por espacio): ";
    //cin >> vector1[0];
    //cin >> vector1[1];
    //cin >> vector1[2];

    // Segundo vector
    //cout << "Ingrese el segundo vector (3 números separados por espacio): ";
    //cin >> vector2[0];
    //cin >> vector2[1];
    //cin >> vector2[2];

    //cout << "El producto cruz es: (" << resultado[0] << ", " << resultado[1] << ", " << resultado[2] << ")." << endl;
    
    archivo_entrada.close();
    archivo_salida.close();
    cout << "Listo" << endl;
    return 0;
}