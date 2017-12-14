#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Tablas de multiplicar"
    echo "6) Comparacion con PID"
    echo "7) Cantidad de usuarios en el sistema"
    echo "8) Primer y ultimo parametro"
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
        5)  echo "Ingrese un numero:"
            read NUMERO
			CONT=1
			while [ $CONT -le 10 ]; do
				RES=$(($CONT * $NUMERO))
            	echo "$CONT x $NUMERO =" $RES
				((CONT=CONT+1))
            done;;

        6)  echo "Ingrese un numero"
			read NUMERO
			PID=$$
			if [ $NUMERO -eq $PID ]; then
				echo "Es igual al PID"
			else
				 if [ $NUMERO -gt $PID ]; then
					echo "Es mayor al PID"
				else
					echo "Es menor al PID"
				fi
			fi
			;;

        7)  CANT_USUARIOS=`cat /etc/passwd | wc -l`
			echo "La cantidad de usuarios del sistema es: " $CANT_USUARIOS
			;;

        8)	#Cantidad de parametros echo $@ | wc -w
			CANT_PARAMS=
			DOS=2
			if [ $CANT_PARAMS -gt $DOS ]; then
				echo "El primer parametro del script es: " $1
				#echo "El ultimo parametro del script es: " 
			else
				echo "No es posible ejecutar la opcion"
			fi
			;;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
