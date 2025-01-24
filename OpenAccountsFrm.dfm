object OpenAccountsForm: TOpenAccountsForm
  Left = 1495
  Top = 536
  Width = 548
  Height = 266
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Offene Zahlungen'
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
    Width = 536
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
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 40
      Width = 100
      Height = 25
      DataSource = DataSourceQueryOpen
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object ButtonStart: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 3
      OnClick = ButtonStartClick
    end
  end
  object DBGridOpenAccounts: TDBGrid
    Left = 0
    Top = 73
    Width = 536
    Height = 162
    Align = alClient
    DataSource = DataSourceQueryOpen
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridOpenAccountsDblClick
    Columns = <
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
        FieldName = 'KURSGEBUEHR'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BEZAHLT'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REST'
        Title.Alignment = taRightJustify
        Visible = True
      end>
  end
  object QueryOpenAccount: TQuery
    OnCalcFields = QueryOpenAccountCalcFields
    DatabaseName = 'KlaroDB'
    Filtered = True
    OnFilterRecord = QueryOpenAccountFilterRecord
    SQL.Strings = (
      'SELECT  schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      #9#9'kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR,'
      #9#9'kurse.KURSGEBUEHR,'
      #9#9'sum(bezahlung.betrag) as BEZAHLT'
      'FROM'#9'Kursschueler, schueler, bezahlung, kurse'
      'WHERE'#9'Kursschueler.schueler_ID = schueler.ID'
      'and'#9#9'kursschueler.id = bezahlung.kurs_schueler_id'
      'and'#9#9'bezahlung.beschreibung = '#39'Kursgebühr'#39
      'and'#9#9'Kursschueler.kurs_id = kurse.id'
      'and'#9#9'kurse.anfangs_datum >= :startDate1'
      'and'#9#9'kurse.anfangs_datum <= :endDate1'
      'group by schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      #9#9'kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR,'
      #9#9'kurse.KURSGEBUEHR'
      'having  kurse.KURSGEBUEHR <> sum(bezahlung.betrag)'
      'union'
      'SELECT  schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      #9#9'kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR,'
      #9#9'kurse.KURSGEBUEHR,'
      #9#9'0 as BEZAHLT'
      'FROM'#9'Kursschueler, schueler, kurse'
      'WHERE'#9'Kursschueler.schueler_ID = schueler.ID'
      'and'#9#9'Kursschueler.kurs_id = kurse.id'
      'and'#9#9'kurse.kursgebuehr <> 0'
      'and'#9#9'kurse.anfangs_datum >= :startDate2'
      'and'#9#9'kurse.anfangs_datum <= :endDate2'
      'and'#9#9'not exists ('
      #9#9#9'select'#9'*'
      #9#9#9'from'#9'bezahlung'
      #9#9#9'where'#9'kursschueler.id = bezahlung.kurs_schueler_id'
      #9#9#9'and'#9#9'bezahlung.beschreibung = '#39'Kursgebühr'#39
      #9#9')'
      'order by 2, 3, 6, 5, 4')
    Left = 144
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'startDate1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'endDate1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'startDate2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'endDate2'
        ParamType = ptUnknown
      end>
    object QueryOpenAccountNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Size = 64
    end
    object QueryOpenAccountVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Size = 64
    end
    object QueryOpenAccountKURS: TStringField
      DisplayLabel = 'Kursnummer'
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'KURS'
      Size = 64
      Calculated = True
    end
    object QueryOpenAccountNUMMER: TStringField
      DisplayWidth = 16
      FieldName = 'NUMMER'
      Visible = False
      Size = 32
    end
    object QueryOpenAccountHALBJAHR: TStringField
      FieldName = 'HALBJAHR'
      Visible = False
      Size = 1
    end
    object QueryOpenAccountJAHR: TStringField
      FieldName = 'JAHR'
      Visible = False
      Size = 4
    end
    object QueryOpenAccountKURSGEBUEHR: TFloatField
      DisplayLabel = 'Kursgebühr'
      FieldName = 'KURSGEBUEHR'
      currency = True
    end
    object QueryOpenAccountBEZAHLT: TFloatField
      DisplayLabel = 'Bezahlt'
      FieldName = 'BEZAHLT'
      currency = True
    end
    object QueryOpenAccountREST: TFloatField
      DisplayLabel = 'Rest'
      FieldKind = fkCalculated
      FieldName = 'REST'
      currency = True
      Calculated = True
    end
  end
  object DataSourceQueryOpen: TDataSource
    DataSet = QueryOpenAccount
    Left = 24
    Top = 80
  end
end
