#include <iostream>
#include <fstream>

using namespace std;

extern "C" float* producto_cruz_packed(float[], float[]);

int main () {
    ifstream archivo_entrada("vectors.txt");
    ofstream archivo_salida("resultados.txt");

    if (!archivo_entrada.is_open() || !archivo_salida.is_open()){
        cout << "Error al abrir los archivos." << endl;
        return 1;
    }

    // Asumiendo que vamos a procesar bloques de 8 vectores
    const int VECTOR_SIZE = 3 * 8;
    float vector1[VECTOR_SIZE];
    float vector2[VECTOR_SIZE];
    float* resultado = new float[VECTOR_SIZE];

    while (archivo_entrada >> vector1[0] >> vector1[1] >> vector1[2] >> vector2[0] >> vector2[1] >> vector2[2]) {
        // Leer los 8 vectores en cada ciclo
        for (int i = 0; i < VECTOR_SIZE; i += 3) {
            archivo_entrada >> vector1[i] >> vector1[i+1] >> vector1[i+2];
            archivo_entrada >> vector2[i] >> vector2[i+1] >> vector2[i+2];
        }
        
        resultado = producto_cruz_packed(vector1, vector2);

        for (int i = 0; i < VECTOR_SIZE; i += 3) {
            archivo_salida << resultado[i] << ", " << resultado[i+1] << ", " << resultado[i+2] << endl; 
        }
    }

    archivo_entrada.close();
    archivo_salida.close();
    cout << "Listo" << endl;
    return 0;
}
