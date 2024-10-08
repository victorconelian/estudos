## AWK
> A linguagem de programação AWK permite a manipulação de textos a partir de uma sequência de padrões. É uma linguagem interpretada (não há necessidade de compilação).
O nome AWK vem dos sobrenomes dos três criadores da linguagem: Alfred V. Aho, Peter J. Weinberger e Brian W. Kernighan.

---------------------------------------------------------------------
### Exemplos 
```sh
# ! usado para negar a condição
# buscamos com isso todas as linhas que não dá match com o parâmetro

awk '!/Baeldung/' myfile.txt > tmpfile && mv tmpfile myfile.txt
```

