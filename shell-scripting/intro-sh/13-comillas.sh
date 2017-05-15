#!/bin/bash

clear # limpio la pantalla

# Encerrar caracteres entre comillas simples preserva el valor literal de cada carácter entre las comillas.

echo 'caracteres especiales: $, &, ‘, ", (, ), ;, |, <, >, \...'

# Encerrar caracteres entre comillas dobles preserva el valor literal de todos los caracteres, con la excepción de $,` , y n. 
# Los caracteres $ y ` mantienen su significado especial dentro de comillas dobles. La barra invertida mantiene su significado especial solamente cuando está seguida por uno de los siguientes caracteres: $, `, ", o <nueva-línea>. Una comilla doble puede ser entrecomillada entre otras comillas dobles precediéndola de una barra invertida
echo "caracteres especiales: \$, &, \‘, \", (, ), ;, |, <, >, \\..."

