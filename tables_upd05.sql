alter table PRUEFSCHUELER add
(
	BEHOERDE			VARCHAR(32),
	BERECHTIGUNGS_NR	VARCHAR(255)
);

alter table KURSSCHUELER add
(
	BEHOERDE			VARCHAR(32),
	BERECHTIGUNGS_NR	VARCHAR(255)
);

alter table SCHUELER modify
(
	AP_TELEFON			VARCHAR(64),
	AP_FAX				VARCHAR(64),
	AP_EMAIL			VARCHAR(255)
);

alter table SCHUELER
drop column WDH_BAMF_NUMMER;
