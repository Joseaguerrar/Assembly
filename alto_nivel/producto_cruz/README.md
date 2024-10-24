    # Producto cruz

    ## Instrucciones

    1. Crear una carpeta en la carpeta home de tu usuario con el nombre producto_cruz.

    ## Descripción

    En este ejercicio se va a implementar una función que recibe dos números y calcula el producto cruz de ellos, la idea
    es que se practique el empaquetado con registros de 128 o 256  bits. entonces se van a pasar varios vectores a la función al mismo tiempo.

    ### Ejecutar
    Para ejecutar el programa se debe ejecutar el siguiente comando desde la carpeta del programa:

    ```bash
    make packed
    ./code_generated/productoCruzPacked
    ```

    ## Entrada

    El programa recibe un archivo con el nombre vectors.txt que tiene la siguiente estructura:
    
    El primer archivo tiene la siguiente estructura:
    ```
    a1 a2 a3 b1 b2 b3
    c1 c2 c3 d1 d2 d3
    ...
    ```