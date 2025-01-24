/*
		Project:		Klaro OS-BIZ
		Module:			klaroosbiz.sql
		Description:	Create Schema Klaro_OSBIZ
		Author:			Martin Gäckler
		Address:		Freibadstr. 12, D-81543 München
		Phone:			+49 - 89 - 65 30 95 63
		Copyright:		CRESD GmbH
		Date:			30. 07. 2009
		Version 2       22.10.2009/mvhs/jkl
        Version 3       29.10.2009/mvhs/cresd
        Version 4		02.07.2010/mvhs/cresd
        Version 5		15.07.2010/cresd
        Version 6		10.2010/cresd
                        

	Hier werden alle VIEWS für das Projekt Klaro bei der MVHS angelegt.
	Grundsätzlich gilt, das alle erzeugten Views für Klaro ein kompatibles
	Layout haben müssen, so daß keine Spezialversion von Klaro erforderlich 
	ist.
	
	Nur solche Views, bei denen Daten aus OS-BIZ gelesen werden müssen,
	werden hier angelegt. Alle anderen Tabellen werden über public synonyms 
	angesprochen. Diese ezeugten Views sind:
	- PRUEFUNGEN
	- KURSE
	- SCHUELER
	- LEHRER
	- KURSSCHUELER
	- KURSLEHRER
	- PRUEFSCHUELER
	- FERIEN
	
	 Es wird folgendes Schema erzeugt:
	 VIEW OSBIZ_<TabellenName>			Selektiert alle Datensätze aus OS-BIZ,
	 									die gültig sind.
	 VIEW <TabellenName>				Erzeugt einen Join zwischen der OS-Biz 
	 									Quelle und der Klaro Quelle, der mit der
	 									View OSBIZ_<TabellenName> gefiltert wird.
	 									Jedes Feld, das aus OS-BIZ gelesen werden 
	 									kann und für Klaro von Bedeutung ist, wird
	 									auch von OS-BIZ gelesen. Alle anderen werden
	 									aus der Klaro Datenbank gelesen.
	 trigger <TabellenName>_ins			Falls in OS-BIZ ein neuer Datensatz erzeugt
	 									werden darf, werden mit diesem Trigger neue
	 									Datensätze sowohl in OS-BIZ als auch Klaro 
	 									erzeugt, andernfalls wird eine Exception 
	 									geworfen.
	 trigger <TabellenName>_upd			Hiermit werden Datensätze sowohl in OS-BIZ
	 									als auch Klaro aktualisiert.
	 trigger <TabellenName>_del			Falls in OS-BIZ ein Datensätze gelöscht
	 									werden dürfen, werden mit diesem Trigger 
	 									Datensätze sowohl in OS-BIZ als auch Klaro 
	 									gelöscht, andernfalls wird eine Exception 
	 									geworfen.
	 									
	 Nur Schueler können auch mit Klaro angelegt und wieder gelöscht werden.
	 Die Anmeldung zu den Kursen muß jedoch mit OS-BIZ erfolgen. Alle anderen
	 Views, die hier erzeugt werden, dürfen nur mit UPDATE bearbeitet werden. Die
	 jeweiligen insert und delete trigger werfen daher eine Exception.
	 
	 Die Prozedur updateData() wird automatisch von Klaro beim Start um beim Refresh 
	 der Tabellen aufgerufen. Sie aktualisiert alle hier erzeugten Views.
	 
	 Die Prozedur deleteData() löscht alle Datensätze aus Klaro, die nicht mehr 
	 erforderlich sind. Sie sollte über einen Oracle-Job automatisch einmal
	 täglich aufgerufen werden (am besten Nachts).

	 Hier ein paar SQL Befehle für die Job Queue:

	 declare
	 	v_JobNo number;
	 begin
		 dbms_job.submit(v_JobNo, 'deleteData;', TRUNC(SYSDATE)+1, 'TRUNC(SYSDATE)+1');
	 end;
	 /

	 SELECT job, last_date, next_date, what	FROM user_jobs;

	 declare
	 	v_JobNo number;
	 begin
		 SELECT job into v_JobNo from user_jobs where what='deleteData;';
		 dbms_job.remove(v_JobNo);
	 end;
	 /

*/

spool klarosbiz.log

create sequence kurs_id_seq;

/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table pruefungen
	-------------------------------------------------------------------------
*/
drop view osbiz_pruefungen;
create view osbiz_pruefungen as
	select	v.key_vnr as ID
	from mvhs.v
	where (
			substr(v.vnr,7,1)='A' 
		or instr(upper(v.utext1),'ORIENTIERUNGSKURS')>0
		or v.referat_kennz='7107'
	)
	and v.status in ( 'A', 'D', 'G', 'R' )
        and v.enddatum is not null
;

drop synonym pruefungen;
drop view pruefungen;
create view pruefungen as
	select	v.ENDDATUM as DATUM,
			to_char( v.ENDDATUM, 'DD.MM.YYYY' ) as DATUM_STRING,
			'20' || v.JAHR as JAHR,
			v.vnr as pruefungs_nummer,
			v.raum,
			v.utext1 as pruefung,
			p.id,
			p.aufsicht,
			p.ansprechpartner
	from mvhs.v, klaro.pruefungen p
	where v.key_vnr = p.id
	and p.id in ( select id from osbiz_pruefungen )
	order by 2, 5
