#### Arquivo para anotar comandos úteis em casos de locks no Banco de Dados

**Saber sessões em lock**
```sql
set lines 200 
set pages 200 
col type form a6 
col sess form a10 
col OSUSER form a10 
col USERNAME form a12 
col PROGRAM form a20 
col machine form a25 
SELECT substr(DECODE(request,0,'Holder','Waiter'),1,12) type, ses.sid sid, 
l.inst_id, serial#, ses.username, ses.osuser,ses.status,ses.program, ses.sql_id, ses.machine,l.type, l.CTIME/60 time 
FROM GV$LOCK l, gv$session ses 
WHERE (id1, id2, l.type) IN (SELECT id1, id2, type FROM GV$LOCK WHERE request>0) 
and l.inst_id = ses.inst_id 
and l.sid = ses.sid 
ORDER BY 1,9 desc 
/
```

**Verificar uma sessão especifica / pegar sql id:**
```sql
set lines 200 
set pages 5000 
set pagesize 5555 
set linesize 500 
COL LOGON for a12 
COL EVENT for a40 
col MACHINE for a32 
col USERNAME for a19 
col SPID for a8 
col TIMEWAIT for a10 
col OSUSER for a18 
col STATUS for a8 
col WAIT_CLASS for a14 
col PROGRAM for a15 
col SQL_ID for a13 
col SERVICE_NAME for a18 
select to_char(logon_time,'DD/MM HH24:MI') LOGON,s.inst_id,substr(s.username,1,40) username,s.status,s.sid, 
p.spid,s.serial#,s.sql_id, case when s.SERVICE_NAME like 'oracle@drer%' then ' ' else substr(s.SERVICE_NAME,1,10) end SERVICE_NAME, 
s.PREV_SQL_ID, 
case when s.machine like 'oracle@drer%' then ' ' else substr(s.machine,1,25) end machine, 
osuser, 
--s.CLIENT_INFO,--module, -- LAST_CALL_ET, 
Ltrim(To_Char(Trunc(s.Seconds_In_Wait / 60), '0000')) || ':' || Ltrim(To_Char(Mod(s.Seconds_In_Wait, 60), '00')) TimeWait, 
substr(replace (s.event, 'message', 'msg'),1,55) event,s.WAIT_CLASS, case when s.PROGRAM like 'oracle@drer%' then ' ' else substr(s.program,1,10) end Program 
from gv$session s, gV$PROCESS P 
where 
s.paddr = p.addr and s.inst_id=p.inst_id 
-- AND machine like  '%OCSW-TOTRPO-02P%' 
-- and machine like '%NB8YD0Q33%' 
-- AND S.STATUS in ('ACTIVE') 
-- and s.inst_id = '2' 
-- and s.type <>'BACKGROUND' 
-- and s.sql_id  = 'bat92cnnr3gkm' 
and s.sid in ('776') 
and s.serial# in ('14733') 
-- and p.spid in ('35914') 
-- and s.PROGRAM LIKE '%rman%' 
-- and UPPER(s.PROGRAM) LIKE '%rman%' 
-- and s.username is not null 
-- and s.username not in ('SYS','GGADMIN','SYSRAC','DBSNMP','SYSBACKUP','C##GGADMIN','TECBEB','ZABBIX') 
-- and s.osuser like ('%totvs%') 
-- and s.WAIT_CLASS like ('%Concurrency%') 
-- and event like ('%GGADMIN%') 
-- and s.SERVICE_NAME IN ('SRV_ORQUESTRA_P','SRV_ASSINATURA_DIGITAL_P') 
-- and s.USERNAME NOT like ('%FLUIG%') 
-- and sql_id is not null 
order by 1; 
```

**Saber a query executada pelo usuário**
```sql
select sql_id, sql_text from gv$sql where sql_id='0varrmcsusrtk';
```

**Matar sessão oracle:**
```sql
alter system kill session '<sid>,<serial#>,<inst_id>' immediate;
--Exemplo: alter system kill session '776,14733,@1' immediate;
```

