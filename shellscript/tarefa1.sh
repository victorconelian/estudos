#!/usr/bin/env bash

# Validar se o primeiro parâmetro enviado é maior que 10

echo "Primeiro parâmetro: $1"

if [ "$1" -gt 10 ]; then
	echo "O primeiro parâmetro é maior que 10. PID $$ e Script atual $0."
else
	echo "O primeiro parâmetro não é maior que 10."
# Se for maior, mostre uma mensagem na tela com o nome do script e seu respectivo PID de execução
	
fi
