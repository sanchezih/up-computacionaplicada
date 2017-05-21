#!/bin/bash

clear # limpio la pantalla

mils="ls -l" # se crea una nueva variable

mils # No hace nada, buscará el ejecutable mils, que no existe

$mils # Ejecutará la orden "ls -l"

echo $mils # Muestra el contenido de la variable mils, i.e., "ls -l"