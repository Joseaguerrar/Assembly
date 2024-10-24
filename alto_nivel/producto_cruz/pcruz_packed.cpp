#include <iostream>
#include <fstream>
#include <cstdlib>  // Para aligned_alloc y free

using namespace std;

extern "C" void producto_cruz_packed(float[], float[], float[]);

int main () {
    ifstream archivo_entrada("vectors.txt");
    ofstream archivo_salida("resultados.txt");

    if (!archivo_entrada.is_open() || !archivo_salida.is_open()){
        cout << "Error al abrir los archivos." << endl;
        return 1;
    }

    // Asumiendo que vamos a procesar bloques de 8 vectores
    const int VECTOR_SIZE = 3 * 8;
    float* vector1 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* vector2 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* resultado = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));

    if (vector1 == nullptr || vector2 == nullptr || resultado == nullptr) {
        cout << "Error al asignar memoria" << endl;
        return 1;
    }

    while (archivo_entrada >> vector1[0] >> vector1[1] >> vector1[2] >> vector2[0] >> vector2[1] >> vector2[2]) {
        bool datos_completos = true;

        for (int i = 3; i < VECTOR_SIZE; i += 3) {
            if (!(archivo_entrada >> vector1[i] >> vector1[i+1] >> vector1[i+2])) {
                datos_completos = false;
                break;
            }
            if (!(archivo_entrada >> vector2[i] >> vector2[i+1] >> vector2[i+2])) {
                datos_completos = false;
                break;
            }
        }

        if (!datos_completos) {
            cout << "Datos insuficientes en el archivo para llenar los 8 vectores." << endl;
            break;
        }

        // Depuración: Imprimir los valores de los vectores leídos
        cout << "Valores de vector1:" << endl;
        for (int i = 0; i < VECTOR_SIZE; i += 3) {
            cout << vector1[i] << ", " << vector1[i+1] << ", " << vector1[i+2] << endl;
        }

        cout << "Valores de vector2:" << endl;
        for (int i = 0; i < VECTOR_SIZE; i += 3) {
            cout << vector2[i] << ", " << vector2[i+1] << ", " << vector2[i+2] << endl;
        }

        // Llamar a la función ensamblador
        producto_cruz_packed(vector1, vector2, resultado);

        // Guardar el resultado en el archivo
        for (int i = 0; i < VECTOR_SIZE; i += 3) {
            archivo_salida << resultado[i] << ", " << resultado[i+1] << ", " << resultado[i+2] << endl; 
        }
    }

    archivo_entrada.close();
    archivo_salida.close();
    cout << "Listo" << endl;

    // Usar free() para liberar la memoria alineada
    free(vector1);
    free(vector2);
    free(resultado);

    return 0;
}
