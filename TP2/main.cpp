#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <stdexcept>

// Prototipo de la función ensambladora
extern "C" void apply_sepia_filter(uint8_t* data, size_t length);

// Estructura para la imagen BMP
struct BMPImage {
    int width, height;
    std::vector<uint8_t> data;
    uint8_t header[54];  // Guardar el encabezado completo de la imagen BMP (54 bytes)
};

// Función para cargar la imagen BMP
BMPImage load_bmp(const std::string& filename) {
    BMPImage image;
    std::ifstream file(filename, std::ios::binary);

    if (!file) {
        throw std::runtime_error("No se puede abrir el archivo BMP");
    }

    // Leer el encabezado BMP (54 bytes)
    file.read(reinterpret_cast<char*>(image.header), 54);

    // Obtener dimensiones de la imagen desde el encabezado
    image.width = *reinterpret_cast<int*>(&image.header[18]);
    image.height = *reinterpret_cast<int*>(&image.header[22]);

    int row_padded = (image.width * 3 + 3) & (~3); // Alinear filas a múltiplos de 4 bytes
    image.data.resize(row_padded * image.height);

    // Leer datos de la imagen
    file.read(reinterpret_cast<char*>(image.data.data()), image.data.size());

    return image;
}

// Función para guardar la imagen BMP
void save_bmp(const std::string& filename, const BMPImage& image) {
    std::ofstream file(filename, std::ios::binary);

    if (!file) {
        throw std::runtime_error("No se puede guardar el archivo BMP");
    }

    // Escribir el encabezado BMP original
    file.write(reinterpret_cast<const char*>(image.header), sizeof(image.header));

    // Escribir los datos de la imagen
    file.write(reinterpret_cast<const char*>(image.data.data()), image.data.size());
}

int main() {
    try {
        BMPImage image = load_bmp("entrada.bmp");

        // Llamar a la función ensambladora para aplicar el filtro sepia
        apply_sepia_filter(image.data.data(), image.data.size());

        // Guardar la imagen de salida
        save_bmp("salida_sepia.bmp", image);

        std::cout << "Filtro sepia aplicado y guardado en salida_sepia.bmp\n";
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
