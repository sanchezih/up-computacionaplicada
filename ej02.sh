# Ejercicio 02
# Escribir un script que muestre por consola la fecha del sistema cada 2
# segundos, 10 veces.

#!/bin/bash

CONT=0

while [ $CONT -lt 10 ]; do
    date
    sleep 2
    ((CONT=CONT+1))
done
exit 0
