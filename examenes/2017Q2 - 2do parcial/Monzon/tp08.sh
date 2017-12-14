#!/bin/bash


mostrar_menu () {

clear

echo "-----------------------Menu---------------------------------"
echo "1) mostrar el directorio actual"
echo "2) Cambiar directorio"
echo "3) Listar los elementos del directorio actual (solo archivos)"
echo "4) Crear un directorio"
echo "5) Mostrar tabla de multiplicar de un numero"
echo "6) Evaluar si un numero es igual al pid"
echo "7) Mostrar la cantidad de usuarios en el sistema"
echo "8) Mostrar por pantalla dos parametros"
echo "9) Salir"
echo "-------------------------------------------------------------"

}

Nombre=$(whoami)

PrimerParametro=$1



Salir_Saludando () {

echo "Chau $Nombre" 
sleep 2

}

OPCION=0
mostrar_menu

while true
do
read -p "Ingrese una opcion:" OPCION
case $OPCION in
     1) echo "Directorio actual:"
        directorio=$(pwd)
        echo $directorio;;

     2) echo "Ingrese el nombre del dir:"
        read NOMBRE_DIR   
        if [ -d "$NOMBRE_DIR" ]
        then
        cd "$NOMBRE_DIR"
        else
             echo "ERROR: El directorio no existe"
        fi;; 
     3) echo "Lista de archivos del directorio actual"  
	find $pwd -type f;;
    
     4) read -p "ingrese el nombre del directorio a crear:" Nombre_dir
	mkdir $Nombre_dir 2>/dev/null 
	
	if [ $? -ne 0 ]
	then
	echo "Error: no se ha podido crear el directorio $Nombre_dir"
        else
	echo "El directorio se ha creado con exto!"
	fi;;

     5) read -p "Ingrese un numero: " NUM
	echo "Numero elegido: $NUM"
	CONT=1
        
	while [ $CONT -le 10 ]
	do

	echo "$CONT X $NUM= $((CONT*NUM))"
	CONT=$((CONT+1))
	
	done;;
      
     6) read -p "Ingrese un numero: " NUM
	PID=$$
	echo "Numero ingresado: $NUM" 
	echo "PID del proceso: $PID"
	if [ $PID -eq $NUM ]
	then
	echo "Son Iguales"
	elif [ $PID -lt $NUM ]
	then
	echo "El numero ingresado es mayor al PID del proceso"
	elif [ $PID -gt $NUM ]
	then
	echo "El numero ingresado es menor al PID del proceso"
	fi
	;;
     
     7) Users=$(cat /etc/passwd | wc -l)
	echo "Cantidad de usuarios: $Users";;
	
     8) echo "$PrimerParametro y ultimo ${$#}";;

   
     9) Salir_Saludando
        break;;
     *) echo "opcion incorrecta"  ;;

esac
done

exit 0
