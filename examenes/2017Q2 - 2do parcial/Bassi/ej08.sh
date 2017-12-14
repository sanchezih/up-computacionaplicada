#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Mostrar primeros 10 multiplos de un numero"
    echo "6) Comparar numero contra PID"
    echo "7) Mostrar cantidad de usuarios del sistema"
    echo "8) Mostrar primer y ultimo parametro"
    echo "9) Salir"
    echo "-------------------------------------------------------------"
}

function salir_saludando(){
    NOMBRE=$1 # Guardo el parametro nro. 1 que recibe la function
    echo "Chau $NOMBRE"
    sleep 2
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu
while true; do
    read -p "Ingrese una opcion: " OPCION # Mensaje y read en la misma linea
    case $OPCION in
	8)  CANT=$#
	    if [ $CANT \< 2 ]; then
		echo "No es posible ejecutar esta accion"
	    else
		ULTIMO=${!CANT}
		echo "El primer parametro del script es: $1. El ultimo parametro del script es $ULTIMO"
	    fi;;

	7)  CANT=$(wc -l < /etc/passwd)
	    echo "La cantidad de usuarios del sistema es: $CANT";;

	6)  read -p "Ingrese un numero: " NUMERO
	    PID=$$
	    if [ $NUMERO == $PID ]; then
 		echo "El numero ingresado es igual al PID: N $NUMERO = P $PID"
	    elif [ $NUMERO \> $PID ]; then
		echo "El numero ingresado es mayor al PID: N $NUMERO > P $PID"
	    else
		echo "El numero ingresado es menor al PID. N $NUMERO < P $PID"
	    fi;;

	5) read -p "Ingrese un numero: " NUMERO
           for i in {1..10}
           do
               RESU=$(expr $i \* $NUMERO)
               echo "$NUMERO x $i = $RESU"
           done;;

        1)  echo "Directorio actual:" `pwd`;;

        2)  echo "Ingrese el nombre del dir:"
            read NOMBRE_DIR
            if [ -d "$NOMBRE_DIR" ]; then
                cd "$NOMBRE_DIR"
            else
                echo "ERROR: El directorio no existe"
            fi;;

        3)  for NOMBRE_ARCH in *
            do
                if test -f "$NOMBRE_ARCH"; then # Otra forma de escribir el test
                    echo "$NOMBRE_ARCH"
                fi
            done;;

        4)  read -p "Ingrese el nombre del directorio a crear: " NOMBRE_DIR
            mkdir $NOMBRE_DIR 2>/dev/null # Envio a la nada el retorno de mkdir

            if [ $? -ne 0 ]; then
                echo "Error: No se puede crear el directorio $NOMBRE_DIR"
            else
                echo "El directorio $NOMBRE_DIR fue creado con exito"
            fi;;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
