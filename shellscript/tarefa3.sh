#!/usr/bin/env bash

# tarefa3.sh -  praticar as boas práticas de shell script

# variaveis
comeca=0 ate=100

# teste
[ $comeca -ge $ate ] && exit 1

# execucao
for i in $(seq $comeca $ate);do 
	for j in $(seq $i $ate);do 
		printf "*";
	done;
	printf "\n";
done
