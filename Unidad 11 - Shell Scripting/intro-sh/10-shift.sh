#!/bin/bash

clear # limpio la pantalla

echo -e 'La orden shift mueve todos los parámetros una posición a la izquierda, esto hace que el contenido del parámetro $1 desaparezca, y sea reemplazado por el contenido de $2, $2 es reemplazado por $3, etc.\nLa variable $# contiene el número de parámetros que ha recibido el script. Como se indicó anteriormente $* o $@ contienen todos los parámetros recibidos. La variable $@ es útil cuando queremos pasar a otros programas algunos de los parámetros que nos han pasado.\nSegún todo esto, un ejemplo sencillo de guión shell que muestra el nombre del ejecutable, el número total de parámetros, todos los parámetros y los cuatro primeros parámetros es el siguiente:\n'

echo El nombre del programa es $0
echo El número total de parámetros es $#
echo Todos los parámetros recibidos son $*
echo El primer parámetro recibido es $1
shift
echo El segundo parámetro recibido es $1
shift
echo El tercer parámetro recibido es $1
echo El cuarto parámetro recibido es $2