# Qué es una vulnerabilidad Buffer Overflow?
Un buffer overflow ocurre cuando se escribe más información de la que un buffer puede almacenar, causando que los datos excedan el espacio asignado. Esto puede sobrescribir áreas adyacentes de la memoria, incluyendo direcciones de retorno o variables importantes.

## Implicaciones

1. Ejecución de código arbitrario: un atacante puede modificar la dirección de retorno para ejecutar funciones no autorizadas (como secretFunction en el primer ejemplo).

2. Corromper datos sensibles: sobrescribir variables importantes en la pila.

3. Fallos inesperados del programa:  el programa puede fallar al acceder a memoria no válida.

## Ejemplos y análisis

### Ejemplo 1: Código con función vulnerable

Este programa tiene una función vulnerable llamada vuln, que utiliza un buffer de tamaño fijo (array[400]) para almacenar el texto ingresado por el usuario. Si se compila sin protecciones de pila, un atacante puede explotar esta vulnerabilidad para sobrescribir la dirección de retorno de la función y ejecutar código no autorizado, como la función secretFunction. El programa demuestra cómo un input malicioso puede desencadenar acciones no previstas.

1. Vulnerabilidad:

>Aunque fgets controla el tamaño máximo de entrada, la función vuln usa un buffer (array[400]) en la pila, que podría ser desbordado si se compila sin protecciones como stack-protector o NX-bit. Esto puede permitir a un atacante modificar la dirección de retorno y ejecutar la función secretFunction.

2. Implicaciones:

>Si un atacante introduce datos cuidadosamente diseñados, podría controlar la ejecución y desencadenar secretFunction.

### Ejemplo 2: Código de validación de número de serie

Este programa valida un número de serie ingresado por el usuario. Contiene una vulnerabilidad en la función validarNumeroDeSerie, ya que utiliza un buffer de tamaño fijo (numeroDeSerie[24]) sin verificar que el input no exceda este tamaño. Si el usuario ingresa más de 24 caracteres, se sobrescriben áreas de la memoria. Este desbordamiento podría explotarse para alterar datos o incluso el flujo del programa.

1. Vulnerabilidad:

>La función fscanf(stdin, "%s", numeroDeSerie) en validarNumeroDeSerie no verifica si el número de caracteres ingresados excede el tamaño del buffer numeroDeSerie[24].
>Esto permite sobrescribir la memoria adyacente si el usuario ingresa más de 24 caracteres.

2. Implicaciones:

>Un atacante puede inyectar datos para alterar variables o controlar el flujo del programa.

### Prevención de vulnerabilidades Buffer Overflow
1. Mejoras en el código:
<Usar funciones seguras como fgets con límites apropiados.
> Verificar manualmente la longitud del input antes de procesarlo.
> Implementar control de errores en cada operación que involucre memoria.

2. Uso de herramientas de análisis:
> Usar herramientas como Valgring o ASan (Address Sanitizer) para detectar posibles errores de buffer overflow.

## Contexto de ensamblador y arquitectura

En el contexto de este curso:

1. Detección temprana

>Con conocimientos de ensamblador, es posible analizar la disposición de la pila y detectar posibles áreas donde los datos excedan el espacio asignado o los límites.

2. Prevención a nivel bajo

> Usar estructuras de control de pila en ensamblador para garantizar que los datos no sobreescriban áreas críticas.
>Implementar verificaciones manuales en rutinas que manipulan buffers.

3. Monitoreo de actividad

>Monitorear registros como el puntero de pila (RSP) para detectar anomalías en tiempo de ejecución.
