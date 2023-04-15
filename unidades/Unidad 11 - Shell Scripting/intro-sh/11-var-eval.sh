#!/bin/bash

clear # limpio la pantalla

# $var: significa el valor de la variable o nada si la variable no está definida.
# ${var}: igual que el anterior excepto que las llaves contienen el nombre de la variable a ser sustituida.
# ${var-thing}: el valor de var si está definida, si no thing.
# ${var=thing}: valor de var si está definida, si no thing y el valor de var pasa a ser thing.
# ${var?message}: si definida, $var; si no, imprime el mensaje en el terminal del shell. Si el mensaje esta vacío imprime uno estándar.
# ${var+thing}: thing si $var está definida, si no nada.

echo El valor de var1 es ${var1} # No está definida, no imprimirá nada

#echo El valor de la variable es ${var1=5} # Al no estar definida, le asigna el valor 5

#echo Su nuevo valor es $var1 # Su valor es 5

#echo El valor de la variable es ${var1-5} # Al no estar definida, utiliza el valor 5

#echo El valor es $var1 # Su valor sigue siendo nulo, no se ha definido

echo El valor de la variable es ${var1? Error: No está definida...} # Al no estar definida, se muestra en pantalla el mensaje
echo El valor es $var1 # Su valor sigue siendo nulo, no se ha definido