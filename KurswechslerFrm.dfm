object KurswechslerForm: TKurswechslerForm
  Left = 1446
  Top = 429
  Width = 579
  Height = 279
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Kurswechsler'
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
    Width = 567
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 112
      Height = 25
      DataSource = KurswechslerDataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object ButtonExport: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export CSV'
      TabOrder = 1
      OnClick = ButtonExportClick
    end
  end
  object DBGridKurswechsler: TDBGrid
    Left = 0
    Top = 41
    Width = 567
    Height = 207
    Align = alClient
    DataSource = KurswechslerDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridKurswechslerDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NACHNAME'
        ReadOnly = True
        Title.Caption = 'Nachname'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VORNAME'
        ReadOnly = True
        Title.Caption = 'Vorname'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURSE'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = 'Anzahl Kurse'
        Width = 70
        Visible = True
      end>
  end
  object KurswechslerQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      
        'select s.ID, s.NACHNAME, s.VORNAME, count( distinct k.bamf_numme' +
        'r ) as KURSE'
      'from schueler s, kursschueler ks, kurse k'
      'where s.id = ks.schueler_id'
      'and ks.kurs_id = k.id'
      'and k.bamf_nummer is not null'
      'group by s.id, s.nachname, s.vorname'
      'having count( distinct k.bamf_nummer ) > 1'
      'order by s.nachname, s.vorname'
      ' '
      ' ')
    Left = 96
    Top = 112
  end
  object KurswechslerDataSource: TDataSource
    DataSet = KurswechslerQuery
    Left = 288
    Top = 120
  end
end
