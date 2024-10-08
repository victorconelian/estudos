#### Consulta de Backups

```sql
SET LINES 250
SET PAGES 250
COL INPUT_TYPE FORMAT A15
COL COMMAND_ID FORMAT A40
COL START_TIME FORMAT A20
COL TIME_TAKEN_DISPLAY FORMAT A10
COL INPUT_BYTES_DISPLAY FORMAT A10
COL START_TIME FORM A23
COL END_TIME FORM A23
SELECT
j.session_recid,
j.session_stamp,
j.input_type,
j.COMMAND_ID,
TO_CHAR(START_TIME,'DD/MM/yyyy HH24:MI:SS') START_TIME,
TO_CHAR(END_TIME,'DD/MM/yyyy HH24:MI:SS') END_TIME,
STATUS,
TIME_TAKEN_DISPLAY,
--INPUT_BYTES_DISPLAY,
trunc((j.output_bytes/1024/1024/1024),2) output_Gbytes
from V$RMAN_BACKUP_JOB_DETAILS j
left outer join (select
d.session_recid, d.session_stamp,
sum(case when d.controlfile_included = 'YES' then d.pieces else 0 end) CF,
sum(case when d.controlfile_included = 'NO'
and d.backup_type||d.incremental_level = 'D' then d.pieces else 0 end) DF,
sum(case when d.backup_type||d.incremental_level = 'D0' then d.pieces else 0 end) I0,
sum(case when d.backup_type||d.incremental_level = 'I1' then d.pieces else 0 end) I1,
sum(case when d.backup_type = 'L' then d.pieces else 0 end) L
from
V$BACKUP_SET_DETAILS d
join V$BACKUP_SET s on s.set_stamp = d.set_stamp and s.set_count = d.set_count
where s.input_file_scan_only = 'NO'
group by d.session_recid, d.session_stamp) x
on x.session_recid = j.session_recid and x.session_stamp = j.session_stamp
left outer join (select o.session_recid, o.session_stamp, min(inst_id) inst_id
from GV$RMAN_OUTPUT o
group by o.session_recid, o.session_stamp)
ro on ro.session_recid = j.session_recid and ro.session_stamp = j.session_stamp
where
j.START_TIME > trunc(sysdate-7)
--AND j.input_type = 'DB FULL'
--AND j.input_type = 'DB INCR'
--AND J.COMMAND_ID='INCR DIARIO'
--AND J.COMMAND_ID='Full Diario'
--AND J.COMMAND_ID<>'ARCHIVELOG'
--AND upper(j.COMMAND_ID) like '%SEMANAL%'
--AND START_TIME > '16/MAY/2021'
--AND j.status = 'FAILED'
--AND j.status = 'COMPLETED'
order by END_TIME asc;

```
