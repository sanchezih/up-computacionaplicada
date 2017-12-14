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
    echo "6) dame un numero para multiplicar"
    echo "7) numero de proceso"
    echo "8) cantidad de usuarios"
    echo "9) mostrar primer y ultimo parametro del script"
    echo "5) Salir"
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

        5)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;


        6)  
            echo "ingrese el numero a multiplicar: "
            read numero
            var=1
            res=1
            while [ $var -lt 11 ]
            do
                ((res=var*numero))
                echo "$var x $numero = $res"

                ((var = var + 1))
            done;;            



        7)  
            echo "ingrese el numero a comparar: "
            read numero_p
            proc=$$

            echo "El proceso es: $proc"

            if [ $numero_p -eq $proc ]; then
                echo "es igual"
                elif [ $numero_p -gt $proc ]; then
                    echo "el numero es mayor que el proceso"
                else 
                    echo "el numero es menor que el proceso"

            fi 

            break;;

        8) 
            
            echo "la cantidad de usuarios del sistema es: "

            cat /etc/passwd /etc/group | wc -l

            ;;
            

        9) #primer y ultimo parametro del script
            variable=$last
            echo "el primer parametro es $1"
            echo "el ultimo parametro es ${@: -1}"
            ;;
        
        *)  echo "Opcion incorrecta";;
    esac
done
exit 0