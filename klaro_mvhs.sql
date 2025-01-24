/*
		Project:		Klaro OS-BIZ
		Module:			klaro_mvhs.sql
		Description:	Grant permissions from MVHS-Schema to Klaro-OSBIZ
		Author:			Martin Gäckler
		Address:		Freibadstr. 12, D-81543 München
		Phone:			+49 - 89 - 65 30 95 63
		Copyright:		CRESD GmbH
		Date:			30. 07. 2009
*/


grant select on QUITTUNG to klaro_osbiz;

grant select on T to klaro_osbiz;
grant update on T to klaro_osbiz;
grant insert on T to klaro_osbiz;
grant delete on T to klaro_osbiz;

grant select on Q_EINZEL_TERMINE to klaro_osbiz;

grant select on V to klaro_osbiz;
grant update on V to klaro_osbiz;

grant select on seq_maxtnr to klaro_osbiz;

grant select on ferien to klaro_osbiz;

grant execute on mvhs_ist_paed_prog to klaro_osbiz;

