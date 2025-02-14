#!/bin/bash

#Tipos de variables: Universal -> Número, Bool o 
n1=10
n2=7
echo "El valor de n1 es $n1"

#Estructuras de control condicionales
#Operadores condicionales < (-lt) > (-gt) <= (-le) => (-ge)
#== (-eq) !=(ne)
if [[ $n1 -gt $n2 ]]; then
    echo "La sentencia es verdadera $n1 $n2"
else 
    echo "La sentencia es falsa $n1 $n2"
fi

#Todo programa regresa un valor, si es exitoso es 0
res=$?
echo "El resultado de la ejecucion es $res"
ls
if [[ $? -eq 0 ]]; then 
    echo "La sentencia se ejecuto correctamente"
else 
    echo "La sentencia fallo"
fi

#Operadores manipular archivos
#-e si es un archivo o carpeta existente
#-d si es carpeta
#-r -w -x si puede leer, escribir o ejecutar respectivamente 
#-s si el archivo esta vacio 

file="./file-demo"

if [[ -s $file ]]; then
    echo "El archivo contiene algo"
else 
    echo "El archivo esta vacio"
fi

# Operadores logicos AND (&&) or (||)
if [ -r $file ] && [ -x $file ]; then 
    echo "el archivo se puede leer y ejecutar"
else
    echo "el archivo no se puede leer ni ejecutar"
fi 


#estructuras de control case
# $ = array donde $# ($1, $2, $3, ..., $n) -h hola
case $1 in 
    Hola )
        echo "Bienvenido"
    ;;
    Adios )
        echo "bye bye"
    ;;
    *)
        echo "No entiendo lo que dices"
    ;;
    esac 


#Estructuras iterativas

# while
user=""
while [[ $user != "admin" ]]; do 
    read -p "¿cual es tu usuario?" user
done 

# for
for i in {1..5}; do 
    echo "El numero es $i"
done

for ((i=0; i<5; i++)); do
    echo "*el numero es $1"
done

invitados=(pedro juan david maria lulu ivan)
for invitado in ${invitados[@]}; do
    echo "Hola $invitado"
done

#Funciones 
suma(){
    echo "Hola desde la funcion sumar."
}

resta(){
    echo $(( $1 - $2 ))
}

suma
total=$(resta 9 4)
    echo "El total es $total"