#!/usr/bin/env bash

# Aula de Laços for

for (( i=0; i<10; i++)); do
	echo $i
done

echo "-----------------------------------"
# seq

for i in $(seq 10)
do
	echo $i
done

echo "-----------------------------------"
# tamanho de um array criado

Frutas=(
	'laranja'
	'ameixa'
	'abacaxi'
	'melancia'
)

for i in ${Frutas[@]}
do
	echo $i
done

echo "-----------------------------------"
# while

contador=0
while [[ $contador -lt 10 ]]
do
	echo "$contador"
	contador=$(($contador+1))
done

echo "-----------------------------------"
contador=0
while [[ $contador -lt ${#Frutas[@]} ]]
do
	echo $contador
	contador=$(($contador+1))
done

