#!/usr/bin/env bash

# Validar se o primeiro parâmetro enviado é maior que 10


# Se for maior, mostre uma mensagem na tela com o nome do script e seu respectivo PID de execução
[ $1 -gt 10 ] && echo "Nome do Script: $0 | PID de execução: $$"	
