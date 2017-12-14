# Ejercicio 08
# Escribir un script que muestre un menu y haga lo siguiente:
#     1) Mostrar el directorio actual.
#     2) Pedir un nombre de directorio y si es correcto, establecerlo como actual.
#     3) Listar los elementos del directorio actual que solo sean archivos (Sin usar el comando ls).
#     4) Pedir un nombre de directorio y crearlo. Si no se puede crear, personalizar el error.
#     5) Salir (Saludando al usuario que ejecuto el programa).
# Si se presiona otra tecla, mostrar "Opcion incorrecta".

#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Primeros 10 elementos de la tabla de multiplicar de un número"
    echo "6) Evaluar un número contra el PID del script"
    echo "7) Mostrar la cantidad de usuarios"
    echo "8) Mostrar primer y último parametro"

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

        5)  read -p "Ingrese un número: " NUM
            CONTADOR=0
            while [  $CONTADOR -lt 10 ]; do
                let RESULTADO=$CONTADOR*$NUM
                echo "$CONTADOR x $NUM = $RESULTADO"
                let CONTADOR=CONTADOR+1 
            done;;

        6)  read -p "Ingrese un número para ser evaluado contra el PID del script: " NUM_PID
            if [ $NUM_PID -eq $$ ]; then
                echo "El número ingresado es igual al PID del Script: $$"
            elif [ $NUM_PID -lt $$ ]; then
                echo "El número ingresa es menor que el PID del Script: $$"
            else
                echo "El número ingresa es mayor que el PID del Script: $$"
            fi;;
        7)  echo "La cantidad de usuarios del sistema es: $(sudo cat /etc/passwd|grep :|wc -l| tr -d '[:space:]')";;

        8)  echo "El primer parámetro del script es: $1. El último parámetro del script es ${!#}";;
        
        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0