;

drop trigger pruefung_upd;
create trigger pruefung_upd instead of update on pruefungen for each row
declare
begin
	update mvhs.v
	set	utext1 = :new.pruefung
	where key_vnr = :old.ID;

	update klaro.pruefungen
	set pruefung = :new.pruefung,
		aufsicht = :new.aufsicht,
		ansprechpartner = :new.ansprechpartner
	where id = :old.id;
end;
/
	
drop trigger pruefung_ins;
create trigger pruefung_ins instead of insert on pruefungen for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Pruefungen anlegen' );
end;
/

drop trigger pruefung_del;
create trigger pruefung_del instead of delete on pruefungen for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Pruefungen loeschen' );
end;
/

/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table kurse
	-------------------------------------------------------------------------
*/
drop synonym kurse;

drop table kurse_osbiz;

drop view osbiz_kurse;
create view osbiz_kurse as
	select	v.key_vnr as ID,
			v.VNR as NUMMER,
			'20' || v.JAHR as JAHR,
			decode( v.semester, 1, 'S', 2, 'W' ) as HALBJAHR,
			v.BEGDATUM as ANFANGS_DATUM, 
			v.ENDDATUM as ENDE_DATUM
	from mvhs.v
	where v.kst_kennz in ('7200','7250')
	-- v.referat_kennz in ( '7101', '7102' )
	and v.status in ( 'A', 'D', 'G', 'R' )
        and mvhs.mvhs_ist_paed_prog(v.key_vnr)=1
;

