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
    echo "5) Punto 5 Parcial II"
    echo "6) Punto 6 Parcial II"
    echo "7) Punto 7 Parcial II"
    echo "8) Punto 8 Parcial II"	
    echo "10) Salir"
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

        5)  clear
            echo "Por favor ingrese un  numero";
            read MI_NUMERO

            let CONTADOR=1
            let RESULTADO=0
	    let MI_NUMERO

	    while [ $CONTADOR -le 10 ]
	    do
		RESULTADO=$(($MI_NUMERO*$CONTADOR))
		echo "$RESULTADO"
		((CONTADOR=CONTADOR+1))
	    done
	    read -p "Presione ENTER para continuar"
	    mostrar_menu;;	

 	6) 	clear
		echo "Por favor ingrese un numero"
		read MI_NUMERO
		let MI_NUMERO
		if [ $$ -eq $MI_NUMERO ]; 
                then echo "PID tiene el mismo valor al numero ingresado"
		elif [ $$ -gt $MI_NUMERO ];
		then  echo "PID es mayor al numero ingresado"
		elif [ $$ -lt $MI_NUMERO ];
		then echo "PID es menor al numero ingresado"
		fi;
		read -p "Presione ENTER para continuar"
		mostrar_menu;;

	7)	clear
		LINEAS=$(cat /etc/passwd | wc -l)
		echo "La cantidad de usuarios del sistema es: $LINEAS"
		read -p "Presione ENTER para continuar"
		mostrar_menu;;

 	8)	
		clear
		if [  "$#" -lt 2 ];
		then echo "Numero de Parametros invalido - Deben ser 2";
		else
		echo "El primer parametro del script es: $1. El ultimo parametro del script es: $2"
		fi;
		read -p  "Presione ENTER para continuar"
		mostrar_menu ;;

        10)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
