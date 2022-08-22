#!/bin/bash

clear # limpio la pantalla

echo -e '$? contiene el valor de salida de la ultima orden ejecutada.\nEs util para saber si una orden ha finalizado con exito o ha tenido problemas.\nUn '0' indica que no ha habido errores, otro valor indica que sí ha habido errores.\n'
echo 'Ejemplo: El ultimo comando ejecutado finalizo con '$?
echo --------------------------------------------------------------------------------

echo -e '$! contiene el PID de la última orden ejecutada en segundo plano.\n'
echo 'Ejemplo: El PID del ultimo comando ejecutado en segundo plano es '$!
echo --------------------------------------------------------------------------------

echo -e '$$ contiene el PID de este shell, útil para incluirlo en nombres de ficheros para hacerlos únicos.\n'
echo 'Ejemplo: El PID de este shell es '$$
echo --------------------------------------------------------------------------------

echo -e '$- las opciones actuales suministradas para esta invocación del shell.\n'
echo 'Ejemplo: Este shell fue invocado con '$-
echo --------------------------------------------------------------------------------

echo -e '$* contiene todos los argumentos del shell comenzando por el $1.\nCuando la expansión ocurre entre comillas dobles, se expande a una sola palabra con el valor de cada parámetro separado por el primer carácter de la variable especial IFS. Esto es, $* es equivalente a $1c$2c. . . ., donde c es el primer carácter del valor de la variable IFS. Si IFS no está definida, los parámetros se separan por espacios. Si IFS es la cadena vacía, los parámetros se juntan sin ningún separador.\n'
echo 'Ejemplo: Este script fue ejecutado con los siguientes parametros: '$*
echo --------------------------------------------------------------------------------

echo -e '$@ tiene el mismo contenido que $*, excepto cuando va entrecomillado. Cuando la expansión ocurre dentro de comillas dobles, cada parámetro se expande a una palabra separada. Esto es, $@ es equivalente a $1 $2\n'
echo 'Ejemplo: Este script fue ejecutado con los siguientes parametros: '$@