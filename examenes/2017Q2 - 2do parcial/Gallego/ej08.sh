#############################################################################
# Primer ejercicio de Scripting del segundo parcial.
# Realizado por: Julieta Gallego
#############################################################################
# Ejercicio 08
# Escribir un script que muestre un menu y haga lo siguiente:
#     1) Mostrar el directorio actual.
#     2) Pedir un nombre de directorio y si es correcto, establecerlo como actual.
#     3) Listar los elementos del directorio actual que solo sean archivos (Sin usar el comando ls).
#     4) Pedir un nombre de directorio y crearlo. Si no se puede crear, personalizar el error.
#     5) Pedir un numero y luego mostrar los primeros 10 elementos de su tabla de multiplicar, mostrando el resultado con el formato: "i x n = resultado".
#     6) Pedir un numero y evaluar si dicho numero es igual al PID del script en ejecucion. Manejar los mensajes dependiendo si es mayor, menor o igual.
#     7) Mostrar por pantalla la cantidad de usuarios del sistema con el siguiente formato: "La cantidad de usuarios del sistema es XXX". (Todos lo que figuran en /etc/passwd).
#     8) Mostrar por pantalla el primer y ultimo parametros pasados al script con el formato: "El primer parametro del script es: xxx. EL ultimo parametro del script es: xxx" Si la cantidad de parametros es <2, indicar que no es posible ejecutar esta opcion.
#     9) Salir saludando al usuario que ejecuto el programa.  
# Si se presiona otra tecla, mostrar "Opcion incorrecta".

#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar el directorio actual"
    echo "2) Cambiar a directorio"
    echo "3) Listar los elementos del directorio actual (solo archivos)"
    echo "4) Crear un directorio"
    echo "5) Ver tabla de multiplicar de un numero"
    echo "6) Ingresar un numero y ver si adivina el PID"
    echo "7) Mostrar usuarios del sistema"
    echo "8) Mostrar primer y ultimo parametro pasado al script"
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

        5) read -p "Ingrese un numero por favor: " NUM_MULTI
           i=1
           RESULTADO=0
           while [ $i -le 10 ] 
           do  
               RESULTADO=$((NUM_MULTI*i))
               echo "$NUM_MULTI x $i = " $RESULTADO 
               i=$((i+1))
           done;;

        6) read -p "Por favor ingrese un numero: " NUM_PID
           if [ $NUM_PID = $$ ]; then
              echo "Felicitaciones! El numero ingresado coincide con el PID"
           elif [ $NUM_PID -gt $$ ]; then
              echo "El numero ingresado es mayor al PID del script"
           else
              echo "El numero ingresado es menor al PID del script"
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
              echo "El ultimo parametro del script es: $1"
           fi;;

        9)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
