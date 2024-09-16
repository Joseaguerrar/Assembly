## Programa en Ensamblador para Calcular el Producto Punto de Dos Vectores

### Descripción del Programa

1. **Cálculo del Producto Punto**:
   - Considere el cálculo del producto punto de dos vectores en el espacio tridimensional, A y B, representados como:
   - A = (a₁, a₂, a₃) y B = (b₁, b₂, b₃).
   - El programa en ensamblador (x86-64) calculará el producto punto (producto escalar) de los vectores A y B utilizando la fórmula correspondiente.
   - El resultado debe quedar en un lugar de memoria apuntado por una etiqueta llamada `respuesta`.

2. **Fórmula para el Producto Punto**:
   - El producto punto de dos vectores A y B en el espacio tridimensional se calcula como:
   - A · B = a₁ * b₁ + a₂ * b₂ + a₃ * b₃.

### Consideraciones Importantes:

- Debe tener las secciones `.data` y `.text`.
- La sección `.text` debe incluir el código para devolver el control al sistema operativo.
- Suponga que los valores aᵢ y bᵢ están en el rango de -15000 a +15000. Por tanto, use tipo de datos que no “desperdicien” bytes.
- Se calificará el uso apropiado de registros, modos de direccionamiento, etc. (ejemplo, no puede usar los registros asignados a la pila – rbp, rsp).
- Favor presentar código ordenado e indentado apropiadamente.
