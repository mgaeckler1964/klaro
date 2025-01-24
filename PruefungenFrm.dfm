object PruefungenForm: TPruefungenForm
  Left = 382
  Top = 265
  Width = 596
  Height = 317
  Caption = 'Prüfungstermine'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    FFFFFFFFFFFFFFFF0000000000000000FFFFFFFF7777777F0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F77777FFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F77777777FFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000F77777FFFFFFFFFF0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000F77777777777777F0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000F7777777777FFFFF0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000F777777777777FFF0000000000000000
    FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F7777777FFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F77777777777FFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F77777777777777F0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    F777777777777FFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFE00007FFE00007FFE000
    07FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE000
    07FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE000
    07FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE00007FFE000
    07FFE00007FFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    00000000000000FFFFFFFF00000000FFFF777F00000000FFFFFFFF00000000FF
    FFFFFF00000000F777FFFF00000000FFFFFFFF00000000F777777F00000000FF
    FFFFFF00000000F7777FFF00000000FFFFFFFF00000000F777777F00000000FF
    FFFFFF00000000000000000000000000000000000000FFFF0000801F0000801F
    0000801F0000801F0000801F0000801F0000801F0000801F0000801F0000801F
    0000801F0000801F0000801F0000801F0000FFFF0000}
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButtonRefresh: TSpeedButton
      Left = 230
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Daten aktualisieren'
      Glyph.Data = {
        42010000424D4201000000000000420000002800000010000000100000000100
        08000000000000010000C30E0000C30E00000300000000000000000000008080
        8000C8D0D4000202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020201000102
        0202020202020202020201000001020202020202020202020202000001020202
        0202020202020202020100010202020202020202020202020200000202020202
        0202020202020202020000020202000000000002020202020200000102020201
        0000000202020202020100000102010000000002020202020202000000000000
        0001000202020202020202010000000102020002020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        020202020202}
      OnClick = SpeedButtonRefreshClick
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 225
      Height = 25
      DataSource = PruefungenDataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
    object ButtonPruefungsteilnehmer: TButton
      Left = 256
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Prüfungsteilnehmer'
      TabOrder = 1
      OnClick = DBGridPruefungenDblClick
    end
    object BitBtnXmlExport: TBitBtn
      Left = 361
      Top = 8
      Width = 218
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'XML Export'
      PopupMenu = xmlPopupMenu
      TabOrder = 2
      OnClick = BitBtnXmlExportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        0000000000000000000000FFFFFFFF00000000FFFF777F00000000FFFFFFFF00
        000000FFFFFFFF00000000F777FFFF00000000FFFFFFFF00000000F777777F00
        000000FFFFFFFF00000000F7777FFF00000000FFFFFFFF00000000F777777F00
        000000FFFFFFFF00000000000000000000000000000000000000}
    end
  end
  object DBGridPruefungen: TDBGrid
    Left = 0
    Top = 41
    Width = 588
    Height = 249
    Align = alClient
    DataSource = PruefungenDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridPruefungenDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PRUEFUNGS_NUMMER'
        Title.Caption = 'Nummer'
        Visible = True
      end
      item
        DropDownRows = 8
        Expanded = False
        FieldName = 'PRUEFUNG'
        PickList.Strings = (
          'Einstufungstest'
          'Orientierungstest'
          'A1-Test'
          'A2-Test'
          'B1-Test'
          'B2-Test'
          'B1-Gleichwertig'
          'Deutschtest für Zuwanderer')
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUFSICHT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANSPRECHPARTNER'
        Visible = True
      end>
  end
  object PruefungenDataSource: TDataSource
    DataSet = PruefungenTable
    Left = 72
    Top = 56
  end
  object PruefungenTable: TTable
    AfterInsert = PruefungenTableAfterInsert
    BeforePost = PruefungenTableBeforePost
    DatabaseName = 'KlaroDB'
    Exclusive = True
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRUEFUNGS_NUMMER'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'PRUEFUNG'
        Attributes = [faRequired]
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'AUFSICHT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'JAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATUM_STRING'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ANSPRECHPARTNER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'RAUM'
        DataType = ftString
        Size = 32
      end>
    IndexDefs = <
      item
        Name = 'PruefungenTableIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PRUEFUNGS_IDX'
        Fields = 'DATUM;PRUEFUNG'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'PRUEFUNGS_IDX'
    StoreDefs = True
    TableName = 'PRUEFUNGEN'
    Left = 216
    Top = 56
    object PruefungenTableID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object PruefungenTablePRUEFUNGS_NUMMER: TStringField
      FieldName = 'PRUEFUNGS_NUMMER'
      Size = 32
    end
    object PruefungenTablePRUEFUNG: TStringField
      DisplayLabel = 'Prüfung'
      DisplayWidth = 32
      FieldName = 'PRUEFUNG'
      Required = True
      Size = 128
    end
    object PruefungenTableDATUM: TDateTimeField
      DisplayLabel = 'Datum/Zeit'
      FieldName = 'DATUM'
      Required = True
    end
    object PruefungenTableJAHR: TStringField
      FieldName = 'JAHR'
      Required = True
      Size = 4
    end
    object PruefungenTableDATUM_STRING: TStringField
      FieldName = 'DATUM_STRING'
      Required = True
      Size = 10
    end
    object PruefungenTableAUFSICHT: TStringField
      DisplayLabel = 'Aufsichtsperson(en)'
      DisplayWidth = 64
      FieldName = 'AUFSICHT'
      Size = 255
    end
    object PruefungenTableANSPRECHPARTNER: TStringField
      DisplayLabel = 'Ansprechpartner/in'
      DisplayWidth = 64
      FieldName = 'ANSPRECHPARTNER'
      Size = 255
    end
    object PruefungenTableRAUM: TStringField
      DisplayLabel = 'Raum'
      DisplayWidth = 16
      FieldName = 'RAUM'
      Size = 32
    end
  end
  object xmlPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 128
    Top = 144
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
  object QueryPruefungen: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select distinct PRUEFUNG from PRUEFUNGEN order by PRUEFUNG')
    Left = 224
    Top = 144
    object QueryPruefungenPRUEFUNG: TStringField
      FieldName = 'PRUEFUNG'
      Origin = 'KLARODB."PRUEFUNGEN.DB".PRUEFUNG'
      Size = 128
    end
  end
end
