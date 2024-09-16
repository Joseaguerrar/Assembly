## Programa en Ensamblador para Calcular Números Primos con la Criba de Eratóstenes

### 2. Descripción del Programa

Escriba un programa en ensamblador (x86-64) que calcule todos los números primos menores o iguales que 101 usando el algoritmo de la criba de Eratóstenes. Para ello, siga las siguientes instrucciones:

1. **Sección de Datos**:
   - Reserve espacio para almacenar una matriz de 10x10 números enteros. Cada número se representa en 4 bytes.
   - Inicialice directamente todos los números requeridos por la criba (de 2 a 101 en este caso) en la matriz.
   - Defina también un vector de ceros de tamaño suficiente para almacenar los números primos resultado. Este vector debe llamarse `resultado`.
   - Cualquier otro dato (variable) que necesite lo puede definir, debe documentar su propósito.

2. **Método `_start`**:
   - En su método `_start` únicamente puede tener: llamados a métodos, asignación de parámetros de métodos (cuando aplique) y código necesario para devolverle el control al sistema operativo.
   - Debe al menos invocar el método descrito en el siguiente punto.

3. **Método para Extraer Números Primos**:
   - Escriba un método que se pueda invocar desde `_start` que extraiga los números primos de la matriz de 10x10 usando el algoritmo de la criba de Eratóstenes.
   - Puede implementar varios métodos para resolver este problema. Sin embargo, desde `_start` solo podrá invocarse uno (el que incluya todos los demás métodos).
