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
	echo "5) Multiplicar un numero"
	echo "6) Evaluar un numero"
	echo "7) Cantidad de usuarios del sistema"
	echo "8) Mostrar primer y ultimo parametro pasados al script"
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
		
		5)	echo "Ingrese un numero:"
            read NUMERO
			let NUMERO
			let CONT=1
			let RESULT=0
			while [ $CONT -le 10 ]
			do
			RESULT=$(($NUMERO*$CONT))
			echo "$CONT x $NUMERO = $RESULT"
			((CONT=CONT+1))
			done;;

		6)	echo "Ingrese un numero:"
            read NUMERO
			let NUMERO
			if [ $$ -eq $NUMERO ]; then
			echo "El PID es Igual al Numero"
			elif [ $$ -lt $NUMERO ]; then
			echo "El PID es menor al Numero"
			elif [ $$ -gt $NUMERO ]; then
			echo "El PID es mayor al Numero"
			fi;;

		7)  CANTIDAD=$(cat /etc/passwd | wc -l)
			echo "La cantidad de usuarios del sistema es: $CANTIDAD";;

		8)  if [ "$#" -lt 2 ]; then
			echo "El numero de parametros no es correcto";
			else
			echo "El primer parametro ingresado fue: $1; y el ultimo parametro ingresado fue el: $2"	
			fi;;	
		
        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
