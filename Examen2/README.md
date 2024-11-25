# Examen 2
Esta carpeta contiene la parte programada del examen 2.
## Enunciado
Para un sistema muy particular de IoT, se necesita almacenar de la forma más eficiente posible (es decir, que use la menor cantidad de bits posible) datos del momento en el que se tomaron las mediciones de un sensor(timestamp). No importa la fecha completa, ni la hora detalladamente, solo se requieren los siguientes datos:

* Si el dato se tomó antes del mediodía o después del mediodía.
* El día de la semana(considerando de Lunes a Domingo).
* El mes del año.

Haga lo siguiente: 
1. Proponga una forma de almacenar esos datos en la menor cantidad posible de bits (considerando que debe manipular de alguna forma los bits de un tipo de datos ya usado en C/C++). Agregue al menos 3 ejemplos de como se vería un escenario específico (ej. Lunes de Enero a las 9 am, se vería así...). Ponga su propuesta y los ejemplos en el Archivo README que debe entregar.

2. Escriba un programa usando C/C++ y lenguaje ensamblador que solicite al usuario un número, letra o letras, o lo que sea que usted considere apropiado, que representa un timestamp (según su propuesta), para que luego imprima a qué día de la semana, momento del día y mes corresponde el dato que se leyó.

## Notas Adicionales
También debe ser posible indicar a su programa de alguna forma el momento del día, el día de la semana y mes del año para que genere un timestamp.

La generación del tiemstamp o la interpretación del mismo deben imprimir el resultado en pantalla. La generación y la interpretación deben realizarse en lenguaje ensamblador. La entrada y salida de datos se puede hacer en alto nivel.

Su código debe ser original, debe estar ordenado (indentado), variables, etiquetas, etc, deben tener nombres significativos, y debe documentar internamente.

## Propuesta de Almacenamiento Eficiente del Timestamp

Dado que necesitamos almacenar los datos en la menor cantidad de bits posible, los dividimos de la siguiente manera:

1. Momento del día (AM/PM):

Solo hay dos valores posibles: antes del mediodía (AM) o después del mediodía (PM).
Necesitamos 1 bit para representar esta información.
0 = AM
1 = PM

2. Día de la semana:

Hay 7 días (Lunes a Domingo).
Para representar 7 valores, necesitamos 3 bits.
Ejemplo: 000 = Lunes, 001 = Martes, ..., 110 = Domingo.

3. Mes del año:

Hay 12 meses (Enero a Diciembre).
Para representar 12 valores, necesitamos 4 bits.
Ejemplo: 0001 = Enero, 0010 = Febrero, ..., 1100 = Diciembre.
### Total de bits necesarios:
1 (Momento del día) + 3 (Día de la semana) + 4 (Mes) = 8 bits.

Esto significa que podemos representar un timestamp completo en un solo byte (8 bits).

## Ejeplos de Timestamp
Supongamos los siguientes escenarios:

1. Lunes en Enero antes del mediodía:

AM = 0
Lunes = 000
Enero = 0001
Timestamp en binario: 00000001
Representación hexadecimal: 0x01

2. Viernes en Junio después del mediodía:

PM = 1
Viernes = 100
Junio = 0110
Timestamp en binario: 11000110
Representación hexadecimal: 0xC6

3. Domingo en Diciembre antes del mediodía:

AM = 0
Domingo = 110
Diciembre = 1100
Timestamp en binario: 01101100
Representación hexadecimal: 0x6C

## Explicación del Flujo del Programa
### Generación del Timestamp
#### Entrada de datos:
El programa solicita al usuario tres valores:
Momento del día (AM/PM).
Día de la semana (Lunes a Domingo).
Mes del año (Enero a Diciembre).
#### Validación:
Se asegura que las entradas sean válidas:
Momento del día: 0 o 1.
Día de la semana: 0 a 6.
Mes del año: 1 a 12.
#### Construcción del Timestamp:
La entrada del usuario se convierte a un único byte utilizando operaciones bit a bit.
Se almacena el momento del día en el bit más significativo (MSB).
Los bits restantes contienen el día de la semana y el mes.
#### Resultado:
El timestamp generado se imprime en formato hexadecimal.
### Decodificación del Timestamp
#### Entrada del timestamp:
El programa solicita al usuario un número hexadecimal representando el timestamp.
#### Decodificación:
Mediante operaciones bit a bit, el programa separa los valores:
Momento del día (bit más significativo).
Día de la semana (3 bits intermedios).
Mes (4 bits menos significativos).
#### Resultado:
Imprime en lenguaje natural:
Momento del día: "antes del mediodía" o "después del mediodía".
Día de la semana: "Lunes", "Martes", ..., "Domingo".
Mes: "Enero", "Febrero", ..., "Diciembre".
## Manual de Uso
Este manual describe cómo compilar, ejecutar y probar el programa utilizando el Makefile proporcionado.

### Requisitos Previos
1. Compiladores y herramientas necesarias:
g++: Para compilar el código en C++.
nasm: Para ensamblar el código en lenguaje ensamblador.
Un sistema operativo compatible con las herramientas mencionadas (Linux recomendado).
2. Estructura del proyecto:
Archivos del proyecto:
main.cpp: Archivo principal en C++ que gestiona la entrada y salida de datos.
timestamp.asm: Archivo ensamblador que implementa la generación y decodificación del timestamp.
Makefile: Archivo de automatización para compilar y ejecutar el programa.
### Comandos Disponibles en el Makefile
Compilar el programa:

Comando en terminal:

1. make

Este comando compila el programa, generando el ejecutable en el directorio bin/ bajo el nombre program.

Ejecutar el programa:

Comando en terminal:

2. make run

Este comando compila el programa (si no está compilado) y lo ejecuta directamente. Útil para pruebas rápidas.

Limpiar los archivos generados:

Comando en terminal:

3. make clean

Este comando elimina el directorio build/ (archivos objeto) y bin/ (ejecutable), dejando el proyecto en su estado inicial.