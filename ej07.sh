# Ejercicio 07
# Escribir un script que reciba 2 numeros enteros como parametro y determine si
# son iguales, o cual es mayor que el otro.

#!/bin/bash

# ---------- FUNCIONES ---------- #
function evaluar(){
    if [[ $1 =~ ^[-+]?[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
if [ $# -ne 2 ]; then
    echo "Error en la cantidad de parametros"
else
    evaluar $1
    retval1=$?

    evaluar $2
    retval2=$?

    if [ $retval1 -ne 0 ] ||  [ $retval2 -ne 0 ]; then
        echo "Error: Uno de los dos numeros no es un entero" 
    else
        if [ $1 -eq $2 ]; then
            echo "Son iguales"
        else
            echo "No son iguales"
            if [ ${1} -gt ${2} ]; then
                echo "${1} es mayor que ${2}"
            else
                echo "${2} es mayor que ${1}"
            fi
        fi
    fi
fi
exit 0
