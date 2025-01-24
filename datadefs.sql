set pagesize 9999
set linesize 90

spool "datadefs.csv"
select 'table_name,column_name,data_type,data_length,data_precision,data_scale,pflichtfeld'
from dual;

select table_name || ',' || column_name || ',' || 
	decode( data_type, 'VARCHAR2', 'Alpha', 'DATE', 'Datum',  'NUMBER', 'Zahl', 'LONG', 'Mehrzeilig' ) ||
	',' || data_length || ',' || data_precision || ',' || data_scale || ',' || 
	decode( nullable, 'Y', 'N', 'N', 'J' )
from user_tab_cols where table_name in ( 'LEHRER', 'KURSE', 'FERIEN', 'LEHRBUECHER', 'SCHUELER' )
order by table_name, column_id;

spool off

