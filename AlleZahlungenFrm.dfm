object AlleZahlungenForm: TAlleZahlungenForm
  Left = 1655
  Top = 333
  Width = 676
  Height = 232
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Zahlungen'
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
    Width = 664
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
      Height = 26
      Caption = 'Export CSV'
      TabOrder = 3
      OnClick = ButtonExportClick
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 40
      Width = 112
      Height = 25
      DataSource = DataSourceZahlungen
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 4
    end
  end
  object DBGridZahlungen: TDBGrid
    Left = 0
    Top = 73
    Width = 664
    Height = 128
    Align = alClient
    DataSource = DataSourceZahlungen
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridZahlungenDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DATUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NACHNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VORNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BESCHREIBUNG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAHLUNGSART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BETRAG'
        Title.Alignment = taRightJustify
        Visible = True
      end>
  end
  object DataSourceZahlungen: TDataSource
    DataSet = QueryZahlungen
    Left = 152
    Top = 32
  end
  object QueryZahlungen: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9's.ID,'
      #9#9's.VORNAME, s.NACHNAME,'
      #9#9'k.nummer || '#39'-'#39' || k.halbjahr || '#39'-'#39' || k.jahr as KURS,'
      #9#9'b.DATUM, b.BESCHREIBUNG, b.ZAHLUNGSART, b.BETRAG'
      'from schueler s, kursschueler ks, kurse k, bezahlung b'
      'where s.id = ks.schueler_id'
      'and ks.kurs_id = k.id'
      'and ks.id = b.kurs_schueler_id'
      'and b.datum >= :startDate'
      'and b.datum < :endDate+1'
      'order by b.datum'
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
    object QueryZahlungenID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."SCHUELER.DB".ID'
      Visible = False
    end
    object QueryZahlungenDATUM: TDateTimeField
      DisplayLabel = 'Datum'
      DisplayWidth = 10
      FieldName = 'DATUM'
      Origin = 'KLARODB."BEZAHLUNG.DB".DATUM'
    end
    object QueryZahlungenNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Origin = 'KLARODB."schueler.DB".NACHNAME'
      Size = 64
    end
    object QueryZahlungenVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Origin = 'KLARODB."schueler.DB".VORNAME'
      Size = 64
    end
    object QueryZahlungenKURS: TStringField
      DisplayLabel = 'Kursnummer'
      DisplayWidth = 16
      FieldName = 'KURS'
      Origin = 'KLARODB."KURSE.DB".NUMMER'
      Size = 39
    end
    object QueryZahlungenBESCHREIBUNG: TStringField
      DisplayLabel = 'Verwendungszweck'
      DisplayWidth = 18
      FieldName = 'BESCHREIBUNG'
      Origin = 'KLARODB."BEZAHLUNG.DB".BESCHREIBUNG'
      Size = 64
    end
    object QueryZahlungenZAHLUNGSART: TStringField
      DisplayLabel = 'Zahlungsart'
      DisplayWidth = 13
      FieldName = 'ZAHLUNGSART'
      Origin = 'KLARODB."BEZAHLUNG.DB".ZAHLUNGSART'
      Size = 16
    end
    object QueryZahlungenBETRAG: TFloatField
      DisplayLabel = 'Betrag'
      FieldName = 'BETRAG'
      Origin = 'KLARODB."BEZAHLUNG.DB".BETRAG'
      currency = True
    end
  end
end
