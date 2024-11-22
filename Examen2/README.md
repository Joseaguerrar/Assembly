# Examen 2
Esta carpeta contiene la parte programada del examen 2.
## Enunciado
Para un sistema muy particular de IoT, se necesita almacenar de la forma más eficiente posible (es decir, que use la menor cantidad de bits posible) datos del momento en el que se tomaron las mediciones de un sensor(timestamp). No importa la fecha completa, ni la hora detalladamente, solo se requieren los siguientes datos:

* Si el dato se tomó antes del mediodía o después del mediodía.
* El día de la semana(considerando de Lunes a Domingo).
* El mes del año.

Haga lo siguiente: 
1. Proponga una forma de almacenar esos datos en la menor cantidad posible de bits (considerando que debe manipular de alguna forma los bits de un tipo de datos ya usado en C/C++). Agregue al menos 3 ejemplos de como se vería unm escenario específico (ej. Lunes de Enero a las 9 am, se vería así...). Ponga su propuesta y los ejemplos en el Archivo README que debe entregar.

2. Escriba un programa usando C/C++ y lenguaje ensamblador que solicite al usuario un número, letra o letras, o lo que sea que usted considere apropiado, que representa un timestamp (según su propuesta), para que luego imprima a qué día de la semana, momento del día y mes corresponde el dato que se leyó.

## Notas Adicionales
También debe ser posible indicar a su programa de alguna forma el momento del día, el día de la semana y mes del año para que genere un timestamp.

La generación del tiemstamp o la interpretación del mismo deben imprimir el resultado en pantalla. La generación y la interpretación deben realizarse en lenguaje ensamblador. La entrada y salida de datos se puede hacer en alto nivel.

Su código debe ser original, debe estar ordenado (indentado), variables, etiquetas, etc, deben tener nombres significativos, y debe documentar internamente.