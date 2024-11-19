// Integrantes: Jose Guerra (C33510) y Jerson Bonilla (C31225)

#include <cstdint>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <vector>

/// @brief Aplica el filtro sepia a una imagen dada
/// @param data Vector con los bytes a convertir
/// @param length Número de bytes en el vector
extern "C" void apply_sepia_filter(uint8_t *data, size_t length);

/// @brief Aplica el filtro de escala de grises a una imagen dada
/// @param data Vector con los bytes a convertir
/// @param length Número de bytes en el vector
extern "C" void apply_grayscale_filter(uint8_t *data, size_t length);

/// @brief Aplica el filtro de invertir (o negativo) a una imagen dada
/// @param data Vector con los bytes a convertir
/// @param length Número de bytes en el vector
extern "C" void apply_invert_filter(uint8_t *data, size_t length);

/// @brief Aplica el filtro binarizador (o binarize) a una imagen dada
/// @param data Vector con los bytes a convertir
/// @param length Número de bytes en el vector
extern "C" void apply_binarize_filter(uint8_t *data, size_t length);

/// @brief Estructura para guardar la imagen BMP
struct BMPImage {
  int width, height;         /// Ancho y alto de la imagen
  std::vector<uint8_t> data; /// Vector de bytes
  uint8_t header[54];        /// Encabezado compledo de la imagen BMP (54 bytes)
};

/// @brief Función para cargar la imagen BMP
/// @param filename Nombre del archivo o imagen BMP
/// @return Estructura con los datos de la imagen BMP cargada
BMPImage load_bmp(const std::string &filename) {
  BMPImage image;
  std::ifstream file(filename, std::ios::binary);

  // En caso de que no exista la imagen, lanzar una excepción
  if (!file) {
    throw std::runtime_error("No se puede abrir el archivo BMP: " + filename);
  }

  // Leer el encabezado BMP (54 bytes)
  file.read(reinterpret_cast<char *>(image.header), 54);

  // Sacar las dimensiones de la imagen desde el encabezado
  image.width = *reinterpret_cast<int *>(&image.header[18]);
  image.height = *reinterpret_cast<int *>(&image.header[22]);

  // Alinear filas a múltiplos de 4 bytes
  int row_padded = (image.width * 3 + 3) & (~3);
  image.data.resize(row_padded * image.height);

  // Leer datos de la imagen como tal
  file.read(reinterpret_cast<char *>(image.data.data()), image.data.size());

  return image;
}

/// @brief Función para guardar la imagen BMP
/// @param filename Nombre de la imagen a guardar
/// @param image Referencia a la estructura con los datos de la imagen
/// respectiva
void save_bmp(const std::string &filename, const BMPImage &image) {
  std::ofstream file(filename, std::ios::binary);

  // Igualmente, si hay un error, lanzar excepción
  if (!file) {
    throw std::runtime_error("No se puede guardar el archivo BMP: " + filename);
  }

  // Escribir el encabezado BMP original de nuevo
  file.write(reinterpret_cast<const char *>(image.header),
             sizeof(image.header));

  // Escribir los datos de la nueva imagen
  file.write(reinterpret_cast<const char *>(image.data.data()),
             image.data.size());
}

/// @brief Función para abrir imagen por medio del sistema operativo
/// @param filename Nomber del archivo
void open_image(const std::string &filename) {
  if (!std::filesystem::exists(filename)) {
    std::cerr << "Error: Archivo no encontrado para abrir: " << filename
              << "\n";
    return;
  }

  // Esto si es Windows
  #ifdef _WIN32
    system(("start " + filename).c_str());
  // Esto si es Apple
  #elif __APPLE__
    system(("open " + filename).c_str());
  // Si no, entonces suponer que es Linux
  #else
    system(("xdg-open " + filename).c_str());
  #endif
}

