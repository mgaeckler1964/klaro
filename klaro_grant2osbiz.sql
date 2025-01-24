/*
		Project:		Klaro OS-BIZ
		Module:			klaro_grant2osbiz.sql
		Description:	Grant all permissions to Klaro_osbiz and create the synonym script for klaro_osbiz
		Author:			Martin Gäckler
		Address:		Freibadstr. 12, D-81543 München
		Phone:			+49 - 89 - 65 30 95 63
		Copyright:		CRESD GmbH
		Date:			30. 07. 2009
*/

set pagesize 9999

spool "_klaro_grant2osbiz.sql"
select 'grant select, update, delete, insert on ' || TABLE_NAME || ' to klaro_osbiz;' from user_tables order by table_name;
spool off

@_klaro_grant2osbiz

spool "_klaro_synonyms.sql"
select 'create synonym ' || TABLE_NAME || ' for klaro.' || TABLE_NAME || ';' from user_tables order by table_name;
spool off
