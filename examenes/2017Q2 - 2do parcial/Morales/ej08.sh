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
    echo "5) Ingrese un número para multiplicar:"
    echo "6) Ingrese un número para comparar"
    echo "7) Cantidad de usuarios en el sistema"
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

        5)  read -p "Ingrese número: " num
		 i=1
		 while [ $i -le 10 ]
            do
		 	echo "$i x $num: " $((i*num))
			i=$((i+1))
            done;;

        6)  read -p "Ingrese número: " num
		 if [ $num -eq $$ ]; then
		 	echo "Son iguales"
		 elif [ $num -gt $$ ]; then
			echo "El valor es mayor"
		 else
			echo "El PID es mayor"
            fi;;

        7) echo "La cantidad de usuarios del sistema es: "
           cat /etc/passwd | sort | cut -f1,4 -d: | wc -l
           ;;

        8) if [ $# -lt 2 ]; then
              echo "Deben ingresarse al menos dos parametros para ver esta opcion"
           else
              echo "El primer parametro del script es: $1"
              for i in `seq 2 1 $#`
              do
                  shift
              done 
              echo "El ultimo parametro del script es: " $1
           fi
		;;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
 