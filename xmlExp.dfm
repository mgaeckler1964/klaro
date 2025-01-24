object xmlDataModule: TxmlDataModule
  OldCreateOrder = False
  Left = 415
  Top = 129
  Height = 474
  Width = 764
  object CourseQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select * from kurse where id = :theCourse'
      '  ')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
        Value = 0
      end>
    object CourseQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."kurse.DB".ID'
    end
    object CourseQueryJAHR: TStringField
      FieldName = 'JAHR'
      Origin = 'KLARODB."kurse.DB".JAHR'
      Size = 4
    end
    object CourseQueryHALBJAHR: TStringField
      FieldName = 'HALBJAHR'
      Origin = 'KLARODB."kurse.DB".HALBJAHR'
      Size = 1
    end
    object CourseQueryNUMMER: TStringField
      FieldName = 'NUMMER'
      Origin = 'KLARODB."kurse.DB".NUMMER'
      Size = 32
    end
    object CourseQueryBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Origin = 'KLARODB."kurse.DB".BAMF_NUMMER'
      Size = 32
    end
    object CourseQueryANFANGS_DATUM: TDateTimeField
      FieldName = 'ANFANGS_DATUM'
      Origin = 'KLARODB."kurse.DB".ANFANGS_DATUM'
    end
    object CourseQueryENDE_DATUM: TDateTimeField
      FieldName = 'ENDE_DATUM'
      Origin = 'KLARODB."kurse.DB".ENDE_DATUM'
    end
    object CourseQueryUNTERRICHTSSTUNDEN: TFloatField
      FieldName = 'UNTERRICHTSSTUNDEN'
      Origin = 'KLARODB."kurse.DB".UNTERRICHTSSTUNDEN'
    end
    object CourseQueryWOCHENSTUNDEN: TFloatField
      FieldName = 'WOCHENSTUNDEN'
      Origin = 'KLARODB."kurse.DB".WOCHENSTUNDEN'
    end
    object CourseQueryTT_STUNDEN: TFloatField
      FieldName = 'TT_STUNDEN'
      Origin = 'KLARODB."kurse.DB".TT_STUNDEN'
    end
    object CourseQuerySOZ_PAED_STUNDEN: TFloatField
      FieldName = 'SOZ_PAED_STUNDEN'
      Origin = 'KLARODB."kurse.DB".SOZ_PAED_STUNDEN'
    end
    object CourseQueryMO_ANF: TDateTimeField
      FieldName = 'MO_ANF'
      Origin = 'KLARODB."kurse.DB".MO_ANF'
    end
    object CourseQueryMO_END: TDateTimeField
      FieldName = 'MO_END'
      Origin = 'KLARODB."kurse.DB".MO_END'
    end
    object CourseQueryMO_PAUS_ANF: TDateTimeField
      FieldName = 'MO_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".MO_PAUS_ANF'
    end
    object CourseQueryMO_PAUS_END: TDateTimeField
      FieldName = 'MO_PAUS_END'
      Origin = 'KLARODB."kurse.DB".MO_PAUS_END'
    end
    object CourseQueryDI_ANF: TDateTimeField
      FieldName = 'DI_ANF'
      Origin = 'KLARODB."kurse.DB".DI_ANF'
    end
    object CourseQueryDI_END: TDateTimeField
      FieldName = 'DI_END'
      Origin = 'KLARODB."kurse.DB".DI_END'
    end
    object CourseQueryDI_PAUS_ANF: TDateTimeField
      FieldName = 'DI_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".DI_PAUS_ANF'
    end
    object CourseQueryDI_PAUS_END: TDateTimeField
      FieldName = 'DI_PAUS_END'
      Origin = 'KLARODB."kurse.DB".DI_PAUS_END'
    end
    object CourseQueryMI_ANF: TDateTimeField
      FieldName = 'MI_ANF'
      Origin = 'KLARODB."kurse.DB".MI_ANF'
    end
    object CourseQueryMI_END: TDateTimeField
      FieldName = 'MI_END'
      Origin = 'KLARODB."kurse.DB".MI_END'
    end
    object CourseQueryMI_PAUS_ANF: TDateTimeField
      FieldName = 'MI_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".MI_PAUS_ANF'
    end
    object CourseQueryMI_PAUS_END: TDateTimeField
      FieldName = 'MI_PAUS_END'
      Origin = 'KLARODB."kurse.DB".MI_PAUS_END'
    end
    object CourseQueryDO_ANF: TDateTimeField
      FieldName = 'DO_ANF'
      Origin = 'KLARODB."kurse.DB".DO_ANF'
    end
    object CourseQueryDO_END: TDateTimeField
      FieldName = 'DO_END'
      Origin = 'KLARODB."kurse.DB".DO_END'
    end
    object CourseQueryDO_PAUS_ANF: TDateTimeField
      FieldName = 'DO_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".DO_PAUS_ANF'
    end
    object CourseQueryDO_PAUS_END: TDateTimeField
      FieldName = 'DO_PAUS_END'
      Origin = 'KLARODB."kurse.DB".DO_PAUS_END'
    end
    object CourseQueryFR_ANF: TDateTimeField
      FieldName = 'FR_ANF'
      Origin = 'KLARODB."kurse.DB".FR_ANF'
    end
    object CourseQueryFR_END: TDateTimeField
      FieldName = 'FR_END'
      Origin = 'KLARODB."kurse.DB".FR_END'
    end
    object CourseQueryFR_PAUS_ANF: TDateTimeField
      FieldName = 'FR_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".FR_PAUS_ANF'
    end
    object CourseQueryFR_PAUS_END: TDateTimeField
      FieldName = 'FR_PAUS_END'
      Origin = 'KLARODB."kurse.DB".FR_PAUS_END'
    end
    object CourseQuerySA_ANF: TDateTimeField
      FieldName = 'SA_ANF'
      Origin = 'KLARODB."kurse.DB".SA_ANF'
    end
    object CourseQuerySA_END: TDateTimeField
      FieldName = 'SA_END'
      Origin = 'KLARODB."kurse.DB".SA_END'
    end
    object CourseQuerySA_PAUS_ANF: TDateTimeField
      FieldName = 'SA_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".SA_PAUS_ANF'
    end
    object CourseQuerySA_PAUS_END: TDateTimeField
      FieldName = 'SA_PAUS_END'
      Origin = 'KLARODB."kurse.DB".SA_PAUS_END'
    end
    object CourseQuerySO_ANF: TDateTimeField
      FieldName = 'SO_ANF'
      Origin = 'KLARODB."kurse.DB".SO_ANF'
    end
    object CourseQuerySO_END: TDateTimeField
      FieldName = 'SO_END'
      Origin = 'KLARODB."kurse.DB".SO_END'
    end
    object CourseQuerySO_PAUS_ANF: TDateTimeField
      FieldName = 'SO_PAUS_ANF'
      Origin = 'KLARODB."kurse.DB".SO_PAUS_ANF'
    end
    object CourseQuerySO_PAUS_END: TDateTimeField
      FieldName = 'SO_PAUS_END'
      Origin = 'KLARODB."kurse.DB".SO_PAUS_END'
    end
    object CourseQueryKURSTAGE: TStringField
      FieldName = 'KURSTAGE'
      Origin = 'KLARODB."kurse.DB".KURSTAGE'
      Size = 255
    end
    object CourseQueryFEIERTAGE: TStringField
      FieldName = 'FEIERTAGE'
      Origin = 'KLARODB."kurse.DB".FEIERTAGE'
      Size = 255
    end
    object CourseQueryVORKURS: TStringField
      FieldName = 'VORKURS'
      Origin = 'KLARODB."kurse.DB".VORKURS'
      Size = 32
    end
    object CourseQueryKURSART: TStringField
      FieldName = 'KURSART'
      Origin = 'KLARODB."kurse.DB".KURSART'
      Size = 64
    end
    object CourseQueryKURSTYP: TStringField
      FieldName = 'KURSTYP'
      Origin = 'KLARODB."kurse.DB".KURSTYP'
      Size = 32
    end
    object CourseQueryKURSABSCHNITT: TStringField
      FieldName = 'KURSABSCHNITT'
      Origin = 'KLARODB."kurse.DB".KURSABSCHNITT'
      Size = 32
    end
    object CourseQueryNIVEAU: TStringField
      FieldName = 'NIVEAU'
      Origin = 'KLARODB."kurse.DB".NIVEAU'
      Size = 32
    end
    object CourseQueryLEHRBUCH: TStringField
      FieldName = 'LEHRBUCH'
      Origin = 'KLARODB."kurse.DB".LEHRBUCH'
      Size = 64
    end
    object CourseQueryRAUM: TStringField
      FieldName = 'RAUM'
      Origin = 'KLARODB."kurse.DB".RAUM'
      Size = 32
    end
    object CourseQueryUMSATZSTEUER: TFloatField
      FieldName = 'UMSATZSTEUER'
      Origin = 'KLARODB."kurse.DB".UMSATZSTEUER'
    end
    object CourseQueryKURSGEBUEHR: TFloatField
      FieldName = 'KURSGEBUEHR'
      Origin = 'KLARODB."kurse.DB".KURSGEBUEHR'
    end
    object CourseQueryFOERDERUNG: TFloatField
      FieldName = 'FOERDERUNG'
      Origin = 'KLARODB."kurse.DB".FOERDERUNG'
    end
    object CourseQueryAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
      Origin = 'KLARODB."kurse.DB".AENDERUNGSDATUM'
    end
    object CourseQueryAENDERUNG_VON: TStringField
      FieldName = 'AENDERUNG_VON'
      Origin = 'KLARODB."kurse.DB".AENDERUNG_VON'
      Size = 255
    end
    object CourseQueryBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      Origin = 'KLARODB."kurse.DB".BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object CourseQueryZEIT_BEMERKUNG: TMemoField
      FieldName = 'ZEIT_BEMERKUNG'
      Origin = 'KLARODB."kurse.DB".ZEIT_BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
  end
  object TestPupilQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      
        'select'#9'p.PRUEFUNG, p.PRUEFUNGS_NUMMER, p.DATUM as DATUM_ZEIT, p.' +
        'DATUM_STRING as DATUM, p.AUFSICHT,'
      
        #9#9'ps.BESTANDEN, ps.BEMERKUNG, ps.KOSTENBETEILIGUNG, ps.BEHOERDE,' +
        ' ps.BERECHTIGUNGS_NR'
      'from'#9'PRUEFUNGEN p, PRUEFSCHUELER ps'
      'where'#9'p.ID = ps.PRUEF_ID'
      'and'#9#9'ps.SCHUELER_ID = :thePupil'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePupil'
        ParamType = ptInput
        Value = 0
      end>
  end
  object FerienQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select ANFANG, ENDE, BEZEICHNUNG'
      'from ferien'
      'order by anfang')
    Left = 320
    Top = 248
    object FerienQueryANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object FerienQueryENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object FerienQueryBEZEICHNUNG: TStringField
      FieldName = 'BEZEICHNUNG'
      Origin = 'KLARODB."ferien.DB".BEZEICHNUNG'
      Size = 255
    end
  end
  object PresenceQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select DATUM, ENTSCHULDIGT'
      'from anwesenheiten'
      'where schueler_id = :thePupil'
      'and kurs_id = :theCourse'
      'order by datum')
    Left = 312
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePupil'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptUnknown
      end>
    object PresenceQueryDATUM: TDateTimeField
      FieldName = 'DATUM'
      Origin = 'KLARODB."ANWESENHEITEN.DB".DATUM'
    end
    object PresenceQueryENTSCHULDIGT: TStringField
      FieldName = 'ENTSCHULDIGT'
      Origin = 'KLARODB."ANWESENHEITEN.DB".ENTSCHULDIGT'
      Size = 1
    end
  end
  object LEHRBUECHERTable: TTable
    DatabaseName = 'KlaroDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GRUPPE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TITEL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UNTERTITEL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VERLAG'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'LEHRBUECHERTableIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BUCH_GRUPPE_TITEL_IDX'
        Fields = 'GRUPPE;TITEL'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'LEHRBUECHER'
    Left = 104
    Top = 120
  end
  object courseBooksQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select BUCH_ID, KURS_TITEL'
      'from kursbuecher'
      'where KURS_ID = :theCourse'
      'order by BUCH_ID')
    Left = 104
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
        Value = 0
      end>
    object courseBooksQueryBUCH_ID: TIntegerField
      FieldName = 'BUCH_ID'
      Origin = 'KLARODB."kursbuecher.DB".BUCH_ID'
    end
    object courseBooksQueryKURS_TITEL: TStringField
      FieldName = 'KURS_TITEL'
      Origin = 'KLARODB."kursbuecher.DB".KURS_TITEL'
      Size = 255
    end
  end
  object PupilCourseQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9's.*,'
      #9#9'ks.ANFANG, ks.ENDE, ks.BEMERKUNG as SCHUELER_KURS_BEMERKUNG,'
      
        #9#9'ks.KOSTENBETEILIGUNG, ks.ANTRAG_KOSTENBEFREIUNG, ks.ORDNUNGSGE' +
        'MAESS,'
      #9#9'ks.FAHRTKOSTENBEWILLIGUNG, ks.SCHUELER_MODUL,'
      #9#9'ks.STORNO, ks.ANMELDE_DATUM as KURS_ANMELDE_DATUM,'
      #9#9'ks.KOSTENBEFREIUNG, ks.KURS_WECHSEL,'
      #9#9'ks.BEHOERDE, ks.BERECHTIGUNGS_NR'
      'from'#9'SCHUELER s, KURSSCHUELER ks'
      'where'#9's.ID = ks.SCHUELER_ID'
      'and'#9#9'ks.KURS_ID = :theCourse'
      ' '
      ' ')
    Left = 104
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
      end>
    object PupilCourseQueryGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
      Origin = 'KLARODB."SCHUELER.DB".GEBURTSDATUM'
    end
    object PupilCourseQueryANFANG: TDateTimeField
      FieldName = 'ANFANG'
      Origin = 'KLARODB."KURSSCHUELER.DB".ANFANG'
    end
    object PupilCourseQueryENDE: TDateTimeField
      FieldName = 'ENDE'
      Origin = 'KLARODB."KURSSCHUELER.DB".ENDE'
    end
    object PupilCourseQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."SCHUELER.DB".ID'
    end
    object PupilCourseQueryNACHNAME: TStringField
      FieldName = 'NACHNAME'
      Origin = 'KLARODB."SCHUELER.DB".NACHNAME'
      Size = 64
    end
    object PupilCourseQueryVORNAME: TStringField
      FieldName = 'VORNAME'
      Origin = 'KLARODB."SCHUELER.DB".VORNAME'
      Size = 64
    end
    object PupilCourseQueryAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
      Origin = 'KLARODB."SCHUELER.DB".AENDERUNGSDATUM'
    end
    object PupilCourseQueryAENDERUNG_VON: TStringField
      FieldName = 'AENDERUNG_VON'
      Origin = 'KLARODB."SCHUELER.DB".AENDERUNG_VON'
      Size = 255
    end
    object PupilCourseQueryANMELDE_DATUM: TDateTimeField
      FieldName = 'ANMELDE_DATUM'
      Origin = 'KLARODB."SCHUELER.DB".ANMELDE_DATUM'
    end
    object PupilCourseQueryRUECKGABE_DATUM: TDateTimeField
      FieldName = 'RUECKGABE_DATUM'
      Origin = 'KLARODB."SCHUELER.DB".RUECKGABE_DATUM'
    end
    object PupilCourseQueryTEILNEHMER_NUMMER: TStringField
      FieldName = 'TEILNEHMER_NUMMER'
      Origin = 'KLARODB."SCHUELER.DB".TEILNEHMER_NUMMER'
      Size = 255
    end
    object PupilCourseQueryANREDE: TStringField
      FieldName = 'ANREDE'
      Origin = 'KLARODB."SCHUELER.DB".ANREDE'
      Size = 32
    end
    object PupilCourseQueryGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Origin = 'KLARODB."SCHUELER.DB".GESCHLECHT'
      Size = 1
    end
    object PupilCourseQueryWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Origin = 'KLARODB."SCHUELER.DB".WOHNUNG'
      Size = 64
    end
    object PupilCourseQuerySTRASSE: TStringField
      FieldName = 'STRASSE'
      Origin = 'KLARODB."SCHUELER.DB".STRASSE'
      Size = 128
    end
    object PupilCourseQueryLAND: TStringField
      FieldName = 'LAND'
      Origin = 'KLARODB."SCHUELER.DB".LAND'
      Size = 3
    end
    object PupilCourseQueryPLZ: TStringField
      FieldName = 'PLZ'
      Origin = 'KLARODB."SCHUELER.DB".PLZ'
      Size = 16
    end
    object PupilCourseQueryORT: TStringField
      FieldName = 'ORT'
      Origin = 'KLARODB."SCHUELER.DB".ORT'
      Size = 64
    end
    object PupilCourseQueryTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Origin = 'KLARODB."SCHUELER.DB".TEL_PRIV'
      Size = 64
    end
    object PupilCourseQueryTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Origin = 'KLARODB."SCHUELER.DB".TEL_BUERO'
      Size = 64
    end
    object PupilCourseQueryTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Origin = 'KLARODB."SCHUELER.DB".TEL_MOBIL'
      Size = 64
    end
    object PupilCourseQueryTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Origin = 'KLARODB."SCHUELER.DB".TEL_FAX'
      Size = 64
    end
    object PupilCourseQueryE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'KLARODB."SCHUELER.DB".E_MAIL'
      Size = 64
    end
    object PupilCourseQueryGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Origin = 'KLARODB."SCHUELER.DB".GEBURTSORT'
      Size = 64
    end
    object PupilCourseQueryNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Origin = 'KLARODB."SCHUELER.DB".NATIONALITAET'
      Size = 64
    end
    object PupilCourseQueryAUSLAENDER_STATUS: TStringField
      FieldName = 'AUSLAENDER_STATUS'
      Origin = 'KLARODB."SCHUELER.DB".AUSLAENDER_STATUS'
      Size = 64
    end
    object PupilCourseQueryBERUF: TStringField
      FieldName = 'BERUF'
      Origin = 'KLARODB."SCHUELER.DB".BERUF'
      Size = 64
    end
    object PupilCourseQueryTAETIGKEIT: TStringField
      FieldName = 'TAETIGKEIT'
      Origin = 'KLARODB."SCHUELER.DB".TAETIGKEIT'
      Size = 64
    end
    object PupilCourseQueryWOHER: TStringField
      FieldName = 'WOHER'
      Origin = 'KLARODB."SCHUELER.DB".WOHER'
      Size = 255
    end
    object PupilCourseQueryPRUEFUNGEN: TStringField
      FieldName = 'PRUEFUNGEN'
      Origin = 'KLARODB."SCHUELER.DB".PRUEFUNGEN'
      Size = 255
    end
    object PupilCourseQueryEINSTUFUNG: TStringField
      FieldName = 'EINSTUFUNG'
      Origin = 'KLARODB."SCHUELER.DB".EINSTUFUNG'
      Size = 255
    end
    object PupilCourseQueryBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      Origin = 'KLARODB."SCHUELER.DB".BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object PupilCourseQueryISCED_LEVEL: TStringField
      FieldName = 'ISCED_LEVEL'
      Origin = 'KLARODB."SCHUELER.DB".ISCED_LEVEL'
      Size = 3
    end
    object PupilCourseQuerySCHULJAHRE: TSmallintField
      FieldName = 'SCHULJAHRE'
      Origin = 'KLARODB."SCHUELER.DB".SCHULJAHRE'
    end
    object PupilCourseQueryKURS_MODUL: TSmallintField
      FieldName = 'KURS_MODUL'
      Origin = 'KLARODB."SCHUELER.DB".KURS_MODUL'
    end
    object PupilCourseQueryKURSART: TStringField
      FieldName = 'KURSART'
      Origin = 'KLARODB."SCHUELER.DB".KURSART'
      Size = 64
    end
    object PupilCourseQuerySCHREIBFAEHIGKEIT: TSmallintField
      FieldName = 'SCHREIBFAEHIGKEIT'
      Origin = 'KLARODB."SCHUELER.DB".SCHREIBFAEHIGKEIT'
    end
    object PupilCourseQueryAUSWEIS_NUMMER: TStringField
      FieldName = 'AUSWEIS_NUMMER'
      Origin = 'KLARODB."SCHUELER.DB".AUSWEIS_NUMMER'
      Size = 255
    end
    object PupilCourseQueryBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Origin = 'KLARODB."SCHUELER.DB".BAMF_NUMMER'
      Size = 255
    end
    object PupilCourseQueryABH_NUMMER: TStringField
      FieldName = 'ABH_NUMMER'
      Origin = 'KLARODB."SCHUELER.DB".ABH_NUMMER'
      Size = 255
    end
    object PupilCourseQueryBVA_NUMMER: TStringField
      FieldName = 'BVA_NUMMER'
      Origin = 'KLARODB."SCHUELER.DB".BVA_NUMMER'
      Size = 255
    end
    object PupilCourseQueryAZ_GRUNDSICHERUNG: TStringField
      FieldName = 'AZ_GRUNDSICHERUNG'
      Origin = 'KLARODB."SCHUELER.DB".AZ_GRUNDSICHERUNG'
      Size = 255
    end
    object PupilCourseQueryABGESCHLOSSEN: TStringField
      FieldName = 'ABGESCHLOSSEN'
      Origin = 'KLARODB."SCHUELER.DB".ABGESCHLOSSEN'
      Size = 1
    end
    object PupilCourseQueryBANK_INHABER: TStringField
      FieldName = 'BANK_INHABER'
      Origin = 'KLARODB."SCHUELER.DB".BANK_INHABER'
      Size = 128
    end
    object PupilCourseQueryBANK_KONTO: TStringField
      FieldName = 'BANK_KONTO'
      Origin = 'KLARODB."SCHUELER.DB".BANK_KONTO'
      Size = 32
    end
    object PupilCourseQueryBANK_BLZ: TStringField
      FieldName = 'BANK_BLZ'
      Origin = 'KLARODB."SCHUELER.DB".BANK_BLZ'
      Size = 16
    end
    object PupilCourseQueryBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Origin = 'KLARODB."SCHUELER.DB".BANK_NAME'
      Size = 128
    end
    object PupilCourseQueryAP_NAME: TStringField
      FieldName = 'AP_NAME'
      Origin = 'KLARODB."SCHUELER.DB".AP_NAME'
      Size = 64
    end
    object PupilCourseQueryAP_VORNAME: TStringField
      FieldName = 'AP_VORNAME'
      Origin = 'KLARODB."SCHUELER.DB".AP_VORNAME'
      Size = 64
    end
    object PupilCourseQueryAP_ORGANISATION: TStringField
      FieldName = 'AP_ORGANISATION'
      Origin = 'KLARODB."SCHUELER.DB".AP_ORGANISATION'
      Size = 255
    end
    object PupilCourseQueryAP_STRASSE: TStringField
      FieldName = 'AP_STRASSE'
      Origin = 'KLARODB."SCHUELER.DB".AP_STRASSE'
      Size = 255
    end
    object PupilCourseQueryAP_PLZ: TStringField
      FieldName = 'AP_PLZ'
      Origin = 'KLARODB."SCHUELER.DB".AP_PLZ'
      Size = 16
    end
    object PupilCourseQueryAP_ORT: TStringField
      FieldName = 'AP_ORT'
      Origin = 'KLARODB."SCHUELER.DB".AP_ORT'
      Size = 255
    end
    object PupilCourseQueryAP_TELEFON: TStringField
      FieldName = 'AP_TELEFON'
      Origin = 'KLARODB."SCHUELER.DB".AP_TELEFON'
      Size = 64
    end
    object PupilCourseQueryAP_FAX: TStringField
      FieldName = 'AP_FAX'
      Origin = 'KLARODB."SCHUELER.DB".AP_FAX'
      Size = 64
    end
    object PupilCourseQueryAP_EMAIL: TStringField
      FieldName = 'AP_EMAIL'
      Origin = 'KLARODB."SCHUELER.DB".AP_EMAIL'
      Size = 255
    end
    object PupilCourseQueryAP_INFO: TStringField
      FieldName = 'AP_INFO'
      Origin = 'KLARODB."SCHUELER.DB".AP_INFO'
      Size = 255
    end
    object PupilCourseQuerySCHUELER_KURS_BEMERKUNG: TMemoField
      FieldName = 'SCHUELER_KURS_BEMERKUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".BEMERKUNG'
      BlobType = ftMemo
      Size = 32
    end
    object PupilCourseQueryKOSTENBETEILIGUNG: TStringField
      FieldName = 'KOSTENBETEILIGUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".KOSTENBETEILIGUNG'
      Size = 32
    end
    object PupilCourseQueryANTRAG_KOSTENBEFREIUNG: TStringField
      FieldName = 'ANTRAG_KOSTENBEFREIUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".ANTRAG_KOSTENBEFREIUNG'
      Size = 1
    end
    object PupilCourseQueryORDNUNGSGEMAESS: TStringField
      FieldName = 'ORDNUNGSGEMAESS'
      Origin = 'KLARODB."KURSSCHUELER.DB".ORDNUNGSGEMAESS'
      Size = 1
    end
    object PupilCourseQueryFAHRTKOSTENBEWILLIGUNG: TStringField
      FieldName = 'FAHRTKOSTENBEWILLIGUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".FAHRTKOSTENBEWILLIGUNG'
      Size = 1
    end
    object PupilCourseQuerySCHUELER_MODUL: TStringField
      FieldName = 'SCHUELER_MODUL'
      Origin = 'KLARODB."KURSSCHUELER.DB".SCHUELER_MODUL'
      Size = 32
    end
    object PupilCourseQuerySTORNO: TDateTimeField
      FieldName = 'STORNO'
      Origin = 'KLARODB."KURSSCHUELER.DB".STORNO'
    end
    object PupilCourseQueryKURS_ANMELDE_DATUM: TDateTimeField
      FieldName = 'KURS_ANMELDE_DATUM'
      Origin = 'KLARODB."KURSSCHUELER.DB".ANMELDE_DATUM'
    end
    object PupilCourseQueryKOSTENBEFREIUNG: TDateTimeField
      FieldName = 'KOSTENBEFREIUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".KOSTENBEFREIUNG'
    end
    object PupilCourseQueryKURS_WECHSEL: TStringField
      FieldName = 'KURS_WECHSEL'
      Origin = 'KLARODB."KURSSCHUELER.DB".KURS_WECHSEL'
      Size = 255
    end
    object PupilCourseQueryBEHOERDE: TStringField
      FieldName = 'BEHOERDE'
      Origin = 'KLARODB."KURSSCHUELER.DB".BEHOERDE'
      Size = 32
    end
    object PupilCourseQueryBERECHTIGUNGS_NR: TStringField
      FieldName = 'BERECHTIGUNGS_NR'
      Origin = 'KLARODB."KURSSCHUELER.DB".BERECHTIGUNGS_NR'
      Size = 255
    end
  end
  object PaymentQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select b.*'
      'from BEZAHLUNG b, KURSSCHUELER ks'
      'where b.KURS_SCHUELER_ID = ks.ID'
      'and ks.KURS_ID = :theCourse'
      'and ks.SCHUELER_ID = :thePupil'
      ' ')
    Left = 224
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end>
  end
  object LEHRERTable: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select l.*, kl.ANFANG, kl.ENDE, kl.TEAM_TEACHER, kl.SOZ_PAED'
      'from LEHRER l, KURSLEHRER kl'
      'where l.ID = kl.LEHRER_ID'
      'and kl.KURS_ID = :theCourse'
      ' ')
    Left = 104
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
      end>
  end
  object PupilQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'*'
      'from'#9'SCHUELER'
      'where'#9'ID = :thePupil'
      ' ')
    Left = 16
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end>
  end
  object CoursePupilQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'k.*,'
      #9#9'ks.ANFANG, ks.ENDE, ks.BEMERKUNG as SCHUELER_KURS_BEMERKUNG,'
      
        #9#9'ks.KOSTENBETEILIGUNG, ks.ANTRAG_KOSTENBEFREIUNG, ks.ORDNUNGSGE' +
        'MAESS,'
      #9#9'ks.FAHRTKOSTENBEWILLIGUNG, ks.SCHUELER_MODUL,'
      
        #9#9'ks.STORNO, ks.ANMELDE_DATUM, ks.KOSTENBEFREIUNG, KS.KURS_WECHS' +
        'EL,'
      #9#9'ks.BEHOERDE, ks.BERECHTIGUNGS_NR'
      'from'#9'KURSE k, KURSSCHUELER ks'
      'where'#9'k.ID = ks.KURS_ID'
      'and'#9#9'ks.SCHUELER_ID = :thePupil'
      'order by k.ANFANGS_DATUM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end>
  end
  object TestQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'*'
      'from'#9'PRUEFUNGEN'
      'where'#9'ID = :theTest'
      ' ')
    Left = 16
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'theTest'
        ParamType = ptUnknown
      end>
  end
  object PupilTestQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9's.*,'
      
        #9#9'ps.BEMERKUNG as PRUEF_BEMERKUNG, ps.BESTANDEN, ps.KOSTENBETEIL' +
        'IGUNG,'
      #9#9'ps.BEHOERDE, ps.BERECHTIGUNGS_NR'
      'from'#9'SCHUELER s, PRUEFSCHUELER ps'
      'where'#9's.ID = ps.SCHUELER_ID'
      'and'#9#9'ps.PRUEF_ID = :theTest'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'theTest'
        ParamType = ptUnknown
      end>
  end
end
