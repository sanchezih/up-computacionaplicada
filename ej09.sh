# Ejercicio 09
# Escribir un script que reciba como parametro una cadena de caracteres y
# determine si es capicua o no.

#!/bin/bash
clear
LEN=0
I=1
read -p "Ingrese una cadena de caracteres: " STR
LEN=`echo $STR | wc -m`
LEN=`expr $LEN - 1`
if [ ! $LEN -eq 0 ]; then
    MITAD=`expr $LEN / 2`
    while [ $I -le $MITAD ]; do
        C1=`echo $STR|cut -c$I`
        C2=`echo $STR|cut -c$LEN`
        if [ $C1 != $C2 ]; then
            echo "La cadena no es capicua"
            exit
        fi
        I=`expr $I + 1`
        LEN=`expr $LEN - 1`
    done
    echo "La cadena es capicua"
else
    echo "ERROR: La cadena ingresada es incorrecta"
fi
