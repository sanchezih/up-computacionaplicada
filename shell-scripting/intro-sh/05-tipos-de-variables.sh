#!/bin/bash

clear # limpio la pantalla

# Las variables se dividen en dos tipos:
#     - Variables locales: son aquellas que no son heredadas por los procesos
#       hijos del shell actual (cuando se realiza un fork).
#     - Variables de entorno: Estas variables son heredadas por los procesos
#       hijos cuando se ejecuta un fork.

mils="ls -l"

export mils # Convierte la variable mils en variable de entorno

export var=valor # Crea la variable, le asigna "valor" y la exporta a la vez

# La orden set muestra todas las variables (locales y de entorno).
# La orden env muestra sólo las variables de entorno.

# Con la orden unset se pueden restaurar o eliminar variables o funciones. Por
# ejemplo, la siguiente instrucción elimina el valor de la variable mils:
unset mils