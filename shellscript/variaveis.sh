#!/usr/bin/env bash

# Curso Shell Script
# Aula Variaveis
NOME="Victor Conelian"
echo $NOME

NUM_1=20
NUM_2=7

IDADE=$((NUM_1+NUM_2))
echo "Idade é $IDADE"

COMANDO="$(cat /etc/passwd | grep victor)"
echo $COMANDO

echo '-----------------------------------'

# Aula Variaveis Reservadas

echo "Parametro 1: $1"
echo "Parametro 2: $2"
echo "Todos os parametros: $*"
echo "Quantos parametros? $#"

echo "Saida do ultimo comando $?"
# 0 para ok e 1 para erro

# PID do bash atual
echo "PID $$"

# script atual
echo $0 
