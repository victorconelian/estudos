## VSFTPD (Very Secure FTPD)

### Instalação do VSFTPD para CentOS 7.
1. Realizar o update do gerenciador de pacotes:

```sh
yum update
```
2. Instalar o pacote do vsftpd:
```sh
yum install vsftpd
```

3. Verificar e iniciar o serviço do vsftpd:
```sh
systemctl status vsftpd
systemctl start vsftpd
```

4. [OPCIONAL] Para habilitar que o serviço inicie automaticamente junto ao boot:
```sh
systemctl enable vsftp
```
5. Caso o firewall esteja habilitado será necessário criar uma regra e porta para o vsftpd:
```sh
firewall-cmd --zone=public --permanent --add-port=21/tcp

firewall-cmd --zone=public --permanent --add-service=ftp

# Restart
firewall-cmd --reload
```

6. Criando uma bkp do arquivo de configuração original:
```sh
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
```

7. Editar o arquivo (vi /etc/vsftpd/vsftpd.conf) com as seguintes configurações:
> anonymous_enable=NO\
> local_enable=YES\
> write_enable=YES\
> chroot_local_user=YES\
> ftpd_banner=Welcome to blah FTP service.\
> userlist_enable=YES\
> userlist_file=/etc/vsftpd/user_list\
> userlist_deny=NO

8. Reiniciar o serviço:
```sh
systemctl restart vsftpd
```

9. Criando usuário:
```sh
adduser ftpuser
passwd ftpuser
```

10. Adicionando o novo usuário a lista do vsftpd:
```sh
echo "ftpuser" >> /etc/vsftpd/user_list
```

11. Criando o diretório do usuário com permissões:
```sh
mkdir -p /home/ftpuser/upload
chmod 750 /home/ftpuser/upload
chmod 550 /home/ftpuser/ftp
```

12. Para testar o usuário localmente:
```sh
ftp localhost
```

### Fontes:

[Criando um novo usuário vsftpd e prendendo ele a um diretório específico](https://serverfault.com/questions/544850/create-new-vsftpd-user-and-lock-to-specify-home-login-directory)


[How to Install an FTP Server on CentOS 7 with VSFTPd](https://medium.com/@alestinshelmon1/how-to-install-an-ftp-server-on-centos-7-with-vsftpd-a48b1ebc808f)

--------------------------------------------------------------------------------------------------------

## Criação de usuário 
### Exemplo prático

Primeiro, um diretório de armazenamento de arquivos de configurações dos usuários ftp deve ser criado.

```sh
mkdir -m2775 /etc/vsftpd/homedir

# -m2775: Define as permissões do diretório recém-criado. O valor 2775 significa:
# 2: Define o bit de setgid (Set Group ID), que faz com que arquivos criados dentro do diretório herdem o grupo do diretório, em vez de o grupo padrão do usuário que os cria.
# 7 (rwx): O proprietário do diretório tem permissões de leitura, escrita e execução.
# 7 (rwx): O grupo do diretório também tem permissões de leitura, escrita e execução.
# 5 (r-x): Outros usuários têm permissão de leitura e execução, mas não de escrita.
```

1. Adicionando o novo usuário e setando sua senha:

```sh
adduser nexxera
```
```sh
passwd nexxera
```
2. Adicionando o novo usuário ao grupo do ftp:
```sh
usermod -aG ftpadmin nexxera
```

3. Adicionando o usuário a lista do vsftpd:

```sh
echo "nexxera" >> /etc/vsftpd/user_list
```

4. Criando arquivo de configuração do usuário:
```sh
touch /etc/vsftpd/homedir/nexxera
```

5. Configurando o arquivo do usuário:
```sh
vim /etc/vsftpd/homedir/nexxera
```
> local_root = /dados/nexxera\
> write_enable=yes

6. Criando o diretório que iremos "enjaular" nosso usuário ftp e associando ele:
```sh
mkdir /ftp/nexxera
```

```sh
usermod -d /ftp/nexxera nexxera
```

7. Deixando o usuário como proprietário da pasta:
```sh
chown -R nexxera:ftpadmin /ftp/nexxera

```

8. Para testar o acesso ftp:
```sh
ftp [ IP ]

# Será solicitado usuário e senha.

```




