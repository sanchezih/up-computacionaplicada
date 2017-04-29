# Ejercicio 04
# Escribir un script que reciba 2 parametros: una cadena de caracteres y el path
# a un archivo de texto plano. Se debera buscar dicha cadena dentro del archivo
# e imprimir por consola "Palabra encontrada" en caso de encontrarla o "Palabra
# no encontrada" en caso contrario. Controlar que sea correcta la cantidad de
# parametros.

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error en la cantidad de parametros"
elif [ ! -f $2 ]; then
    echo "El 2do parametro no es un archivo valido"
else
    PALABRA_BUSCAR=$1
    ARCHIVO_BUSCAR=$2

    grep -n -e ${PALABRA_BUSCAR} ${ARCHIVO_BUSCAR}
    # -n: muestra el numero de linea
    # -e: se usa un -e por cada patron a buscar

    if [ $? -eq 0 ]; then
        echo "Palabra encontrada"
    else
        echo "Palabra no encontrada"
    fi
fi
exit 0
