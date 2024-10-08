## Gerenciamento de Usuários no Oracle

Este arquivo contém comandos SQL para verificar, criar e conceder privilégios a um usuário no banco de dados Oracle.

Abaixo estão os passos necessários.

### Verificar se o usuário já existe

Este comando consulta a tabela `dba_users` para verificar se o usuário já existe no banco de dados. O nome do usuário é filtrado com o `LIKE`, que neste caso busca qualquer usuário que tenha "VCONELIAN" no nome.

```sql
-- Verificar se o usuário já existe
SELECT
  username,
  account_status,
  expiry_date
FROM
  dba_users
WHERE
  username LIKE '%VCONELIAN%';

-- Criar usuário
CREATE USER VCONELIAN IDENTIFIED BY 123456;

-- Conceder privilégios de conexão
GRANT CONNECT TO VCONELIAN;
```

### Gerar comandos de concessão de SELECT para objetos do esquema SCHEMA

Depois que o usuário pode se conectar ao banco, pode ser necessário conceder privilégios de leitura (SELECT) em determinados objetos. O comando a seguir gera dinamicamente as instruções SQL necessárias para conceder privilégios de SELECT a todos os objetos do esquema SCHEMA.

```sql
-- Gerar comandos de concessão de SELECT
-- Este comando gera automaticamente instruções GRANT SELECT para todos os objetos pertencentes ao esquema SCHEMA, facilitando o processo de concessão de privilégios em massa.
SELECT
  'GRANT SELECT ON '
  || owner
  || '.'
  || object_name
  || ' TO VCONELIAN;'
FROM
  dba_objects
WHERE
  owner IN ('SCHEMA');

-- Comando para ver os objetos pertencentes ao esquema SCHEMA
select owner, object_name, object_type
FROM  dba_objects
WHERE
  owner IN ('SCHEMA');
