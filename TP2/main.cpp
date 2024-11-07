#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>

// Prototipo de la función ensamblador
extern "C" void apply_sepia_filter(uint8_t* image_data, size_t width, size_t height);

struct BMPImage {
    int width, height;
    std::vector<uint8_t> data;
    uint8_t header[54];  // Guardar el encabezado completo de la imagen BMP (54 bytes)
};

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

    // Imprimir diagnóstico
    std::cout << "Ancho de la imagen: " << image.width << std::endl;
    std::cout << "Alto de la imagen: " << image.height << std::endl;

    int row_padded = (image.width * 3 + 3) & (~3); // Alinear filas a múltiplos de 4 bytes
    image.data.resize(row_padded * image.height);

    // Leer datos de la imagen
    file.read(reinterpret_cast<char*>(image.data.data()), image.data.size());

    // Confirmar que se leyeron todos los datos esperados
    std::cout << "Tamaño de los datos de la imagen: " << image.data.size() << " bytes" << std::endl;

    return image;
}

void save_bmp(const std::string& filename, const BMPImage& image) {
    std::ofstream file(filename, std::ios::binary);

    if (!file) {
        throw std::runtime_error("No se puede guardar el archivo BMP");
    }

    // Escribir el encabezado BMP original
    file.write(reinterpret_cast<const char*>(image.header), sizeof(image.header));

    // Escribir los datos de la imagen
    file.write(reinterpret_cast<const char*>(image.data.data()), image.data.size());

    // Confirmar que los datos se guardaron correctamente
    std::cout << "Archivo BMP guardado con éxito: " << filename << std::endl;
    std::cout << "Tamaño esperado de los datos: " << image.data.size() << " bytes" << std::endl;
}


// Este era para probar en c++. Los colores estan en BGR y no RGB, para esta foto al menos
void apply_sepia_filter_cpp(uint8_t* image_data, size_t width, size_t height) {
    int row_padded = (width * 3 + 3) & (~3);
    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t index = y * row_padded + x * 3;
            uint8_t original_b = image_data[index];       // Cargar B en lugar de R
            uint8_t original_g = image_data[index + 1];   // G permanece igual
            uint8_t original_r = image_data[index + 2];   // Cargar R en la última posición

            // Aplicar la fórmula de sepia
            int sepia_r = std::min(255, static_cast<int>(0.393 * original_r + 0.769 * original_g + 0.189 * original_b));
            int sepia_g = std::min(255, static_cast<int>(0.349 * original_r + 0.686 * original_g + 0.168 * original_b));
            int sepia_b = std::min(255, static_cast<int>(0.272 * original_r + 0.534 * original_g + 0.131 * original_b));

            // Guardar los nuevos valores sepia en orden BGR
            image_data[index] = static_cast<uint8_t>(sepia_b);       // Guardar B
            image_data[index + 1] = static_cast<uint8_t>(sepia_g);   // Guardar G
            image_data[index + 2] = static_cast<uint8_t>(sepia_r);   // Guardar R
        }
    }
}


int main() {
    try {
        BMPImage image = load_bmp("entrada.bmp");

        std::cout << "Dirección de inicio de image.data: " << static_cast<void*>(image.data.data()) << std::endl;
        std::cout << "Alineación de image.data: " << (reinterpret_cast<uintptr_t>(image.data.data()) % 16) << std::endl;
        apply_sepia_filter(image.data.data(), image.width, image.height);

        save_bmp("salida_sepia.bmp", image);

        std::cout << "Imagen cargada" << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}

