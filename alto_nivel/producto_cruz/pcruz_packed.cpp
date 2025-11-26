// Jose Guerra (C33510)(50%) and Jerson Bonilla (C31225)(50%)
#include <iostream>
#include <fstream>
#include <cstdlib>

extern "C" float* producto_cruz_packed(float[], float[], float[], float[], float[], float[]);

int main () {
    std::ifstream archivo_entrada("vectors.txt");
    std::ofstream archivo_salida("resultados.txt");

    if (!archivo_entrada.is_open() || !archivo_salida.is_open()){
        std::cerr << "Error opening files." << std::endl;
        return 1;
    }

    const int VECTOR_SIZE = 4;
    float* x1 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* y1 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* z1 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* x2 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* y2 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));
    float* z2 = (float*)aligned_alloc(32, VECTOR_SIZE * sizeof(float));

    if (x1 == nullptr || y1 == nullptr || z1 == nullptr || x2 == nullptr || y2 == nullptr || z2 == nullptr) {
        std::cerr << "Memory allocation error" << std::endl;
        return 1;
    }

    int vector_count = 0;

    while (true) {
        bool datos_completos = true;

        // Read a block of 4 vectors
        for (int i = 0; i < VECTOR_SIZE; ++i) {
            if (!(archivo_entrada >> x1[i] >> y1[i] >> z1[i] >> x2[i] >> y2[i] >> z2[i])) {
                datos_completos = false;
                break;
            }
        }

        // Check if a complete block of 4 vectors was read
        if (!datos_completos) {
            break;
        }

        vector_count++;

        // Call the assembly function and receive the pointer to the results
        float* resultados = producto_cruz_packed(x1, y1, z1, x2, y2, z2);

        // Unpack the results of c1, c2, c3 (components x, y, z)
        for (int i = 0; i < VECTOR_SIZE; ++i) {
            archivo_salida << resultados[i] << ", " << resultados[i + VECTOR_SIZE] 
                           << ", " << resultados[i + 2 * VECTOR_SIZE] << std::endl;
        }
    }

    archivo_entrada.close();
    archivo_salida.close();

    free(x1);
    free(y1);
    free(z1);
    free(x2);
    free(y2);
    
    return 0;
}
