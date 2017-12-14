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
    echo "5) Mostrar tabla"
    echo "6) Es el PID?"
    echo "7) Ver cantidad de usuarios"
    echo "8) Ver primer y ultimo parametro"
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

        5)  echo "Ingrese el numero"
            read numero
            for i in {1..10}
            do
                resultado=`expr $numero \\* $i`
                echo "$numero x $i = $resultado"
            done
            break;;

        6)  echo "Ingrese el numero"
            read numero # 4590
            if [ "$$" -eq "$numero" ]
            then
                echo "Ese es el PID"
            elif [ "$$" -lt "$numero" ]
            then
                echo "Es mas grande que el PID ($$)"
            else
                echo "Es mas chico que el PID ($$)"
            fi
            break;;

        7)
            file=/etc/passwd
            cant=$(cat $file | wc -l)
            echo "La cantidad de usuarios del sistema es: $cant"
            break;;

        8)
            if [ "$#" -lt 2 ]
            then
                echo "No se puede ejecutar esta accion (debe haber al menos 2 parametros)"
            else
                primer=$1
                ultimo="${@: -1}"
                echo "El primer parametro del script es: $primer. El ultimo parametro del script es: $ultimo"
            fi
            break;;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
