object LehrzeitenForm: TLehrzeitenForm
  Left = 1577
  Top = 245
  Width = 600
  Height = 261
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Lehrzeiten'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 588
    Height = 189
    Align = alClient
    DataSource = DataSourceLehrzeiten
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSourceLehrzeiten
      TabOrder = 0
    end
  end
  object QueryLehrzeiten: TQuery
    CachedUpdates = True
    BeforeClose = QueryLehrzeitenBeforeClose
    AfterInsert = QueryLehrzeitenAfterInsert
    BeforePost = QueryLehrzeitenBeforePost
    AfterPost = QueryLehrzeitenAfterPost
    AfterDelete = QueryLehrzeitenAfterDelete
    DatabaseName = 'KlaroDB'
    RequestLive = True
    SQL.Strings = (
      'select'#9'lz.ID, lz.LEHRER_KURS_ID,'
      
        #9#9'lz.DATUM, l.NACHNAME || '#39', '#39' || l.VORNAME as NAME, lz.START_ZE' +
        'IT, lz.ENDE_ZEIT, lz.PAUSE_ANFANG, lz.PAUSE_ENDE'
      'from'#9'LEHRZEITEN lz, KURSLEHRER kl, LEHRER l'
      'where'#9'lz.LEHRER_KURS_ID = kl.ID'
      'and'#9#9'kl.KURS_ID = :theCourseId'
      'and'#9#9'kl.LEHRER_ID = l.ID'
      'order by lz.DATUM, lz.START_ZEIT, lz.ENDE_ZEIT'
      ''
      ' ')
    UpdateObject = UpdateSQLLehrzeiten
    Left = 112
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourseId'
        ParamType = ptInput
        Value = 0
      end>
    object QueryLehrzeitenID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."LEHRZEITEN.DB".ID'
      Required = True
      Visible = False
    end
    object QueryLehrzeitenLEHRER_KURS_ID: TIntegerField
      FieldName = 'LEHRER_KURS_ID'
      Origin = 'KLARODB."LEHRZEITEN.DB".LEHRER_KURS_ID'
      Required = True
      Visible = False
    end
    object QueryLehrzeitenDATUM: TDateTimeField
      DisplayLabel = 'Datum'
      DisplayWidth = 10
      FieldName = 'DATUM'
      Origin = 'KLARODB."LEHRZEITEN.DB".DATUM'
      Required = True
      DisplayFormat = 'd.m.yyyy'
    end
    object QueryLehrzeitenNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 32
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = QueryTeacher
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'LEHRER_KURS_ID'
      Origin = 'KLARODB."LEHRER.DB".NACHNAME'
      Size = 130
      Lookup = True
    end
    object QueryLehrzeitenSTART_ZEIT: TDateTimeField
      DisplayLabel = 'Anfang'
      DisplayWidth = 10
      FieldName = 'START_ZEIT'
      Origin = 'KLARODB."LEHRZEITEN.DB".START_ZEIT'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenENDE_ZEIT: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE_ZEIT'
      Origin = 'KLARODB."LEHRZEITEN.DB".ENDE_ZEIT'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenPAUSE_ANFANG: TDateTimeField
      DisplayLabel = 'Pause Anfang'
      DisplayWidth = 10
      FieldName = 'PAUSE_ANFANG'
      Origin = 'KLARODB."LEHRZEITEN.DB".PAUSE_ANFANG'
      Required = True
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenPAUSE_ENDE: TDateTimeField
      DisplayLabel = 'Pause Ende'
      DisplayWidth = 10
      FieldName = 'PAUSE_ENDE'
      Origin = 'KLARODB."LEHRZEITEN.DB".PAUSE_ENDE'
      Required = True
      DisplayFormat = 'hh:nn'
    end
  end
  object DataSourceLehrzeiten: TDataSource
    DataSet = QueryLehrzeiten
    Left = 16
    Top = 48
  end
  object QueryTeacher: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'kl.ID, l.NACHNAME || '#39', '#39' || l.VORNAME as NAME'
      'from    KURSLEHRER kl, LEHRER l'
      'where'#9'kl.LEHRER_ID = l.ID'
      'and'#9#9'kl.KURS_ID = :theCourse')
    Left = 112
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
        Value = 0
      end>
  end
  object UpdateSQLLehrzeiten: TUpdateSQL
    ModifySQL.Strings = (
      'update LEHRZEITEN'
      'set'
      '  LEHRER_KURS_ID = :LEHRER_KURS_ID,'
      '  DATUM = :DATUM,'
      '  START_ZEIT = :START_ZEIT,'
      '  ENDE_ZEIT = :ENDE_ZEIT,'
      '  PAUSE_ANFANG = :PAUSE_ANFANG,'
      '  PAUSE_ENDE = :PAUSE_ENDE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LEHRZEITEN'
      
        '  (ID, LEHRER_KURS_ID, DATUM, START_ZEIT, ENDE_ZEIT, PAUSE_ANFAN' +
        'G, '
      'PAUSE_ENDE)'
      'values'
      '  (:ID, :LEHRER_KURS_ID, :DATUM, :START_ZEIT, :ENDE_ZEIT, '
      ':PAUSE_ANFANG, '
      '   :PAUSE_ENDE)')
    DeleteSQL.Strings = (
      'delete from LEHRZEITEN'
      'where'
      '  ID = :OLD_ID')
    Left = 216
    Top = 48
  end
end
