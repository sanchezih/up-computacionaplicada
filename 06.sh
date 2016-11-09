# Ejercicio 06
# Escribir un script que lea 2 numeros enteros desde el teclado y determine si
# son iguales, o cual es mayor que el otro.

#!/bin/bash
echo "Ingrese el primer numero: "
read VAR1
echo "Ingrese el segundo numero: "
read VAR2

if [ $VAR1 -eq $VAR1 ] 2>/dev/null && [ $VAR2 -eq $VAR2 ] 2>/dev/null
then

	if [ $VAR1 -eq $VAR2 ]; then
	    echo "Son iguales"
	else
	    echo "No son iguales"
	    if [ ${VAR1} -gt ${VAR2} ]; then
	        echo "${VAR1} es mayor que ${VAR2}"
	    else
	        echo "${VAR2} es mayor que ${VAR1}"
	    fi
	fi
else
	echo "Error: Uno de los dos numeros no es un entero"
fi

exit 0