#!/bin/bash	
#Segundo Parcial
function mostrar_menu(){
	clear
	echo "--------- MENU -------------"
	echo "1) Mostrar el directorio actual"
	echo "2) Cambiar a directorio"
	echo "3) Listar los elementos del directorio actual (solo archivos)"
	echo "4) Crear directorio"
	echo "5) Tabla de multiplicar"
	echo "6) PID proceso actual "
	echo "7) Cantidad de usuario sistema"
	echo "8) Primer y ultimo parametro Script"
	echo "9) Salir"
	echo "-----------------"
}

function salir_saludando(){
	NOMBRE=$1 
	echo "Chau $NOMBRE"
	sleep 2
}

# ------------------ PROGRAMA PRINCIPAL -----------#
OPCION=0
mostrar_menu
while true; do
	read -p "Ingrese una opcion: " OPCION 
	case $OPCION in 
	  1) echo "Direccion actual:" `pwd`;;
	  2) echo "Ingrese el nombre del dir:"
	     read NOMBRE_DIR
	     if [ -d "$NOMBRE_DIR" ]; then 
                cd "$NOMBRE_DIR"
	     else
	        echo "ERROR: El directorio no existe"
             fi;;
	  3) for NOMBRE_ARCH in * 
	     do 
              if test -f "$NOMBRE_ARCH"; then 
                 echo "$NOMBRE_ARCH"
	      fi
	     done;;
	  4) read -p "Ingrese el nombre del directorio a crear: " NOMBRE_DIRE
	     mkdir $NOMBRE_DIRE 2>/dev/null 
	     if [ $? -ne 0 ]; then 
	        echo "Error: No se puede crear el directorio $NOMBRE_DIR"
 	     else
   	        echo "El directorio $NOMBRE_DIR fue creado con exito"
	     fi;;
	  5) read -p "Ingrese un numero: " NUMERO
	     for  i in  0 1 2 3 4 5 6 7 8 9
	     do 
		echo "$i x $NUMERO= `expr $NUMERO \* $i` "
	     done;;
	  6) read -p "Ingrese un numero: " NUMERO_ID
	     PID=$$
	     echo "$PID"   	
	     if [ $PID -eq $NUMERO_ID ]; then 
	        echo "El numero ingresado coninside con PID "
	     else
		if [ $PID -lt $NUMERO_ID ]; then
		   echo "El numero ingresado es mayor que PID"
		else 
		   echo "El numero ingresado es menor que PID"
	   	fi
	     fi;;
	  7) echo "La cantidad de usuario del sistema es: `ls -1 /home | wc -l` ";;
	  8) echo "El Primer y ultimo parametro fueron: $2 y 8";;
		
	  9) salir_saludando `whoami`
	   break;;

          *) echo "Opcion incorrecta";;
	esac 
done
exit 0
