# Ejercicio 05
# Escribir un script que reciba como parametro el path a un archivo y determine
# si existe o no y que tipo de archivo es.

#!/bin/bash

if test $# -lt 1; then # Es lo mismo que escribir if [ $# -lt 1 ]; then
    echo "Error"
elif test -d $1; then
    echo "$1 es un directorio"
elif test -f $1; then
    echo "$1 es un archivo"
else
    echo "$1 no existe"
fi
exit 0
