### Passo a passo de como instalar o *Agente da OCI*

#### Guia de instalação do oracle-cloud-agent-installer-release no *Oracle Linux 7/8*:

**Preparativos**\
Acesse o terminal do Oracle Linux com um usuário que tenha privilégios de sudo.
Atualize o sistema para garantir que todos os pacotes estejam atualizados:
```sh
sudo yum update -y
```

**Instalação do EPEL (Extra Packages for Enterprise Linux)**

O repositório EPEL pode ser necessário para algumas dependências. Para instalar, execute:
```sh
sudo yum install -y epel-release
```

**Configurar o Repositório do Oracle**

Crie um arquivo de repositório para o Oracle Client. Utilize um editor de texto, como o nano ou vi:
```sh
sudo vi /etc/yum.repos.d/oracle-client.repo
```

Adicione o seguinte conteúdo ao arquivo:
```
[oracle-client]
name=Oracle Linux $releasever - $basearch - Oracle Client
baseurl=https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/
gpgcheck=1
gpgkey=https://yum.oracle.com/RPM-GPG-KEY-oracle
enabled=1
```

Certifique-se de ajustar a URL conforme necessário para Oracle Linux 8, caso esteja utilizando essa versão.
Salve e feche o arquivo.

**Instalação do Oracle Cloud Agent**

Instale o agente do Oracle Cloud. Primeiro, baixe o pacote do agente com o seguinte comando:
```sh
sudo yum install -y oracle-cloud-agent-installer-release
```

**Configuração do Oracle Cloud Agent**

Inicie o serviço do agente:
```sh
sudo systemctl start oracle-cloud-agent.service
```

Habilite o serviço para iniciar automaticamente no boot:
```sh
sudo systemctl enable oracle-cloud-agent.service
```

Verificação da Instalação
Verifique se o Oracle agente foi instalado corretamente:
```sh
systemctl status oracle-cloud-agent.service
```