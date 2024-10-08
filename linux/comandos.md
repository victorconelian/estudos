# Comandos
> Tópico para registrar comandos no bash do linux e seus exemplos.

## Comentários
### Executando comandos consecutivos
Para se executar dois comandos consecutivos basta usar o ;.

Exemplo, "clear ; date ; echo 'alguma coisa'".

### Variáveis
```sh
# Declarando a variável
VAR1 = Linux

# Acessando o conteúdo de uma variável (uso do $)
echo $VAR1 


# Acessando as variáveis de ambiente
env # o comando env só mostra as variáveis exportadas do ambiente
set # o comando set apresenta todas as variaveis, exportadas e não exportadas

# A variável $ armazena o número do processo atual
echo $$

# Exportar uma variável para os processos filhos
export VAR1

``` 
### Comandos para desligar ou reiniciar a máquina
```sh
# Desligar o equipamento no exato momento
shutdown now

# Desligar em alguns minutos
shutdown tempo_em_minutos -h

# Reiniciar em alguns minutos
shutdown tempo_em_minutos -r

# Cancelar o agendamento do shutdown
shutdown -c

# Parar o sistema operacional e manter o hardware ativo
halt

# Reiniciar imediatamente
reboot

# Desligar imediatamente
poweroff
```

### Comandos em geral
**date**  
Informa a data atual com dia/mes/ano e hora.

**find**\
Comando para realizar buscas de arquivos.
O find não realiza uma busca *retroativa*, ou seja, ele irá procurar apenas nos diretórios abaixo da hierarquia em comparação com o seu diretório atual.

```sh
# -name parâmetro para pesquisar do seu usuário em específico

find -name arquivo.sh

# listando somente arquivos (files) ou diretórios
find -type f
find -type d

# usando o find para fazer uma listagem de todos os arquivos

find .
```

**free**\
Exibe a quantidade de memória (ram e swap) livre no sistema. Exemplo,

```sh
# -b mostra o uso de memória em bytes
# -k mostra o uso de memória em kilobytes
# -m megabytes
# -h para leitura humana

free -h
```

**grep**

```sh

# Utilizando mais de um parâmetro para o grep
grep 'joao\|mauricio'.txt

# -v, --invert-match
# Pegando as linhas que não possuem "Baeldung" e enviando elas a um arquivo separado
grep -v "Baeldung" myfile.txt > tmpfile && mv tmpfile myfile.txt

```

**history**\
Comando utilizado para verificar o histórico de comandos feitos no bash
```sh
# Verificar o tamanho do comandos que o history armazena
echo $HISTSIZE

# Designadores de expansão de histórico
# Repete o último comando executado
!!

# Repete o comando de número n do histórico
!n

# Repete o comando mais recente que COMECE com a string citada
!string

# Repete o comando mais recente que CONTENHA a string
!?string


# Consultar de maneira pausada
history |more
```

**kill**\
Usado para parar um processo imediatamente. Basta inserir o número do processo. Exemplo,
```sh
kill 2472
```

**less**\
Comando que ajuda a paginar a saída de outro comando. Exemplo,

```sh
set | less
```

**ldd**\
Comando para se determinar quais bibliotecas são necessárias para um executável específico. É necessário ir até o /bin para utilizar para utilizar o ldd, pois é neste diretório que se encontram os binários dos programas.

```sh
cd /bin

ldd cat
```

```bash
linux-vdso.so.1 =>  (0x00007ffec23ab000)
libc.so.6 => /lib64/libc.so.6 (0x0000003175000000)
/lib64/ld-linux-x86-64.so.2 (0x0000003174c00000)
```

**ps**\
Comando que mostra um snap (estático) dos processos. Exemplo,
```sh
# -a mostra os processos de todos os usuários
# -A mostra todos os processos. Bom para se usar de maneira resumida.
ps -A | grep "discord"

# -f mostra a árvore de execução de comandos
# -x mostra os processos que não foram iniciados no console
# -u fornece o nome do usuário e a hora de início do processo
ps -aux

# vendo os tres processos que mais estao consumindo memoria
ps aux --sort=%mem | tail -n3
ps aux --sort=-%mem | head -n4
```

**ssh**\
Casos em que a tentativa de conexão via ssh apresenta o erro "no hostkey alg".
```sh
ssh -oHostKeyAlgorithms=ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521 usuario@IP
```

**systemctl**
```sh
# listar os servicos em execucao
systemctl list-units --type=service --state=running

# no hostkey alg
ssh -oHostKeyAlgorithms=ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521 usuario@IP

# ativar interface grafica
systemctl set-default graphical.target

# desativar a interface grafica
sudo systemctl set-default multi-user.target
```
**top ou htop**\
Mostram os processos em tempo real (dinâmico) para acompanhamento. Traz informações como processos zombies, prioridade do processo (PI), tempo ativo, etc.

```sh
# para ignorar todos os processos osciosos
top -i

# podemos usar ele para ordenar de acordo com um parâmetro
top -o %CPU
top -o %MEM
```

**uname**\
Usado para mostrar certas informações do sistema.
```sh
uname -a # usado para emitir todas as informações
uname -s # emite o nome do kernel
uname -r # emite a versão de lançamento do Kernel
```

**uptime**\
Comando que mostra a hora atual, tempo que o sistema está rodando, quantos usuários logados no momento e as médias de carga no sistema (processamento) nos últimos 1, 5 e 15 minutos.
