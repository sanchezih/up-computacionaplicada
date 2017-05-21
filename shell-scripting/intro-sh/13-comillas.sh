#!/bin/bash

# Defino una variable de ejemplo
x=100

echo TRES TIPOS DE COMILLAS

################################################################################
echo 1. Comillas simples \' interpretan el string dentro de las comillas como si fuese literales
echo 'Imprime los caracteres especiales en su forma literal, es decir, sin interpretarlos: $ODLPWD, `pwd`, \`\`'

# Ejemplo
echo '$x'
echo 'Usando comillas simples no puedo ver el valor de la variable $x'

# Creando otra variable
y='500$x' 
echo 'Muestro el contenido de $y:' $y

################################################################################
echo 2. Comillas dobles \" interpretan los caracteres $, \ y ' ' que estan en la cadena o string

echo "Probando el uso de comillas doble, se debe imprimir: debe interpretar los caracteres $, \ y \`\`"
echo "1) $ Muestro valor de la variable OLDPWD: $OLDPWD."
echo "2) \ Interpretando el backslash puedo mostrar las comillas \`\`."
echo "3) Ejecutando comando con las comillas invertidas muestro el valor de comando PWD: `pwd`"

# Ejemplo
z="500 $x"
echo $z			# Mostrara.. '500100'

################################################################################
echo 3. Comillas inclinadas hacia la izquierda \` ejecutan el string entre la comillas como si fuera un comando

usuarios=`cat /etc/passwd | wc -l`
echo La cantidad de usuarios es $usuarios

echo 
echo SEPARADORES DE PARAMETROS

x='10     y 5 espacios'
echo $x         # Saldrá en pantalla '10 y 5 espacios'
echo '$x'		# Mostrara.. '$x'
echo "$x"		# Mostrara.. '10      y 5 espacios'

