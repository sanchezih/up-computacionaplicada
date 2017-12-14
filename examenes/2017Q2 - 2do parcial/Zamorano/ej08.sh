#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Salir"
    echo "6) Mostrar tabla de multiplicar"
    echo "7) Comparar con process id"
    echo "8) Ver cantidad de usuarios"
    echo "9) Ver parametros"
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

        
        6)  echo -n "Ingrese numero: "
            read n

            CONT=1

            while [ $CONT -le 10 ]
            do
                echo "$CONT x $n = $(($CONT*$n))"
                ((CONT=CONT+1))
            done;;

        7)  echo -n "Ingrese numero para comparar con el processId ($BASHPID): "
            read n

            if [ $n -lt $BASHPID ]; then
                echo "$n es menor al process id"
            elif [ $n -gt $BASHPID ]; then
                echo "$n es mayor al process id"
            else
                echo "$n es igual al process id"
            fi;;

        8)  CANT=`cat /etc/passwd | wc -l`
            echo "La cantidad de usuarios del sistema es: $CANT"
            ;;

        9)
            if [ $# -ge 2 ]; then
                echo "El primer parametro del script es: $1. El ultimo parametro del script es: ${@: -1}"
            else
                echo "No se puede ejecutar la operacion. La cantidad de parametros ($#) es menor a 2"
            fi;;
        5)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro ;;
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
