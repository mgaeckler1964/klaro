object KursInfoForm: TKursInfoForm
  Left = 455
  Top = 491
  Width = 534
  Height = 437
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Kursinfo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 161
    Width = 526
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 526
    Height = 120
    Align = alTop
    DataSource = teacherSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pupilGrid: TDBGrid
    Left = 0
    Top = 164
    Width = 526
    Height = 246
    Align = alClient
    DataSource = pupilSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = pupilGridDrawColumnCell
    OnDblClick = pupilGridDblClick
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
        FieldName = 'ANFANG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BETRAG'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 41
    Align = alTop
    TabOrder = 2
    object BitBtnXmlExport: TBitBtn
      Left = 8
      Top = 8
      Width = 289
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'XML Export'
      PopupMenu = xmlPopupMenu
      TabOrder = 0
      OnClick = BitBtnXmlExportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000B1111BBBBB
        B00000B1111BBBBBB00000B1111BBBBBB00000B1111BBBBBB00000B1111BCCCB
        B00000B1111BCCCBB00000BBBBBBCCCBB00000BBBBBBCCCBB00000BBBBBBCCCB
        B00000BBBBBBBBBBB00000999999999990000009999999990000000099999990
        0000000009999090000000000099000000000000000000000000}
    end
    object BitBtnOnlineExport: TBitBtn
      Left = 408
      Top = 8
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Online Export'
      TabOrder = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtnCSVexport: TBitBtn
      Left = 304
      Top = 8
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'CSV Export'
      TabOrder = 2
      OnClick = BitBtnCSVexportClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object teacherSource: TDataSource
    DataSet = teacherQuery
    Left = 40
    Top = 48
  end
  object teacherQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'SELECT DISTINCT Lehrer.NACHNAME, Lehrer.VORNAME,'
      #9#9'Kurslehrer.ANFANG, Kurslehrer.ENDE,'
      #9#9'Kurslehrer.TEAM_TEACHER, kurslehrer.SOZ_PAED'
      'FROM'#9'Kurslehrer, Lehrer'
      'WHERE'#9'Kurslehrer.KURS_ID = :theCourse and'
      #9#9'Kurslehrer.LEHRER_ID = Lehrer.ID'
      ' '
      ' '
      ' ')
    Left = 120
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
      end>
    object teacherQueryNACHNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Origin = '"LEHRER.DB".NACHNAME'
      Size = 64
    end
    object teacherQueryVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Origin = '"LEHRER.DB".VORNAME'
      Size = 64
    end
    object teacherQueryANFANG: TDateTimeField
      DisplayLabel = 'Einstieg'
      DisplayWidth = 10
      FieldName = 'ANFANG'
      Origin = '"KURSLEHRER.DB".ANFANG'
    end
    object teacherQueryENDE: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE'
      Origin = '"KURSLEHRER.DB".ENDE'
    end
    object teacherQueryTEAM_TEACHER: TStringField
      DisplayLabel = 'TT'
      FieldName = 'TEAM_TEACHER'
      Origin = '"KURSLEHRER.DB".TEAM_TEACHER'
      Size = 1
    end
    object teacherQuerySOZ_PAED: TStringField
      DisplayLabel = 'SP'
      FieldName = 'SOZ_PAED'
      Origin = '"KURSLEHRER.DB".SOZ_PAED'
      Size = 1
    end
  end
  object pupilQuery: TQuery
    OnCalcFields = pupilQueryCalcFields
    DatabaseName = 'KlaroDB'
    Filter = 'NACHNAME <> '#39#39
    Filtered = True
    SQL.Strings = (
      'SELECT  schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      
        #9#9'Kursschueler.ANFANG, Kursschueler.ENDE, sum(bezahlung.betrag) ' +
        'as BETRAG'
      'FROM'#9'Kursschueler, schueler, bezahlung'
      'WHERE'#9'Kursschueler.KURS_ID = :theCourse and'
      #9#9'Kursschueler.schueler_ID = schueler.ID and'
      #9#9'kursschueler.id = bezahlung.kurs_schueler_id and'
      #9#9'bezahlung.beschreibung = '#39'Kursgebühr'#39
      'group by schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      #9#9'Kursschueler.ANFANG, Kursschueler.ENDE'
      'union'
      'SELECT  schueler.ID,'
      #9#9'schueler.NACHNAME, schueler.VORNAME,'
      #9#9'Kursschueler.ANFANG, Kursschueler.ENDE, 0 as BETRAG'
      'FROM'#9'Kursschueler, schueler'
      'WHERE'#9'Kursschueler.KURS_ID = :theCourse and'
      #9#9'Kursschueler.schueler_ID = schueler.ID and'
      
        #9#9'not exists ( select * from bezahlung where kursschueler.id = b' +
        'ezahlung.kurs_schueler_id and'
      #9#9'bezahlung.beschreibung = '#39'Kursgebühr'#39' )'
      'order by 2,3,4,5')
    Left = 112
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'theCourse'
        ParamType = ptInput
      end>
    object pupilQueryID: TIntegerField
      FieldName = 'ID'
    end
    object pupilQueryNACHNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Origin = '"SCHUELER.DB".NACHNAME'
      Size = 64
    end
    object pupilQueryVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Origin = '"SCHUELER.DB".VORNAME'
      Size = 64
    end
    object pupilQueryANFANG: TDateTimeField
      DisplayLabel = 'Einstieg'
      DisplayWidth = 10
      FieldName = 'ANFANG'
      Origin = '"Kursschueler.DB".ANFANG'
    end
    object pupilQueryENDE: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE'
      Origin = '"Kursschueler.DB".ENDE'
    end
    object pupilQueryBETRAG: TFloatField
      DisplayLabel = 'Bezahlt'
      FieldName = 'BETRAG'
      currency = True
    end
    object pupilQueryREST: TFloatField
      DisplayLabel = 'Rest'
      FieldKind = fkCalculated
      FieldName = 'REST'
      currency = True
      Calculated = True
    end
  end
  object pupilSource: TDataSource
    DataSet = pupilQuery
    Left = 40
    Top = 256
  end
  object xmlPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 392
    Top = 40
    object SelectaXSLFile1: TMenuItem
      Caption = 'Wähle eine XSL Datei'
      Enabled = False
    end
    object Ohne1: TMenuItem
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = '<Ohne>'
      Checked = True
      RadioItem = True
      OnClick = xslMenuClick
    end
  end
end
