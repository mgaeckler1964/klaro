object AlleLehrzeitenForm: TAlleLehrzeitenForm
  Left = 1462
  Top = 216
  Width = 698
  Height = 232
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
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 19
      Height = 13
      Caption = 'Von'
    end
    object Label2: TLabel
      Left = 144
      Top = 8
      Width = 17
      Height = 13
      Caption = 'Bis:'
    end
    object DateTimePickerStart: TDateTimePicker
      Left = 32
      Top = 8
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 40007
      Time = 40007
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DateTimePickerEnd: TDateTimePicker
      Left = 168
      Top = 8
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 40007.4244943518
      Time = 40007.4244943518
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object ButtonStart: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 2
      OnClick = ButtonStartClick
    end
    object ButtonExport: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export CSV'
      TabOrder = 3
      OnClick = ButtonExportClick
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 40
      Width = 112
      Height = 25
      DataSource = DataSourceLehrzeiten
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 4
    end
  end
  object DBGridZahlungen: TDBGrid
    Left = 0
    Top = 73
    Width = 686
    Height = 128
    Align = alClient
    DataSource = DataSourceLehrzeiten
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSourceLehrzeiten: TDataSource
    DataSet = QueryLehrzeiten
    Left = 152
    Top = 32
  end
  object QueryLehrzeiten: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'l.ID as LEHRER_ID,'
      #9#9'l.NACHNAME, l.VORNAME,'
      #9#9'k.nummer || '#39'-'#39' || k.halbjahr || '#39'-'#39' || k.jahr as KURS,'
      #9#9'lz.DATUM,'
      #9#9'lz.START_ZEIT, lz.ENDE_ZEIT, lz.PAUSE_ANFANG, lz.PAUSE_ENDE'
      'from'#9'lehrer l, kurslehrer kl, kurse k, lehrzeiten lz'
      'where'#9'l.ID = kl.lehrer_id'
      'and'#9#9'kl.kurs_id = k.ID'
      'and'#9#9'kl.ID = lz.lehrer_kurs_id'
      'and'#9#9'lz.datum >= :startDate'
      'and'#9#9'lz.datum < :endDate+1'
      'order by 2, 3, 1, 4, 5'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 224
    Top = 32
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'startDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'endDate+1'
        ParamType = ptInput
      end>
    object QueryLehrzeitenLEHRER_ID: TIntegerField
      FieldName = 'LEHRER_ID'
      Origin = 'KLARODB."lehrer.DB".ID'
      Visible = False
    end
    object QueryLehrzeitenNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Origin = 'KLARODB."LEHRER.DB".NACHNAME'
      Size = 64
    end
    object QueryLehrzeitenVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Origin = 'KLARODB."LEHRER.DB".VORNAME'
      Size = 64
    end
    object QueryLehrzeitenKURS: TStringField
      DisplayLabel = 'Kursnummer'
      DisplayWidth = 16
      FieldName = 'KURS'
      Origin = 'KLARODB."KURSE.DB".NUMMER'
      Size = 39
    end
    object QueryLehrzeitenDATUM: TDateTimeField
      DisplayLabel = 'Datum'
      DisplayWidth = 10
      FieldName = 'DATUM'
      Origin = 'KLARODB."LEHRZEITEN.DB".DATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object QueryLehrzeitenSTART_ZEIT: TDateTimeField
      DisplayLabel = 'Anfang'
      DisplayWidth = 10
      FieldName = 'START_ZEIT'
      Origin = 'KLARODB."LEHRZEITEN.DB".START_ZEIT'
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenENDE_ZEIT: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE_ZEIT'
      Origin = 'KLARODB."LEHRZEITEN.DB".ENDE_ZEIT'
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenPAUSE_ANFANG: TDateTimeField
      DisplayLabel = 'Pause Anfang'
      DisplayWidth = 10
      FieldName = 'PAUSE_ANFANG'
      Origin = 'KLARODB."LEHRZEITEN.DB".PAUSE_ANFANG'
      DisplayFormat = 'hh:nn'
    end
    object QueryLehrzeitenPAUSE_ENDE: TDateTimeField
      DisplayLabel = 'Pause Ende'
      DisplayWidth = 10
      FieldName = 'PAUSE_ENDE'
      Origin = 'KLARODB."LEHRZEITEN.DB".PAUSE_ENDE'
      DisplayFormat = 'hh:nn'
    end
  end
end
