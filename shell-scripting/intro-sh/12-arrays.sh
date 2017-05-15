#!/bin/bash

clear # limpio la pantalla

nombre_array=(val1 val2 val3) #Crea e inicializa un array
nombre_array[3]=valor4 #Asigna un valor al elemento x

echo $nombre_array # Si al referenciar a un array no se utiliza subíndice se considera que se está referenciando a su primer elemento.
echo ${nombre_array[0]} # Para acceder al elemento x
echo ${nombre_array[3]} # Para acceder al elemento x

# La diferencia entre usar * y @ es que ${nombre_array[*]} expande los elementos del array como si fueran una única palabra, mientras que ${nombre_array[@]} se expande para formar cada elemento del array una palabra distinta.
echo ${nombre_array[*]} # Para consultar todos los elementos
echo ${nombre_array[@]} # Para consultar todos los elementos


aux=`ls` # la variable aux contiene la salida de ls como una secuencia de caracteres.
#echo $aux

aux1=(`ls`) # aux1 es un array, y cada entrada está formada por los nombres de fichero devueltos por la orden ls.
echo ${aux1[2]}