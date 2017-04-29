# Ejercicio 01
# Escribir un script que muestre por consola los numeros del 1 al 5

#!/bin/bash

CONT=1

while [ $CONT -le 5 ]
do
    echo $CONT
    ((CONT=CONT+1))
    # Tambien se puede hacer con CONT=$(expr $CONT - 1)
done
exit 0
