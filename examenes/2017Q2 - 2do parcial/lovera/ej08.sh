#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Ingrese nro y multipliquelo del 1 al 10"
    echo "6) Ingrese un nro y verificar si es igual menor o mayor al PID del Scrip"
    echo "7) Mostrar la cantidad de usuarios de /etc/passwd"
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

        5)  echo "Ingrese un Nro.:"
            read numero
            contador=0
            maximo=0
            while [ $contador -lt $maximo ]
            do
                let contador+=1
                let resultado=$numero*$contador
                echo "Resultado de $contador X $numero + $resultado"
            done;;
        6)  echo "Ingrese un Nro.:"
            read numero
            if [ $numero -eq $$ ]; then
                echo "Es igual $numero a $$"
            elif [ $numero -gt $$ ]; then
                echo "El $numero es mayor a $$"
            else
                echo "El $numero es menor a $$"
            fi;;
        7)  cantidad=$(cat /etc/passwd | wc -l)
            echo "La cantidad de usuarios del sistema es $cantidad";;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0