drop view kurse;
create view kurse as
select
	v.VNR as NUMMER,
	v.BEGDATUM as ANFANGS_DATUM, 
	v.ENDDATUM as ENDE_DATUM, 
	'20' || v.JAHR as JAHR,
	decode( v.semester, 1, 'S', 2, 'W' ) as HALBJAHR,
	v.BEMERKUNG,
	v.RAUM,
	v.KOSTEN1 as KURSGEBUEHR,
	v.uefachber1 * 2 as UNTERRICHTSSTUNDEN,
	substr( v.ZUSATZTEXT, 1, 32 ) as NIVEAU,
	v.KAT_TXTTERMIN as ZEIT_BEMERKUNG,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '1'
		and qt.KEY_VNR = v.key_vnr
	) as MO_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '1'
		and qt.KEY_VNR = v.key_vnr
	) as MO_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '2'
		and qt.KEY_VNR = v.key_vnr
	) as DI_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '2'
		and qt.KEY_VNR = v.key_vnr
	) as DI_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '3'
		and qt.KEY_VNR = v.key_vnr
	) as MI_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '3'
		and qt.KEY_VNR = v.key_vnr
	) as MI_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '4'
		and qt.KEY_VNR = v.key_vnr
	) as DO_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '4'
		and qt.KEY_VNR = v.key_vnr
	) as DO_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '5'
		and qt.KEY_VNR = v.key_vnr
	) as FR_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '5'
		and qt.KEY_VNR = v.key_vnr
	) as FR_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '6'
		and qt.KEY_VNR = v.key_vnr
	) as SA_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '6'
		and qt.KEY_VNR = v.key_vnr
	) as SA_END,
	(
		select min( to_date( qt.VON_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '7'
		and qt.KEY_VNR = v.key_vnr
	) as SO_ANF,
	(
		select max( to_date( qt.BIS_ZEIT, 'HH24:MI' ) )
		from mvhs.Q_EINZEL_TERMINE qt
		where to_char( qt.datum, 'D' ) = '7'
		and qt.KEY_VNR = v.key_vnr
	) as SO_END,
	k.ID,
	k.BAMF_NUMMER,
	k.WOCHENSTUNDEN,
	k.TT_STUNDEN,
	k.SOZ_PAED_STUNDEN,
	k.KURSTAGE,
	k.FEIERTAGE,
	k.KURSART,
	k.KURSTYP,
	k.KURSABSCHNITT,
	k.VORKURS,
	k.LEHRBUCH,
	k.UMSATZSTEUER,
	k.FOERDERUNG,
	k.MO_PAUS_ANF,
	k.MO_PAUS_END,
	k.DI_PAUS_ANF,
	k.DI_PAUS_END,
	k.MI_PAUS_ANF,
	k.MI_PAUS_END,
	k.DO_PAUS_ANF,
	k.DO_PAUS_END,
	k.FR_PAUS_ANF,
	k.FR_PAUS_END,
	k.SA_PAUS_ANF,
	k.SA_PAUS_END,
	k.SO_PAUS_ANF,
	k.SO_PAUS_END,
	k.AENDERUNGSDATUM,
	k.AENDERUNG_VON
from mvhs.v v, klaro.kurse k
where k.id = v.key_vnr
and k.id in ( select id from osbiz_kurse )
order by 1, 5, 4;

drop trigger kurse_upd;
create trigger kurse_upd instead of update on kurse for each row
declare
begin
	update mvhs.v
	set	-- vnr = :new.nummer,
		-- BEGDATUM = :new.ANFANGS_DATUM, 
		-- ENDDATUM = :new.ENDE_DATUM, 
		-- JAHR = substr( :new.jahr, 3, 2 ),
		-- semester = decode( :new.halbjahr, 'W', 2, 'S', 1 ),
		uefachber1 = :new.UNTERRICHTSSTUNDEN / 2,
		BEMERKUNG = :new.BEMERKUNG,
		-- RAUM = :new.RAUM,
		KOSTEN1 = :new.KURSGEBUEHR,
		ZUSATZTEXT = :new.NIVEAU,
		KAT_TXTTERMIN = :new.ZEIT_BEMERKUNG
	where key_vnr = :old.ID;

	update klaro.kurse
	set -- NUMMER = :new.nummer,
		-- ANFANGS_DATUM = :new.ANFANGS_DATUM, 
		-- ENDE_DATUM = :new.ENDE_DATUM, 
		-- JAHR = :new.jahr,
		-- HALBJAHR = :new.halbjahr,
		BEMERKUNG = :new.BEMERKUNG, 
		-- RAUM = :new.RAUM,
		BAMF_NUMMER = :new.bamf_nummer,
		UNTERRICHTSSTUNDEN = :new.UNTERRICHTSSTUNDEN,
		WOCHENSTUNDEN = :new.WOCHENSTUNDEN,
		TT_STUNDEN = :new.TT_STUNDEN,
		SOZ_PAED_STUNDEN = :new.SOZ_PAED_STUNDEN,
		KURSTAGE = :new.KURSTAGE,
		FEIERTAGE = :new.FEIERTAGE,
		KURSART = :new.KURSART,
		KURSTYP = :new.KURSTYP,
		KURSABSCHNITT = :new.KURSABSCHNITT,
		VORKURS = :new.VORKURS,
		NIVEAU = :new.NIVEAU,
		LEHRBUCH = :new.LEHRBUCH,
		UMSATZSTEUER = :new.UMSATZSTEUER,
		KURSGEBUEHR = :new.KURSGEBUEHR,
		FOERDERUNG = :new.FOERDERUNG,
		MO_ANF = :new.MO_ANF,
		MO_END = :new.MO_END,
		MO_PAUS_ANF = :new.MO_PAUS_ANF,
		MO_PAUS_END = :new.MO_PAUS_END,
		DI_ANF = :new.DI_ANF,
		DI_END = :new.DI_END,
		DI_PAUS_ANF = :new.DI_PAUS_ANF,
		DI_PAUS_END = :new.DI_PAUS_END,
		MI_ANF = :new.MI_ANF,
		MI_END = :new.MI_END,
		MI_PAUS_ANF = :new.MI_PAUS_ANF,
		MI_PAUS_END = :new.MI_PAUS_END,
		DO_ANF = :new.DO_ANF,
		DO_END = :new.DO_END,
		DO_PAUS_ANF = :new.DO_PAUS_ANF,
		DO_PAUS_END = :new.DO_PAUS_END,
		FR_ANF = :new.FR_ANF,
		FR_END = :new.FR_END,
		FR_PAUS_ANF = :new.FR_PAUS_ANF,
		FR_PAUS_END = :new.FR_PAUS_END,
		SA_ANF = :new.SA_ANF,
		SA_END = :new.SA_END,
		SA_PAUS_ANF = :new.SA_PAUS_ANF,
		SA_PAUS_END = :new.SA_PAUS_END,
		SO_ANF = :new.SO_ANF,
		SO_END = :new.SO_END,
		SO_PAUS_ANF = :new.SO_PAUS_ANF,
		SO_PAUS_END = :new.SO_PAUS_END,
		ZEIT_BEMERKUNG = :new.ZEIT_BEMERKUNG,
		AENDERUNGSDATUM = :new.AENDERUNGSDATUM,
		AENDERUNG_VON = :new.AENDERUNG_VON
	where id = :old.id;
end;
/
show errors

drop trigger kurse_ins;
create trigger kurse_ins instead of insert on kurse for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Kurse anlegen' );
end;
/

drop trigger kurse_del;
create trigger kurse_del instead of delete on kurse for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Kurse loeschen' );
end;
/


/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table schueler
	-------------------------------------------------------------------------
*/
drop synonym schueler;

drop view osbiz_schueler;
create view osbiz_schueler as
	select tnr as ID, tnr as TEILNEHMER_NUMMER, name as NACHNAME, vorname as VORNAME
	from mvhs.t
	where t.pruefer = 'n' 
	and t.name is not null
	and upper(t.hobby_kz) = 'BAMF'
;

drop view schueler;
create view schueler as
select 
	t.TNR	as ID,
	to_char( t.TNR ) as TEILNEHMER_NUMMER,
	t.NAME as NACHNAME, 
	t.VORNAME,
	t.STRASSE,
	t.LAND_KZ as LAND,
	t.PLZNEU as PLZ,
	t.ORT,
	t.GEBDATUM as GEBURTSDATUM,
	t.GEBORT as GEBURTSORT,
	t.ANREDE,
	t.GESCHLECHT,
	t.E_MAIL,
	t.KONTOINHABER as BANK_INHABER,
	t.KTONR as BANK_KONTO,
	to_char(t.BLZ) as BANK_BLZ,
	t.BANK as BANK_NAME,
	t.TELEFON_PRIVAT as TEL_PRIV,
	t.TELDIENSTL as TEL_BUERO,
	t.TELEFON_MOBIL as TEL_MOBIL,
	t.TELEFAX_NR as TEL_FAX,
	t.GEBLAND as NATIONALITAET,
	t.ADRESS_ZUSATZ as WOHNUNG,
	s.BEMERKUNG,
	s.AENDERUNGSDATUM,
	s.ANMELDE_DATUM,
	s.AUSLAENDER_STATUS,
	s.BERUF,
	s.TAETIGKEIT,
	s.WOHER,
	s.PRUEFUNGEN,
	s.EINSTUFUNG,
	s.ISCED_LEVEL,
	s.SCHULJAHRE,
	s.KURS_MODUL,
	s.KURSART,
	s.SCHREIBFAEHIGKEIT,
	s.AUSWEIS_NUMMER,
	s.BAMF_NUMMER,
	s.ABH_NUMMER,
	s.BVA_NUMMER,
	s.AZ_GRUNDSICHERUNG,
	s.ABGESCHLOSSEN,
	s.AENDERUNG_VON,
	s.AP_NAME,
	s.AP_VORNAME,
	s.AP_ORGANISATION,
	s.AP_STRASSE,
	s.AP_PLZ,
	s.AP_ORT,
	s.AP_TELEFON,
	s.AP_FAX,
	s.AP_EMAIL,
	s.AP_INFO,
	s.RUECKGABE_DATUM
from MVHS.T t, KLARO.SCHUELER s, OSBIZ_SCHUELER OS
where t.TNR = s.ID
and os.ID = t.TNR
ORDER BY 3, 4;

drop trigger schueler_ins;
create trigger schueler_ins instead of insert on schueler for each row
declare
	newId integer;
begin
	select mvhs.seq_maxtnr.nextVal into newId from dual;
	insert into mvhs.t
	(
		TNR,NAME,VORNAME, STRASSE, LAND_KZ,
		PLZNEU, ORT, GEBDATUM, GEBORT, ANREDE,
		GESCHLECHT, E_MAIL, KONTOINHABER,
		KTONR, BLZ, BANK,
		TELEFON_PRIVAT, TELDIENSTL, TELEFON_MOBIL, TELEFAX_NR,
		GEBLAND, ADRESS_ZUSATZ,
		PRUEFER, HOBBY_KZ
	)
	values
	(
		newId,
		:new.NACHNAME, 
		:new.VORNAME,
		:new.STRASSE,
		:new.LAND,
		:new.PLZ,
		:new.ORT,
		:new.GEBURTSDATUM,
		:new.GEBURTSORT,
		:new.ANREDE,
		:new.GESCHLECHT,
		:new.E_MAIL,
		:new.BANK_INHABER,
		:new.BANK_KONTO,
		:new.BANK_BLZ,
		:new.BANK_NAME,
		:new.TEL_PRIV,
		:new.TEL_BUERO,
		:new.TEL_MOBIL,
		:new.TEL_FAX,
		:new.NATIONALITAET,
		:new.WOHNUNG,
		'n',
		'BAMF'
	);
	insert into klaro.schueler
	(
		ID,
		TEILNEHMER_NUMMER,
		NACHNAME, 
		VORNAME,
		STRASSE,
		LAND,
		PLZ,
		ORT,
		GEBURTSDATUM,
		GEBURTSORT,
		ANREDE,
		GESCHLECHT,
		E_MAIL,
		BANK_INHABER,
		BANK_KONTO,
		BANK_BLZ,
		BANK_NAME,
		TEL_PRIV,
		TEL_BUERO,
		TEL_MOBIL,
		TEL_FAX,
		NATIONALITAET,
		WOHNUNG,
		AENDERUNGSDATUM,
		ANMELDE_DATUM,
		AUSLAENDER_STATUS,
		BERUF,
		TAETIGKEIT,
		WOHER,
		PRUEFUNGEN,
		EINSTUFUNG,
		ISCED_LEVEL,
		SCHULJAHRE,
		KURS_MODUL,
		KURSART,
		SCHREIBFAEHIGKEIT,
		AUSWEIS_NUMMER,
		BAMF_NUMMER,
		ABH_NUMMER,
		BVA_NUMMER,
		AZ_GRUNDSICHERUNG,
		ABGESCHLOSSEN,
		BEMERKUNG,
		AENDERUNG_VON,
		AP_NAME,
		AP_VORNAME,
		AP_ORGANISATION,
		AP_STRASSE,
		AP_PLZ,
		AP_ORT,
		AP_TELEFON,
		AP_FAX,
		AP_EMAIL,
		AP_INFO,
		RUECKGABE_DATUM
	)
	values
	(
		newId,
		newId,
		:new.NACHNAME, 
		:new.VORNAME,
		:new.STRASSE,
		:new.LAND,
		:new.PLZ,
		:new.ORT,
		:new.GEBURTSDATUM,
		:new.GEBURTSORT,
		:new.ANREDE,
		:new.GESCHLECHT,
		:new.E_MAIL,
		:new.BANK_INHABER,
		:new.BANK_KONTO,
		:new.BANK_BLZ,
		:new.BANK_NAME,
		:new.TEL_PRIV,
		:new.TEL_BUERO,
		:new.TEL_MOBIL,
		:new.TEL_FAX,
		:new.NATIONALITAET,
		:new.WOHNUNG,
		:new.AENDERUNGSDATUM,
		:new.ANMELDE_DATUM,
		:new.AUSLAENDER_STATUS,
		:new.BERUF,
		:new.TAETIGKEIT,
		:new.WOHER,
		:new.PRUEFUNGEN,
		:new.EINSTUFUNG,
		:new.ISCED_LEVEL,
		:new.SCHULJAHRE,
		:new.KURS_MODUL,
		:new.KURSART,
		:new.SCHREIBFAEHIGKEIT,
		:new.AUSWEIS_NUMMER,
		:new.BAMF_NUMMER,
		:new.ABH_NUMMER,
		:new.BVA_NUMMER,
		:new.AZ_GRUNDSICHERUNG,
		:new.ABGESCHLOSSEN,
		:new.BEMERKUNG,
		:new.AENDERUNG_VON,
		:new.AP_NAME,
		:new.AP_VORNAME,
		:new.AP_ORGANISATION,
		:new.AP_STRASSE,
		:new.AP_PLZ,
		:new.AP_ORT,
		:new.AP_TELEFON,
		:new.AP_FAX,
		:new.AP_EMAIL,
		:new.AP_INFO,
		:new.RUECKGABE_DATUM
	);
end;
/
show errors


drop trigger schueler_upd;
create trigger schueler_upd instead of update on schueler for each row
declare
begin
	update mvhs.t
	set name = :new.nachname,
		VORNAME = :new.VORNAME,
		STRASSE = :new.STRASSE,
		LAND_KZ = :new.LAND,
		PLZNEU = :new.PLZ,
		ORT = :new.ORT,
		GEBDATUM = :new.GEBURTSDATUM,
		GEBORT = :new.GEBURTSORT,
		ANREDE = :new.ANREDE,
		GESCHLECHT = :new.GESCHLECHT,
		E_MAIL = :new.E_MAIL,
		KONTOINHABER = :new.BANK_INHABER,
		KTONR = :new.BANK_KONTO,
		BLZ = :new.BANK_BLZ,
		BANK = :new.BANK_NAME,
		TELEFON_PRIVAT = :new.TEL_PRIV,
		TELDIENSTL = :new.TEL_BUERO,
		TELEFON_MOBIL = :new.TEL_MOBIL,
		TELEFAX_NR = :new.TEL_FAX,
		GEBLAND = :new.NATIONALITAET,
		ADRESS_ZUSATZ = :new.WOHNUNG
	where TNR = :old.id;

	update klaro.schueler
	set NACHNAME = :new.NACHNAME, 
		VORNAME = :new.VORNAME,
		STRASSE = :new.STRASSE,
		LAND = :new.LAND,
		PLZ = :new.PLZ,
		ORT = :new.ORT,
		GEBURTSDATUM = :new.GEBURTSDATUM,
		GEBURTSORT = :new.GEBURTSORT,
		ANREDE = :new.ANREDE,
		GESCHLECHT = :new.GESCHLECHT,
		E_MAIL = :new.E_MAIL,
		BANK_INHABER = :new.BANK_INHABER,
		BANK_KONTO = :new.BANK_KONTO,
		BANK_BLZ = :new.BANK_BLZ,
		BANK_NAME = :new.BANK_NAME,
		TEL_PRIV = :new.TEL_PRIV,
		TEL_BUERO = :new.TEL_BUERO,
		TEL_MOBIL = :new.TEL_MOBIL,
		TEL_FAX = :new.TEL_FAX,
		NATIONALITAET = :new.NATIONALITAET,
		WOHNUNG = :new.WOHNUNG,
		AENDERUNGSDATUM = :new.AENDERUNGSDATUM,
		ANMELDE_DATUM = :new.ANMELDE_DATUM,
		AUSLAENDER_STATUS = :new.AUSLAENDER_STATUS,
		BERUF = :new.BERUF,
		TAETIGKEIT = :new.TAETIGKEIT,
		WOHER = :new.WOHER,
		PRUEFUNGEN = :new.PRUEFUNGEN,
		EINSTUFUNG = :new.EINSTUFUNG,
		ISCED_LEVEL = :new.ISCED_LEVEL,
		SCHULJAHRE = :new.SCHULJAHRE,
		KURS_MODUL = :new.KURS_MODUL,
		KURSART = :new.KURSART,
		SCHREIBFAEHIGKEIT = :new.SCHREIBFAEHIGKEIT,
		AUSWEIS_NUMMER = :new.AUSWEIS_NUMMER,
		BAMF_NUMMER = :new.BAMF_NUMMER,
		ABH_NUMMER = :new.ABH_NUMMER,
		BVA_NUMMER = :new.BVA_NUMMER,
		AZ_GRUNDSICHERUNG = :new.AZ_GRUNDSICHERUNG,
		ABGESCHLOSSEN = :new.ABGESCHLOSSEN,
		BEMERKUNG = :new.BEMERKUNG,
		AENDERUNG_VON = :new.AENDERUNG_VON,
		AP_NAME = :new.AP_NAME,
		AP_VORNAME = :new.AP_VORNAME,
		AP_ORGANISATION = :new.AP_ORGANISATION,
		AP_STRASSE = :new.AP_STRASSE,
		AP_PLZ = :new.AP_PLZ,
		AP_ORT = :new.AP_ORT,
		AP_TELEFON = :new.AP_TELEFON,
		AP_FAX = :new.AP_FAX,
		AP_EMAIL = :new.AP_EMAIL,
		AP_INFO = :new.AP_INFO,
		RUECKGABE_DATUM = :new.RUECKGABE_DATUM
	where ID = :old.id;
end;
/
show errors



drop trigger schueler_del;
create trigger schueler_del instead of delete on schueler for each row
declare
begin
	delete from mvhs.t
	where TNR = :old.id;

	delete from klaro.schueler
	where ID = :old.id;
end;
/
show errors



/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table lehrer
	-------------------------------------------------------------------------
*/
drop synonym lehrer;

drop view osbiz_lehrer;
create view osbiz_lehrer as
	select tnr as ID, name as NACHNAME, vorname as VORNAME
	from mvhs.t
	where t.pruefer in ( 'd', 'p', 'b' )
	and t.name is not null
;

drop view lehrer;
create view lehrer as
select 
	t.TNR	as ID,
	t.NAME as NACHNAME, 
	t.VORNAME,
	t.STRASSE,
	t.LAND_KZ as LAND,
	t.PLZNEU as PLZ,
	t.ORT,
	t.GEBDATUM as GEBURTSDATUM,
	t.GEBORT as GEBURTSORT,
	t.ANREDE,
	t.GESCHLECHT,
	t.E_MAIL,
	t.TELEFON_PRIVAT as TEL_PRIV,
	t.TELDIENSTL as TEL_BUERO,
	t.TELEFON_MOBIL as TEL_MOBIL,
	t.TELEFAX_NR as TEL_FAX,
	t.GEBLAND as NATIONALITAET,
	t.ADRESS_ZUSATZ as WOHNUNG,
	t.TITEL as AKAD_TITEL,
	l.BEMERKUNG,
	l.SV_ABSCHLUSS,
	l.DAF_ERFAHRUNG,
	l.EINSTIEG,
	l.VERTRAG,
	l.BAMF_NUMMER
from MVHS.T t, KLARO.LEHRER l
where t.TNR = l.ID
ORDER BY 2, 3;

drop trigger lehrer_ins;
create trigger lehrer_ins instead of insert on lehrer for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Lehrer anlegen' );
end;
/
show errors


drop trigger lehrer_upd;
create trigger lehrer_upd instead of update on lehrer for each row
declare
begin
	update mvhs.t
	set name = :new.nachname,
		VORNAME = :new.VORNAME,
		STRASSE = :new.STRASSE,
		LAND_KZ = :new.LAND,
		PLZNEU = :new.PLZ,
		ORT = :new.ORT,
		GEBDATUM = :new.GEBURTSDATUM,
		GEBORT = :new.GEBURTSORT,
		ANREDE = :new.ANREDE,
		GESCHLECHT = :new.GESCHLECHT,
		E_MAIL = :new.E_MAIL,
		TELEFON_PRIVAT = :new.TEL_PRIV,
		TELDIENSTL = :new.TEL_BUERO,
		TELEFON_MOBIL = :new.TEL_MOBIL,
		TELEFAX_NR = :new.TEL_FAX,
		GEBLAND = :new.NATIONALITAET,
		ADRESS_ZUSATZ = :new.WOHNUNG,
		TITEL = :new.AKAD_TITEL
	where TNR = :old.id;

	update klaro.lehrer
	set NACHNAME = :new.NACHNAME, 
		VORNAME = :new.VORNAME,
		STRASSE = :new.STRASSE,
		LAND = :new.LAND,
		PLZ = :new.PLZ,
		ORT = :new.ORT,
		GEBURTSDATUM = :new.GEBURTSDATUM,
		GEBURTSORT = :new.GEBURTSORT,
		ANREDE = :new.ANREDE,
		GESCHLECHT = :new.GESCHLECHT,
		E_MAIL = :new.E_MAIL,
		TEL_PRIV = :new.TEL_PRIV,
		TEL_BUERO = :new.TEL_BUERO,
		TEL_MOBIL = :new.TEL_MOBIL,
		TEL_FAX = :new.TEL_FAX,
		NATIONALITAET = :new.NATIONALITAET,
		WOHNUNG = :new.WOHNUNG,
		AKAD_TITEL = :new.AKAD_TITEL,
		SV_ABSCHLUSS = :new.SV_ABSCHLUSS,
		DAF_ERFAHRUNG = :new.DAF_ERFAHRUNG,
		EINSTIEG = :new.EINSTIEG,
		VERTRAG = :new.VERTRAG,
		BAMF_NUMMER = :new.BAMF_NUMMER,
		BEMERKUNG = :new.BEMERKUNG
	where ID = :old.id;
end;
/
show errors



drop trigger lehrer_del;
create trigger lehrer_del instead of delete on lehrer for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Lehrer loeschen' );
end;
/
show errors

/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table kursschueler
	-------------------------------------------------------------------------
*/
drop view osbiz_kursschueler;
create view osbiz_kursschueler
as
	select distinct q.key_vnr, q.TNR
	from mvhs.QUITTUNG q, klaro.kurse k
	where q.key_vnr = k.id
	and q.kennz = 'H'
	and exists (
		select *
		from osbiz_schueler os
		where os.id = q.tnr
	)
;


drop synonym kursschueler;
drop view kursschueler;
create view kursschueler as
select	ks.*
from klaro.kursschueler ks;

drop trigger kursschueler_upd;
create trigger kursschueler_upd instead of update on kursschueler for each row
declare
begin
	update klaro.kursschueler
	set	KURS_ID = :new.kurs_id, SCHUELER_ID = :new.SCHUELER_ID, ANFANG = :new.ANFANG,
		ENDE =  :new.ENDE,
		KOSTENBETEILIGUNG = :new.KOSTENBETEILIGUNG,
		ANTRAG_KOSTENBEFREIUNG = :new.ANTRAG_KOSTENBEFREIUNG,
		ORDNUNGSGEMAESS = :new.ORDNUNGSGEMAESS,
		FAHRTKOSTENBEWILLIGUNG = :new.FAHRTKOSTENBEWILLIGUNG,
		BEMERKUNG = :new.BEMERKUNG,
		SCHUELER_MODUL = :new.SCHUELER_MODUL,
		STORNO = :new.STORNO,
		ANMELDE_DATUM = :new.ANMELDE_DATUM,
		KOSTENBEFREIUNG = :new.KOSTENBEFREIUNG,
		KURS_WECHSEL = :new.KURS_WECHSEL,
		BEHOERDE = :new.BEHOERDE,
		BERECHTIGUNGS_NR = :new.BERECHTIGUNGS_NR
	where ID = :old.ID;
end;
/
show errors

drop trigger kursschueler_ins;
create trigger kursschueler_ins instead of insert on kursschueler for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Schueler anlegen' );
end;
/
show errors

	
drop trigger kursschueler_del;
create trigger kursschueler_del instead of delete on kursschueler for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Schueler loeschen' );
end;
/
show errors


/*
	-----------------------------------------------------------------
	create table, sequence number, view and triggers for table ferien
	-----------------------------------------------------------------
*/
drop synonym ferien;
drop view ferien;
create view ferien as
select	f.vtage_beginn as anfang,
		f.vtage_ende as ende,
		f.bezeichnung
from mvhs.ferien f
where upper( f.bezeichnung ) not like '%*ZUSATZ*%'
and upper(f.gebietskuerzel) = 'MVHS';

drop trigger ferien_ins;
create trigger ferien_ins instead of insert on ferien for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Ferientermine anlegen' );
end;
/
show errors

drop trigger ferien_upd;
create trigger ferien_upd instead of update on ferien for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Ferientermine aendern' );
end;
/
show errors

drop trigger ferien_del;
create trigger ferien_del instead of insert on ferien for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Ferientermine loeschen' );
end;
/
show errors

/*
	-------------------------------------------------------------------------
	create table, sequence number, view and triggers for table pruefschueler
	-------------------------------------------------------------------------
*/
drop view osbiz_pruefschueler;
create view osbiz_pruefschueler
as
	select distinct q.key_vnr, q.TNR
	from mvhs.QUITTUNG q, klaro.pruefungen k
	where q.key_vnr = k.id
	and q.kennz = 'H'
	and exists (
		select *
		from osbiz_schueler os
		where os.id = q.tnr
	)
;

drop synonym pruefschueler;
drop view pruefschueler;
create view pruefschueler as
select	ps.*
from klaro.pruefschueler ps;

drop trigger pruefschueler_upd;
create trigger pruefschueler_upd instead of update on pruefschueler for each row
declare
begin
	update klaro.pruefschueler
	set	PRUEF_ID = :new.pruef_id,
		SCHUELER_ID = :new.SCHUELER_ID,
		BEMERKUNG = :new.BEMERKUNG,
		BESTANDEN = :new.BESTANDEN,
		KOSTENBETEILIGUNG = :new.KOSTENBETEILIGUNG,
		BEHOERDE = :new.BEHOERDE,
		BERECHTIGUNGS_NR = :new.BERECHTIGUNGS_NR
	where ID = :old.ID;
end;
/
show errors

drop trigger pruefschueler_ins;
create trigger pruefschueler_ins instead of insert on pruefschueler for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine neuen Schueler anlegen' );
end;
/
show errors

	
drop trigger pruefschueler_del;
create trigger pruefschueler_del instead of delete on pruefschueler for each row
declare
begin
	raise_application_error( -20000, 'Sie duerfen mit Klaro keine Schueler loeschen' );
end;
/
show errors

/*
	-------------------------------------------------------------------------
	Procedure to update the klaro database from OS-BIZ
	-------------------------------------------------------------------------
*/

create or replace procedure updateData as
/*
	Kurslehrer
*/
	Cursor klTC is
		select distinct q.DOZNR, k.ID
		from mvhs.Q_EINZEL_TERMINE q, klaro.kurse k, klaro.lehrer l
		where q.key_vnr = k.id
		and	l.id = q.DOZNR
		and not exists
		(
			select * 
			from klaro.kurslehrer kl
			where kl.kurs_id = k.id
			and kl.lehrer_id = l.id
		);

/*
	Kursschüler
*/
	Cursor ksTC is
		select oks.key_vnr, oks.tnr
		from osbiz_kursschueler oks
		where not exists
		(
			select * 
			from klaro.kursschueler ks
			where ks.kurs_id = oks.key_vnr
			and ks.schueler_id = oks.tnr
		);

/*
	Prüfungsteilnehmer
*/
	Cursor psTC is
		select oks.key_vnr, oks.tnr
		from osbiz_pruefschueler oks
		where not exists
		(
			select * 
			from klaro.pruefschueler ps
			where ps.pruef_id = oks.key_vnr
			and ps.schueler_id = oks.tnr
		);
begin
	-----------------
	--- erzeuge Kurse
	-----------------
	insert into klaro.kurse
	(
		id, nummer, jahr, halbjahr, anfangs_datum, ende_datum
	)
	select	ID, NUMMER, JAHR, HALBJAHR, ANFANGS_DATUM, ENDE_DATUM
	from osbiz_kurse ok
	where not exists (
		select * from klaro.kurse k
		where k.id = ok.id
	);

	----------------------
	--- erzeuge Pruefungen
	----------------------
	insert into klaro.pruefungen
	(
		ID, PRUEFUNG, DATUM, JAHR, DATUM_STRING, PRUEFUNGS_NUMMER, RAUM
	)
	select	v.key_vnr as ID,
			v.vnr as pruefung,
			v.ENDDATUM as DATUM,
			'20' || v.JAHR as JAHR,
			to_char( v.ENDDATUM, 'DD.MM.YYYY' ) as DATUM_STRING,
			v.vnr as pruefungs_nummer,
			v.raum
	from mvhs.v, osbiz_pruefungen op
	where v.key_vnr = op.id
	and not exists
	( 
		select * from klaro.pruefungen p
		where p.id = op.id
	);
	

	--------------------
	--- erzeuge Schueler
	--------------------
	insert into klaro.schueler
	(
		ID,
		TEILNEHMER_NUMMER,
		NACHNAME, 
		VORNAME,
		ABGESCHLOSSEN
	)
	select	ID,
			TEILNEHMER_NUMMER,
			NACHNAME, 
			VORNAME,
			'N' 
	from osbiz_schueler os
	where not exists
	(
		select * from klaro.schueler
		where klaro.schueler.id = os.id
	);

	------------------
	--- erzeuge Lehrer
	------------------
	insert into klaro.lehrer
	(
		ID,
		NACHNAME, 
		VORNAME
	)
	select ID, NACHNAME, VORNAME
	from osbiz_lehrer ol
	where not exists
	(
		select * from klaro.lehrer
		where klaro.lehrer.id = ol.id
	);

	--------------------------
	--- erzeuge Kursteilnehmer
	--------------------------
	for item in ksTC loop
		insert into klaro.kursschueler
		(
			id, schueler_id, kurs_id
		)
		values
		(
			kurs_id_seq.nextval, item.tnr, item.key_vnr
		);
	end loop;
		
	-------------------------------
	--- erzeuge Pruefungsteilnehmer
	-------------------------------
	for item in psTC loop
		insert into klaro.pruefschueler
		(
			id, schueler_id, pruef_id
		)
		values
		(
			kurs_id_seq.nextval, item.tnr, item.key_vnr
		);
	end loop;
		

	----------------------
	--- erzeuge Kursleiter
	----------------------
	for item in klTC loop
		insert into klaro.kurslehrer
		(
			ID, LEHRER_ID, KURS_ID
		)
		values
		(
			kurs_id_seq.nextval, item.DOZNR, item.ID
		);
	end loop;
end;
/
show errors


create or replace procedure deleteData as
begin
	delete from klaro.anwesenheiten
	where kurs_id not in
	(
		select id from osbiz_kurse
	)
	or schueler_id not in
	(
		select id from osbiz_schueler
	);
	delete from klaro.bezahlung
	where kurs_schueler_id in
	(
		select id from klaro.kursschueler
		where kurs_id not in
		(
			select id from osbiz_kurse
		)
		or schueler_id not in
		(
			select id from osbiz_schueler
		)
	);
	delete from klaro.kursschueler
	where kurs_id not in
	(
		select id from osbiz_kurse
	)
	or schueler_id not in
	(
		select id from osbiz_schueler
	)
	or (kurs_id, schueler_id) not in
	(
		select key_vnr, tnr from osbiz_kursschueler
	);
	delete from klaro.pruefschueler
	where schueler_id not in
	(
		select id from osbiz_schueler
	) 
	or pruef_id not in
	(
		select id from osbiz_pruefungen
	)
	or (pruef_id, schueler_id) not in
	(
		select key_vnr, tnr from osbiz_pruefschueler
	);
	delete from klaro.lehrzeiten
	where lehrer_kurs_id in
	(
		select id from klaro.kurslehrer
		where kurs_id not in
		(
			select id from osbiz_kurse
		)
		or lehrer_id not in
		(
			select id from osbiz_lehrer
		)
	);
	
	delete from klaro.kurslehrer
	where kurs_id not in
	(
		select kurs_id from osbiz_kurse
	)
	or lehrer_id not in
	(
		select id from osbiz_lehrer
	);
	delete from klaro.kursbuecher
	where kurs_id not in
	(
		select id from osbiz_kurse
	);
	delete from klaro.kurse
	where id not in
	(
		select id from osbiz_kurse
	);
	delete from klaro.lehrer
	where id not in ( select id from osbiz_lehrer );
	delete from klaro.schueler
	where id not in ( select id from osbiz_schueler );
	delete from klaro.kurse
	where id not in ( select id from osbiz_kurse );
	delete from klaro.pruefungen
	where id not in ( select id from osbiz_pruefungen );
end;
/
show errors

begin
	updateData();
end;
/

/*
begin
	deleteData();
end;
/
*/
commit;

spool off;