/// @brief Método principal del programa
/// @param argc Número de argumentos
/// @param argv Arreglo con los argumentos
/// @return Número de retorno. 0: Ejecución sin problemas. 1: Error
int main(int argc, char *argv[]) {
  try {
    // Si no se incluye el nombre de la imagen, lanzar excepción
    if (argc != 2) {
      std::cerr << "Uso: " << argv[0] << " <nombre_imagen.bmp>\n";
      return 1;
    }

    // Defnir los directorios de entrada (imagenes para aplicar filtros) y
    // salida (imagenes con los filtros aplicados)
    const std::string input_dir = "entradas";
    const std::string output_dir = "salidas";

    // Crear directorio de salida (salidas/) si no existe
    std::filesystem::create_directories(output_dir);

    // Sacar el nombre de la imagen desde los argumentos
    const std::string input_file = input_dir + "/" + argv[1];
    std::cout << "Cargando archivo: " << input_file << std::endl;

    if (!std::filesystem::exists(input_file)) {
      std::cerr << "Error: Archivo de entrada no encontrado.\n";
      return 1;
    }

    // Cargar la información de la imagen BMP
    BMPImage image = load_bmp(input_file);

    std::cout << "Imagen cargada con dimensiones: " << image.width << "x"
              << image.height << "\n";

    if (image.width <= 0 || image.height <= 0) {
      std::cerr << "Error: Dimensiones inválidas.\n";
      return 1;
    }

    // Si por alguna razón al cargar la imagen el tamaño no coincidiera con el
    // esperado, entonces lanzar excepción
    if (image.data.size() !=
        static_cast<size_t>((image.width * 3 + 3) & ~3) * image.height) {
      std::cerr << "Error: Tamaño de datos de la imagen no coincide con las "
                   "dimensiones.\n";
      return 1;
    }

    // Ahora se comienzan a aplicar los filtros llamando a cada función en
    // ensamblador

    // 1. Sepia
    BMPImage sepia_image = image;
    if (sepia_image.data.data() == nullptr || sepia_image.data.size() == 0) {
      throw std::runtime_error("Datos de imagen inválidos para filtro sepia.");
    }
    std::cout << "Aplicando filtro sepia...\n";
    const std::string sepia_output = output_dir + "/salida_sepia.bmp";
    apply_sepia_filter(sepia_image.data.data(), sepia_image.data.size());
    save_bmp(sepia_output, sepia_image);
    std::cout << "Filtro sepia guardado en salida_sepia.bmp\n";
    open_image(sepia_output);

    // 2. Escala de grises
    BMPImage grayscale_image = image;
    if (grayscale_image.data.data() == nullptr ||
        grayscale_image.data.size() == 0) {
      throw std::runtime_error(
          "Datos de imagen inválidos para filtro escala de grises.");
    }
    std::cout << "Aplicando filtro escala de grises...\n";
    const std::string grayscale_output = output_dir + "/salida_grayscale.bmp";
    apply_grayscale_filter(grayscale_image.data.data(),
                           grayscale_image.data.size());
    save_bmp(grayscale_output, grayscale_image);
    std::cout << "Filtro escala de grises guardado en salida_grayscale.bmp\n";
    open_image(grayscale_output);

    // 3. Negativo
    BMPImage invert_image = image;
    if (invert_image.data.data() == nullptr || invert_image.data.size() == 0) {
      throw std::runtime_error(
          "Datos de imagen inválidos para filtro de inversión.");
    }
    std::cout << "Aplicando filtro de inversión...\n";
    const std::string invert_output = output_dir + "/salida_invert.bmp";
    apply_invert_filter(invert_image.data.data(), invert_image.data.size());
    save_bmp(invert_output, invert_image);
    std::cout << "Filtro de inversión guardado en salida_invert.bmp\n";
    open_image(invert_output);

    // 4. Binarizar
    BMPImage binarize_image = image;
    if (binarize_image.data.data() == nullptr ||
        binarize_image.data.size() == 0) {
      throw std::runtime_error(
          "Datos de imagen inválidos para filtro binarizador.");
    }
    std::cout << "Aplicando filtro binarizador...\n";
    const std::string binarize_output = output_dir + "/salida_binarize.bmp";
    apply_binarize_filter(binarize_image.data.data(),
                          binarize_image.data.size());
    save_bmp(binarize_output, binarize_image);
    std::cout << "Filtro binarizador guardado en salida_binarize.bmp\n";
    open_image(binarize_output);

  } catch (const std::exception &e) {
    std::cerr << "Error: " << e.what() << std::endl;
    return 1;
  }

  return 0;
}
