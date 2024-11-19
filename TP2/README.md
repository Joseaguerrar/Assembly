# README - Filtros para Imágenes BMP
Este proyecto aplica un filtros a imágenes BMP utilizando una combinación de código en C++ y ensamblador (ASM). Es una herramienta básica que demuestra el manejo de archivos de imagen BMP y cómo realizar operaciones de procesamiento de imágenes de manera eficiente.

Requisitos
Compilador C++: g++ (compatible con C++17 o superior).
Ensamblador: nasm.
Sistema Operativo: Linux o cualquier sistema compatible con herramientas GNU.
Estructura del proyecto:
Carpeta entradas: Contiene la imagen BMP que se procesará.
Carpeta salidas: Se guarda la imagen BMP con el filtro sepia aplicado.
Estructura del Proyecto
graphql
Copiar código
.
├── entradas/           # Carpeta de entrada para las imágenes BMP.
│   └── entrada.bmp     # Imagen BMP original (proporcionada por el usuario).
├── salidas/            # Carpeta de salida para las imágenes procesadas.
├── build/              # Carpeta para archivos objeto (.o).
├── bin/                # Carpeta para el ejecutable final.
├── main.cpp            # Código principal en C++.
├── sepia_filter.asm    # Código ensamblador para aplicar el filtro sepia.
├── Makefile            # Script para compilar y ejecutar el proyecto.
└── README.md           # Este archivo.
## Compilación y Ejecución
1. Preparación
Asegúrese de tener un archivo BMP válido llamado entrada.bmp en la carpeta entradas/.
2. Compilación
Para compilar el proyecto, utiliza el siguiente comando en el terminal:

    bash
    make clean
    make sepia
Esto genera:

El ejecutable filtros en la carpeta bin/.
Archivos objeto (.o) en la carpeta build/.
3. Ejecución
Para aplicar el filtro sepia a la imagen:

    bash

    ./bin/filtros
El programa:

Lee el archivo entradas/entrada.bmp.
Aplica el filtro sepia utilizando la función en ensamblador.
Guarda el resultado como salidas/salida_sepia.bmp.
Ejemplo de Uso
Entrada
Coloque su archivo BMP original en la carpeta entradas/ con el nombre entrada.bmp. Asegúrese de que el archivo sea un BMP válido.

Salida
Después de ejecutar el programa, encontrará la imagen procesada con el filtro sepia en la carpeta salidas/ con el nombre salida_sepia.bmp.

### Notas Importantes
Formato de Imagen: Este programa solo funciona con imágenes en formato BMP. Si utilizas otros formatos (como PNG o JPG), deberás convertirlos previamente.
Límites: La implementación asume imágenes BMP con un encabezado de 54 bytes y 24 bits de color. Otros formatos BMP podrían no ser compatibles.
Error Handling: El programa genera mensajes de error claros si:
No encuentra el archivo de entrada.
No puede escribir el archivo de salida.

# Referencias
Las imágenes de prueba fueron obtenidas de los siguientes enlaces:
* entrada1.bmp: https://filesampleshub.com/format/image/bmp
* entrada2.bmp: https://samples-files.com/sample-bmp-file/
* entrada3.bmp: https://filesamples.com/formats/bmp
*