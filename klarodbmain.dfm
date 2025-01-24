object DbConvertForm: TDbConvertForm
  Left = 1642
  Top = 352
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Klaro Datenbankverwaltung'
  ClientHeight = 264
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object UpgradeButton: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Upgrade'
    TabOrder = 0
    OnClick = UpgradeButtonClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 425
    Height = 217
    Lines.Strings = (
      
        'Erzeugen Sie mit der BDE-Verwaltung eine temporäre Datenbank "KL' +
        'ARO_OLD",'
      'die auf Ihre alten Tabellen von Klaro 1.1 verweisen muß.'
      ''
      
        'Prüfen Sie, ob die Datenbank "KLARO" auf Ihre neuen Tabellen von' +
        ' Klaro 2.0'
      'verweist.'
      ''
      
        'Nun drücken Sie auf den Schalter "Kopieren", um die Konvertierun' +
        'g Ihrer Daten zu'
      'veranlassen.'
      ''
      
        'Der Schalter "Leeren" entfernt alle vorhanden Daten aus der neue' +
        'n Datenbank.'
      ''
      
        'Um ein Backup durchführen zu können, erzeugen Sie eine Kopie der' +
        ' Tabellen und'
      
        'eine neue Datenbank "KLARO_BACKUP", die auf die Kopie verweisen ' +
        'muß.'
      ''
      
        'Nun können Sie mit dem Schalter "Backup" alle Daten von Ihrer Kl' +
        'arodatenbank'
      
        'sichern. Der Schalter "Restore" erlaubt die Wiederherstellung de' +
        'r Daten.'
      ''
      
        'Der Schalter "Entsperren" entfernt alle Sperren der neuen Datenb' +
        'ank, falls eine'
      'Arbeitsstation unerwartet beendet wurde.'
      ' ')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object EmptyButton: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Leeren'
    TabOrder = 2
    OnClick = EmptyButtonClick
  end
  object SessionButton: TButton
    Left = 360
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Entsperren'
    TabOrder = 3
    OnClick = SessionButtonClick
  end
  object BackupButton: TButton
    Left = 168
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Backup'
    TabOrder = 4
    OnClick = BackupButtonClick
  end
  object RestoreButton: TButton
    Left = 248
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Restore'
    TabOrder = 5
    OnClick = RestoreButtonClick
  end
  object KlaroOldDatabase: TDatabase
    AliasName = 'KLARO_OLD'
    DatabaseName = 'KlaroOldDB'
    Exclusive = True
    SessionName = 'Default'
    Left = 112
    Top = 16
  end
  object KlaroNewDatabase: TDatabase
    AliasName = 'KLARO'
    Connected = True
    DatabaseName = 'KlaroNewDB'
    Exclusive = True
    SessionName = 'Default'
    Left = 304
    Top = 8
  end
  object OldSchueler: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'AENDERUNGSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'ANREDE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'GESCHLECHT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NACHNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHNUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'STRASSE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LAND'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_PRIV'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_BUERO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_MOBIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_FAX'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'GEBURTSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'GEBURTSORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NATIONALITAET'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AUSLAENDER_STATUS'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BERUF'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TAETIGKEIT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRUEFUNGEN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EINSTUFUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'OldSchuelerIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'schueler_name_idx'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'SCHUELER.DB'
    Left = 24
    Top = 80
    object OldSchuelerID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldSchuelerAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
    end
    object OldSchuelerANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object OldSchuelerGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object OldSchuelerNACHNAME: TStringField
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object OldSchuelerVORNAME: TStringField
      FieldName = 'VORNAME'
      Size = 64
    end
    object OldSchuelerWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object OldSchuelerSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object OldSchuelerLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object OldSchuelerPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object OldSchuelerORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object OldSchuelerTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object OldSchuelerTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object OldSchuelerTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object OldSchuelerTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object OldSchuelerE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 64
    end
    object OldSchuelerGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object OldSchuelerGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object OldSchuelerNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object OldSchuelerAUSLAENDER_STATUS: TStringField
      FieldName = 'AUSLAENDER_STATUS'
      Size = 64
    end
    object OldSchuelerBERUF: TStringField
      FieldName = 'BERUF'
      Size = 64
    end
    object OldSchuelerTAETIGKEIT: TStringField
      FieldName = 'TAETIGKEIT'
      Size = 64
    end
    object OldSchuelerWOHER: TStringField
      FieldName = 'WOHER'
      Size = 255
    end
    object OldSchuelerPRUEFUNGEN: TStringField
      FieldName = 'PRUEFUNGEN'
      Size = 255
    end
    object OldSchuelerEINSTUFUNG: TStringField
      FieldName = 'EINSTUFUNG'
      Size = 32
    end
    object OldSchuelerBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
  end
  object OldKurs: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'JAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMMER'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ANFANGS_DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'ENDE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'UNTERRICHTSSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'WOCHENSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'TT_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'SOZ_PAED_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'KURSTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FEIERTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VORKURS'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NIVEAU'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'LEHRBUCH'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RAUM'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'KURSGEBUEHR'
        DataType = ftFloat
      end
      item
        Name = 'FOERDERUNG'
        DataType = ftFloat
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'OldKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'JAHR_NUMMER_IDX'
        Fields = 'JAHR;NUMMER'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'ANFANG_IDX'
        Fields = 'ANFANGS_DATUM'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'KURSE.DB'
    Left = 88
    Top = 80
    object OldKursID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldKursJAHR: TStringField
      FieldName = 'JAHR'
      Required = True
      Size = 4
    end
    object OldKursNUMMER: TStringField
      FieldName = 'NUMMER'
      Required = True
      Size = 32
    end
    object OldKursANFANGS_DATUM: TDateTimeField
      FieldName = 'ANFANGS_DATUM'
      Required = True
    end
    object OldKursENDE_DATUM: TDateTimeField
      FieldName = 'ENDE_DATUM'
    end
    object OldKursUNTERRICHTSSTUNDEN: TFloatField
      FieldName = 'UNTERRICHTSSTUNDEN'
    end
    object OldKursWOCHENSTUNDEN: TFloatField
      FieldName = 'WOCHENSTUNDEN'
    end
    object OldKursTT_STUNDEN: TFloatField
      FieldName = 'TT_STUNDEN'
    end
    object OldKursSOZ_PAED_STUNDEN: TFloatField
      FieldName = 'SOZ_PAED_STUNDEN'
    end
    object OldKursKURSTAGE: TStringField
      FieldName = 'KURSTAGE'
      Size = 255
    end
    object OldKursFEIERTAGE: TStringField
      FieldName = 'FEIERTAGE'
      Size = 255
    end
    object OldKursVORKURS: TStringField
      FieldName = 'VORKURS'
      Size = 32
    end
    object OldKursNIVEAU: TStringField
      FieldName = 'NIVEAU'
      Size = 32
    end
    object OldKursLEHRBUCH: TStringField
      FieldName = 'LEHRBUCH'
      Size = 64
    end
    object OldKursRAUM: TStringField
      FieldName = 'RAUM'
      Size = 32
    end
    object OldKursKURSGEBUEHR: TFloatField
      FieldName = 'KURSGEBUEHR'
    end
    object OldKursFOERDERUNG: TFloatField
      FieldName = 'FOERDERUNG'
    end
    object OldKursBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
  end
  object OldLehrer: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ANREDE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'GESCHLECHT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NACHNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHNUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'STRASSE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LAND'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_PRIV'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_BUERO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_MOBIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_FAX'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'GEBURTSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'GEBURTSORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NATIONALITAET'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AKAD_TITEL'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SV_ABSCHLUSS'
        DataType = ftDateTime
      end
      item
        Name = 'DAF_ERFAHRUNG'
        DataType = ftDateTime
      end
      item
        Name = 'EINSTIEG'
        DataType = ftDateTime
      end
      item
        Name = 'VERTRAG'
        DataType = ftDateTime
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'OldLehrerIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'lehrer_name_idx'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'LEHRER.DB'
    Left = 144
    Top = 80
    object OldLehrerID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldLehrerANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object OldLehrerGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object OldLehrerNACHNAME: TStringField
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object OldLehrerVORNAME: TStringField
      FieldName = 'VORNAME'
      Size = 64
    end
    object OldLehrerWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object OldLehrerSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object OldLehrerLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object OldLehrerPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object OldLehrerORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object OldLehrerTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object OldLehrerTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object OldLehrerTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object OldLehrerTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object OldLehrerE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 128
    end
    object OldLehrerGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object OldLehrerGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object OldLehrerNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object OldLehrerAKAD_TITEL: TStringField
      FieldName = 'AKAD_TITEL'
      Size = 32
    end
    object OldLehrerSV_ABSCHLUSS: TDateTimeField
      FieldName = 'SV_ABSCHLUSS'
    end
    object OldLehrerDAF_ERFAHRUNG: TDateTimeField
      FieldName = 'DAF_ERFAHRUNG'
    end
    object OldLehrerEINSTIEG: TDateTimeField
      FieldName = 'EINSTIEG'
    end
    object OldLehrerVERTRAG: TDateTimeField
      FieldName = 'VERTRAG'
    end
    object OldLehrerBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
  end
  object OldSchuelerKurs: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANFANG'
        DataType = ftDateTime
      end
      item
        Name = 'ENDE'
        DataType = ftDateTime
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 32
      end>
    IndexDefs = <
      item
        Name = 'OldSchuelerKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'SCHUELER_ID'
        Fields = 'SCHUELER_ID'
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end
      item
        Name = 'KURS_SCHUELER_IDX'
        Fields = 'KURS_ID;SCHUELER_ID'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'KURSSCHUELER.DB'
    Left = 32
    Top = 136
    object OldSchuelerKursID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldSchuelerKursKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object OldSchuelerKursSCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Required = True
    end
    object OldSchuelerKursANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object OldSchuelerKursENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object OldSchuelerKursBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 32
    end
  end
  object OldLehrerKurs: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'LEHRER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANFANG'
        DataType = ftDateTime
      end
      item
        Name = 'ENDE'
        DataType = ftDateTime
      end
      item
        Name = 'TEAM_TEACHER'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SOZ_PAED'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'OldLehrerKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_LEHRER_IDX'
        Fields = 'LEHRER_ID;KURS_ID'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end
      item
        Name = 'LEHRER_ID'
        Fields = 'LEHRER_ID'
      end>
    StoreDefs = True
    TableName = 'KURSLEHRER.DB'
    Left = 120
    Top = 136
    object OldLehrerKursID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldLehrerKursLEHRER_ID: TIntegerField
      FieldName = 'LEHRER_ID'
      Required = True
    end
    object OldLehrerKursKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object OldLehrerKursANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object OldLehrerKursENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object OldLehrerKursTEAM_TEACHER: TStringField
      FieldName = 'TEAM_TEACHER'
      Size = 1
    end
    object OldLehrerKursSOZ_PAED: TStringField
      FieldName = 'SOZ_PAED'
      Size = 1
    end
  end
  object OldBezahlung: TTable
    DatabaseName = 'KlaroOldDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KURS_SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'BESCHREIBUNG'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'ZAHLUNGSART'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'BETRAG'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OldBezahlungIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_SCHUELER_ID'
        Fields = 'KURS_SCHUELER_ID'
      end>
    StoreDefs = True
    TableName = 'BEZAHLUNG.DB'
    Left = 56
    Top = 192
    object OldBezahlungID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OldBezahlungKURS_SCHUELER_ID: TIntegerField
      FieldName = 'KURS_SCHUELER_ID'
      Required = True
    end
    object OldBezahlungDATUM: TDateTimeField
      FieldName = 'DATUM'
      Required = True
    end
    object OldBezahlungBESCHREIBUNG: TStringField
      FieldName = 'BESCHREIBUNG'
      Required = True
      Size = 64
    end
    object OldBezahlungZAHLUNGSART: TStringField
      FieldName = 'ZAHLUNGSART'
      Size = 16
    end
    object OldBezahlungBETRAG: TFloatField
      FieldName = 'BETRAG'
      Required = True
    end
  end
  object NewSchueler: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'AENDERUNGSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'ANMELDE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'TEILNEHMER_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ANREDE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'GESCHLECHT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NACHNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHNUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'STRASSE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LAND'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_PRIV'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_BUERO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_MOBIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_FAX'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'GEBURTSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'GEBURTSORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NATIONALITAET'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AUSLAENDER_STATUS'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BERUF'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TAETIGKEIT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRUEFUNGEN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EINSTUFUNG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end
      item
        Name = 'ISCED_LEVEL'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'SCHULJAHRE'
        DataType = ftSmallint
      end
      item
        Name = 'KURS_MODUL'
        DataType = ftSmallint
      end
      item
        Name = 'KURSART'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SCHREIBFAEHIGKEIT'
        DataType = ftSmallint
      end
      item
        Name = 'AUSWEIS_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ABH_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BVA_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AZ_GRUNDSICHERUNG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ABGESCHLOSSEN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BANK_INHABER'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'BANK_KONTO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'BANK_BLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'BANK_NAME'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <
      item
        Name = 'NewSchuelerIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'schueler_name_idx'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'SCHUELER.DB'
    Left = 264
    Top = 80
    object NewSchuelerID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewSchuelerAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
    end
    object NewSchuelerANMELDE_DATUM: TDateTimeField
      FieldName = 'ANMELDE_DATUM'
    end
    object NewSchuelerANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object NewSchuelerGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object NewSchuelerNACHNAME: TStringField
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object NewSchuelerVORNAME: TStringField
      FieldName = 'VORNAME'
      Size = 64
    end
    object NewSchuelerWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object NewSchuelerSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object NewSchuelerLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object NewSchuelerPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object NewSchuelerORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object NewSchuelerTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object NewSchuelerTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object NewSchuelerTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object NewSchuelerTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object NewSchuelerE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 64
    end
    object NewSchuelerGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object NewSchuelerGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object NewSchuelerNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object NewSchuelerAUSLAENDER_STATUS: TStringField
      FieldName = 'AUSLAENDER_STATUS'
      Size = 64
    end
    object NewSchuelerBERUF: TStringField
      FieldName = 'BERUF'
      Size = 64
    end
    object NewSchuelerTAETIGKEIT: TStringField
      FieldName = 'TAETIGKEIT'
      Size = 64
    end
    object NewSchuelerWOHER: TStringField
      FieldName = 'WOHER'
      Size = 255
    end
    object NewSchuelerPRUEFUNGEN: TStringField
      FieldName = 'PRUEFUNGEN'
      Size = 255
    end
    object NewSchuelerEINSTUFUNG: TStringField
      FieldName = 'EINSTUFUNG'
      Size = 255
    end
    object NewSchuelerBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object NewSchuelerISCED_LEVEL: TStringField
      FieldName = 'ISCED_LEVEL'
      Size = 3
    end
    object NewSchuelerSCHULJAHRE: TSmallintField
      FieldName = 'SCHULJAHRE'
    end
    object NewSchuelerKURS_MODUL: TSmallintField
      FieldName = 'KURS_MODUL'
    end
    object NewSchuelerKURSART: TStringField
      FieldName = 'KURSART'
      Size = 64
    end
    object NewSchuelerSCHREIBFAEHIGKEIT: TSmallintField
      FieldName = 'SCHREIBFAEHIGKEIT'
    end
    object NewSchuelerAUSWEIS_NUMMER: TStringField
      FieldName = 'AUSWEIS_NUMMER'
      Size = 255
    end
    object NewSchuelerBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 255
    end
    object NewSchuelerABH_NUMMER: TStringField
      FieldName = 'ABH_NUMMER'
      Size = 255
    end
    object NewSchuelerBVA_NUMMER: TStringField
      FieldName = 'BVA_NUMMER'
      Size = 255
    end
    object NewSchuelerAZ_GRUNDSICHERUNG: TStringField
      FieldName = 'AZ_GRUNDSICHERUNG'
      Size = 255
    end
    object NewSchuelerABGESCHLOSSEN: TStringField
      FieldName = 'ABGESCHLOSSEN'
      Size = 1
    end
    object NewSchuelerTEILNEHMER_NUMMER: TStringField
      FieldName = 'TEILNEHMER_NUMMER'
      Size = 255
    end
    object NewSchuelerBANK_INHABER: TStringField
      FieldName = 'BANK_INHABER'
      Size = 128
    end
    object NewSchuelerBANK_KONTO: TStringField
      FieldName = 'BANK_KONTO'
      Size = 32
    end
    object NewSchuelerBANK_BLZ: TStringField
      FieldName = 'BANK_BLZ'
      Size = 16
    end
    object NewSchuelerBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 128
    end
  end
  object NewKurs: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'JAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'HALBJAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMMER'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ANFANGS_DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'ENDE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'UNTERRICHTSSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'WOCHENSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'TT_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'SOZ_PAED_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'KURSTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FEIERTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KURSART'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'KURSTYP'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'KURSABSCHNITT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'VORKURS'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NIVEAU'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'LEHRBUCH'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RAUM'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'UMSATZSTEUER'
        DataType = ftFloat
      end
      item
        Name = 'KURSGEBUEHR'
        DataType = ftFloat
      end
      item
        Name = 'FOERDERUNG'
        DataType = ftFloat
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end
      item
        Name = 'MO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MO_END'
        DataType = ftDateTime
      end
      item
        Name = 'MO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MO_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'DI_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DI_END'
        DataType = ftDateTime
      end
      item
        Name = 'DI_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DI_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'MI_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MI_END'
        DataType = ftDateTime
      end
      item
        Name = 'MI_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MI_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'DO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DO_END'
        DataType = ftDateTime
      end
      item
        Name = 'DO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DO_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'FR_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'FR_END'
        DataType = ftDateTime
      end
      item
        Name = 'FR_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'FR_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'SA_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SA_END'
        DataType = ftDateTime
      end
      item
        Name = 'SA_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SA_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'SO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SO_END'
        DataType = ftDateTime
      end
      item
        Name = 'SO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SO_PAUS_END'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'NewKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_ANFANG_IDX'
        Fields = 'ANFANGS_DATUM'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'JAHR_NUMMER_IDX'
        Fields = 'JAHR;NUMMER'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'KURSE.DB'
    Left = 328
    Top = 80
    object NewKursID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewKursJAHR: TStringField
      FieldName = 'JAHR'
      Required = True
      Size = 4
    end
    object NewKursNUMMER: TStringField
      FieldName = 'NUMMER'
      Required = True
      Size = 32
    end
    object NewKursANFANGS_DATUM: TDateTimeField
      FieldName = 'ANFANGS_DATUM'
      Required = True
    end
    object NewKursENDE_DATUM: TDateTimeField
      FieldName = 'ENDE_DATUM'
    end
    object NewKursUNTERRICHTSSTUNDEN: TFloatField
      FieldName = 'UNTERRICHTSSTUNDEN'
    end
    object NewKursWOCHENSTUNDEN: TFloatField
      FieldName = 'WOCHENSTUNDEN'
    end
    object NewKursTT_STUNDEN: TFloatField
      FieldName = 'TT_STUNDEN'
    end
    object NewKursSOZ_PAED_STUNDEN: TFloatField
      FieldName = 'SOZ_PAED_STUNDEN'
    end
    object NewKursKURSTAGE: TStringField
      FieldName = 'KURSTAGE'
      Size = 255
    end
    object NewKursFEIERTAGE: TStringField
      FieldName = 'FEIERTAGE'
      Size = 255
    end
    object NewKursKURSART: TStringField
      FieldName = 'KURSART'
      Size = 64
    end
    object NewKursKURSTYP: TStringField
      FieldName = 'KURSTYP'
      Size = 32
    end
    object NewKursKURSABSCHNITT: TStringField
      FieldName = 'KURSABSCHNITT'
      Size = 32
    end
    object NewKursVORKURS: TStringField
      FieldName = 'VORKURS'
      Size = 32
    end
    object NewKursNIVEAU: TStringField
      FieldName = 'NIVEAU'
      Size = 32
    end
    object NewKursLEHRBUCH: TStringField
      FieldName = 'LEHRBUCH'
      Size = 64
    end
    object NewKursRAUM: TStringField
      FieldName = 'RAUM'
      Size = 32
    end
    object NewKursUMSATZSTEUER: TFloatField
      FieldName = 'UMSATZSTEUER'
    end
    object NewKursKURSGEBUEHR: TFloatField
      FieldName = 'KURSGEBUEHR'
    end
    object NewKursFOERDERUNG: TFloatField
      FieldName = 'FOERDERUNG'
    end
    object NewKursBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object NewKursMO_ANF: TDateTimeField
      FieldName = 'MO_ANF'
    end
    object NewKursMO_END: TDateTimeField
      FieldName = 'MO_END'
    end
    object NewKursMO_PAUS_ANF: TDateTimeField
      FieldName = 'MO_PAUS_ANF'
    end
    object NewKursMO_PAUS_END: TDateTimeField
      FieldName = 'MO_PAUS_END'
    end
    object NewKursDI_ANF: TDateTimeField
      FieldName = 'DI_ANF'
    end
    object NewKursDI_END: TDateTimeField
      FieldName = 'DI_END'
    end
    object NewKursDI_PAUS_ANF: TDateTimeField
      FieldName = 'DI_PAUS_ANF'
    end
    object NewKursDI_PAUS_END: TDateTimeField
      FieldName = 'DI_PAUS_END'
    end
    object NewKursMI_ANF: TDateTimeField
      FieldName = 'MI_ANF'
    end
    object NewKursMI_END: TDateTimeField
      FieldName = 'MI_END'
    end
    object NewKursMI_PAUS_ANF: TDateTimeField
      FieldName = 'MI_PAUS_ANF'
    end
    object NewKursMI_PAUS_END: TDateTimeField
      FieldName = 'MI_PAUS_END'
    end
    object NewKursDO_ANF: TDateTimeField
      FieldName = 'DO_ANF'
    end
    object NewKursDO_END: TDateTimeField
      FieldName = 'DO_END'
    end
    object NewKursDO_PAUS_ANF: TDateTimeField
      FieldName = 'DO_PAUS_ANF'
    end
    object NewKursDO_PAUS_END: TDateTimeField
      FieldName = 'DO_PAUS_END'
    end
    object NewKursFR_ANF: TDateTimeField
      FieldName = 'FR_ANF'
    end
    object NewKursFR_END: TDateTimeField
      FieldName = 'FR_END'
    end
    object NewKursFR_PAUS_ANF: TDateTimeField
      FieldName = 'FR_PAUS_ANF'
    end
    object NewKursFR_PAUS_END: TDateTimeField
      FieldName = 'FR_PAUS_END'
    end
    object NewKursSA_ANF: TDateTimeField
      FieldName = 'SA_ANF'
    end
    object NewKursSA_END: TDateTimeField
      FieldName = 'SA_END'
    end
    object NewKursSA_PAUS_ANF: TDateTimeField
      FieldName = 'SA_PAUS_ANF'
    end
    object NewKursSA_PAUS_END: TDateTimeField
      FieldName = 'SA_PAUS_END'
    end
    object NewKursSO_ANF: TDateTimeField
      FieldName = 'SO_ANF'
    end
    object NewKursSO_END: TDateTimeField
      FieldName = 'SO_END'
    end
    object NewKursSO_PAUS_ANF: TDateTimeField
      FieldName = 'SO_PAUS_ANF'
    end
    object NewKursSO_PAUS_END: TDateTimeField
      FieldName = 'SO_PAUS_END'
    end
    object NewKursHALBJAHR: TStringField
      FieldName = 'HALBJAHR'
      Required = True
      Size = 1
    end
    object NewKursBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 32
    end
  end
  object NewLehrer: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANREDE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'GESCHLECHT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NACHNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHNUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'STRASSE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LAND'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_PRIV'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_BUERO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_MOBIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_FAX'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'GEBURTSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'GEBURTSORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NATIONALITAET'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AKAD_TITEL'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SV_ABSCHLUSS'
        DataType = ftDateTime
      end
      item
        Name = 'DAF_ERFAHRUNG'
        DataType = ftDateTime
      end
      item
        Name = 'EINSTIEG'
        DataType = ftDateTime
      end
      item
        Name = 'VERTRAG'
        DataType = ftDateTime
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'NewLehrerIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'lehrer_name_idx'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'LEHRER.DB'
    Left = 384
    Top = 80
    object NewLehrerID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewLehrerANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object NewLehrerGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object NewLehrerNACHNAME: TStringField
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object NewLehrerVORNAME: TStringField
      FieldName = 'VORNAME'
      Size = 64
    end
    object NewLehrerWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object NewLehrerSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object NewLehrerLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object NewLehrerPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object NewLehrerORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object NewLehrerTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object NewLehrerTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object NewLehrerTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object NewLehrerTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object NewLehrerE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 128
    end
    object NewLehrerGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object NewLehrerGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object NewLehrerNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object NewLehrerAKAD_TITEL: TStringField
      FieldName = 'AKAD_TITEL'
      Size = 32
    end
    object NewLehrerSV_ABSCHLUSS: TDateTimeField
      FieldName = 'SV_ABSCHLUSS'
    end
    object NewLehrerDAF_ERFAHRUNG: TDateTimeField
      FieldName = 'DAF_ERFAHRUNG'
    end
    object NewLehrerEINSTIEG: TDateTimeField
      FieldName = 'EINSTIEG'
    end
    object NewLehrerVERTRAG: TDateTimeField
      FieldName = 'VERTRAG'
    end
    object NewLehrerBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 64
    end
    object NewLehrerBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
  end
  object NewSchuelerKurs: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANFANG'
        DataType = ftDateTime
      end
      item
        Name = 'ENDE'
        DataType = ftDateTime
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 32
      end
      item
        Name = 'KOSTENBETEILIGUNG'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ANTRAG_KOSTENBEFREIUNG'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ORDNUNGSGEMAESS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FAHRTKOSTENBEWILLIGUNG'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NewSchuelerKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'SCHUELER_ID'
        Fields = 'SCHUELER_ID'
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end
      item
        Name = 'KURS_SCHUELER_IDX'
        Fields = 'KURS_ID;SCHUELER_ID'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'KURSSCHUELER.DB'
    Left = 272
    Top = 136
    object NewSchuelerKursID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewSchuelerKursKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object NewSchuelerKursSCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Required = True
    end
    object NewSchuelerKursANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object NewSchuelerKursENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object NewSchuelerKursBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 32
    end
    object NewSchuelerKursKOSTENBETEILIGUNG: TStringField
      FieldName = 'KOSTENBETEILIGUNG'
      Size = 32
    end
    object NewSchuelerKursANTRAG_KOSTENBEFREIUNG: TStringField
      FieldName = 'ANTRAG_KOSTENBEFREIUNG'
      Size = 1
    end
    object NewSchuelerKursORDNUNGSGEMAESS: TStringField
      FieldName = 'ORDNUNGSGEMAESS'
      Size = 1
    end
    object NewSchuelerKursFAHRTKOSTENBEWILLIGUNG: TStringField
      FieldName = 'FAHRTKOSTENBEWILLIGUNG'
      Size = 1
    end
  end
  object NewLehrerKurs: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LEHRER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANFANG'
        DataType = ftDateTime
      end
      item
        Name = 'ENDE'
        DataType = ftDateTime
      end
      item
        Name = 'TEAM_TEACHER'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SOZ_PAED'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NewLehrerKursIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_LEHRER_IDX'
        Fields = 'LEHRER_ID;KURS_ID'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end
      item
        Name = 'LEHRER_ID'
        Fields = 'LEHRER_ID'
      end>
    StoreDefs = True
    TableName = 'KURSLEHRER.DB'
    Left = 384
    Top = 136
    object NewLehrerKursID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewLehrerKursLEHRER_ID: TIntegerField
      FieldName = 'LEHRER_ID'
      Required = True
    end
    object NewLehrerKursKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object NewLehrerKursANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object NewLehrerKursENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object NewLehrerKursTEAM_TEACHER: TStringField
      FieldName = 'TEAM_TEACHER'
      Size = 1
    end
    object NewLehrerKursSOZ_PAED: TStringField
      FieldName = 'SOZ_PAED'
      Size = 1
    end
  end
  object NewBezahlung: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'BESCHREIBUNG'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'ZAHLUNGSART'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'BETRAG'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'NewBezahlungIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_SCHUELER_ID'
        Fields = 'KURS_SCHUELER_ID'
      end>
    StoreDefs = True
    TableName = 'BEZAHLUNG.DB'
    Left = 288
    Top = 192
    object NewBezahlungID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewBezahlungKURS_SCHUELER_ID: TIntegerField
      FieldName = 'KURS_SCHUELER_ID'
      Required = True
    end
    object NewBezahlungDATUM: TDateTimeField
      FieldName = 'DATUM'
      Required = True
    end
    object NewBezahlungBESCHREIBUNG: TStringField
      FieldName = 'BESCHREIBUNG'
      Required = True
      Size = 64
    end
    object NewBezahlungZAHLUNGSART: TStringField
      FieldName = 'ZAHLUNGSART'
      Size = 16
    end
    object NewBezahlungBETRAG: TFloatField
      FieldName = 'BETRAG'
      Required = True
    end
  end
  object NewFerien: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ANFANG'
        DataType = ftDateTime
      end
      item
        Name = 'ENDE'
        DataType = ftDateTime
      end
      item
        Name = 'BEZEICHNUNG'
        DataType = ftString
        Size = 255
      end>
    StoreDefs = True
    TableName = 'FERIEN.db'
    Left = 376
    Top = 200
    object NewFerienANFANG: TDateTimeField
      FieldName = 'ANFANG'
    end
    object NewFerienENDE: TDateTimeField
      FieldName = 'ENDE'
    end
    object NewFerienBEZEICHNUNG: TStringField
      FieldName = 'BEZEICHNUNG'
      Size = 255
    end
  end
  object NewKursbuecher: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUCH_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'NewKursbuecherIndex1'
        Fields = 'KURS_ID;BUCH_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BUCH_ID'
        Fields = 'BUCH_ID'
      end>
    StoreDefs = True
    TableName = 'KURSBUECHER.DB'
    Left = 456
    Top = 200
    object NewKursbuecherKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object NewKursbuecherBUCH_ID: TIntegerField
      FieldName = 'BUCH_ID'
      Required = True
    end
  end
  object NewAnwesenheiten: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'ENTSCHULDIGT'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NewAnwesenheitenIndex1'
        Fields = 'SCHUELER_ID;KURS_ID;DATUM'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end>
    StoreDefs = True
    TableName = 'ANWESENHEITEN.DB'
    Left = 472
    Top = 128
    object NewAnwesenheitenSCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Required = True
    end
    object NewAnwesenheitenKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object NewAnwesenheitenDATUM: TDateTimeField
      FieldName = 'DATUM'
    end
    object NewAnwesenheitenENTSCHULDIGT: TStringField
      FieldName = 'ENTSCHULDIGT'
      Size = 1
    end
  end
  object NewPruefschueler: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRUEF_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 32
      end
      item
        Name = 'BESTANDEN'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NewPruefschuelerIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PRUEF_ID'
        Fields = 'PRUEF_ID'
      end
      item
        Name = 'SCHUELER_ID'
        Fields = 'SCHUELER_ID'
      end
      item
        Name = 'KURS_SCHUELER_IDX'
        Fields = 'PRUEF_ID;SCHUELER_ID'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'PRUEFSCHUELER.DB'
    Left = 472
    Top = 64
    object NewPruefschuelerID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object NewPruefschuelerPRUEF_ID: TIntegerField
      FieldName = 'PRUEF_ID'
      Required = True
    end
    object NewPruefschuelerSCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Required = True
    end
    object NewPruefschuelerBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 32
    end
    object NewPruefschuelerBESTANDEN: TStringField
      FieldName = 'BESTANDEN'
      Size = 1
    end
  end
  object NewPruefungen: TTable
    DatabaseName = 'KlaroNewDB'
    TableName = 'PRUEFUNGEN.DB'
    Left = 472
    Top = 16
  end
  object delSessionQuery: TQuery
    DatabaseName = 'KlaroNewDB'
    SQL.Strings = (
      'delete from CONFIG'
      'where ENTRY_NAME like '#39'session%'#39
      'or ENTRY_NAME like '#39'lock%'#39)
    Left = 208
    Top = 184
  end
  object KlaroBackupDatabase: TDatabase
    AliasName = 'KLARO_BACKUP'
    DatabaseName = 'KlaroBackupDB'
    SessionName = 'Default'
    Left = 208
    Top = 16
  end
  object NewLehrzeiten: TTable
    DatabaseName = 'KlaroNewDB'
    FieldDefs = <
      item
        Name = 'SCHUELER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'KURS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'ENTSCHULDIGT'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NewAnwesenheitenIndex1'
        Fields = 'SCHUELER_ID;KURS_ID;DATUM'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KURS_ID'
        Fields = 'KURS_ID'
      end>
    StoreDefs = True
    TableName = 'LEHRZEITEN.DB'
    Left = 456
    Top = 256
    object IntegerField1: TIntegerField
      FieldName = 'SCHUELER_ID'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'KURS_ID'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATUM'
    end
    object StringField1: TStringField
      FieldName = 'ENTSCHULDIGT'
      Size = 1
    end
  end
end
