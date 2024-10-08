#!/usr/bin/env bash

VAR1=2
VAR2=2

if [[ "$VAR1" == "$VAR2" ]]; then
	echo "var1 e var2 sao iguais"
else
	echo "sao diferentes"
fi

# Outra maneira de encadear acoes
[ "$VAR1" == "$VAR2" ] && echo "sao iguais"
