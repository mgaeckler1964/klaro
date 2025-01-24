object KursbooksForm: TKursbooksForm
  Left = 1679
  Top = 148
  Width = 482
  Height = 304
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Kursbücher'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 41
    Align = alTop
    TabOrder = 0
    object SpeedButtonRefresh: TSpeedButton
      Left = 232
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
      DataSource = kursbuecherDataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object DBGridBooks: TDBGrid
    Left = 0
    Top = 41
    Width = 470
    Height = 232
    Align = alClient
    DataSource = kursbuecherDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TITEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS_TITEL'
        Visible = True
      end>
  end
  object kursbuecherQuery: TQuery
    CachedUpdates = True
    BeforeClose = kursbuecherQueryBeforeClose
    AfterInsert = kursbuecherQueryAfterInsert
    AfterPost = kursbuecherQueryAfterPost
    AfterDelete = kursbuecherQueryAfterDelete
    AutoRefresh = True
    DatabaseName = 'KlaroDB'
    RequestLive = True
    SQL.Strings = (
      'select lb.GRUPPE || '#39': '#39' || lb.TITEL as TITEL, kb.*'
      'from kursbuecher kb, lehrbuecher lb'
      'where kb.kurs_id = :theKurs'
      'and  kb.buch_id = lb.id'
      'order by 1'
      ' ')
    UpdateObject = UpdateSQL
    Left = 152
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theKurs'
        ParamType = ptUnknown
      end>
    object kursbuecherQueryKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Origin = 'KLARODB.KURSBUECHER.KURS_ID'
    end
    object kursbuecherQueryBUCH_ID: TIntegerField
      FieldName = 'BUCH_ID'
      Origin = 'KLARODB.KURSBUECHER.BUCH_ID'
    end
    object kursbuecherQueryTITEL: TStringField
      DisplayLabel = 'Titel'
      DisplayWidth = 64
      FieldKind = fkLookup
      FieldName = 'TITEL'
      LookupDataSet = buecherQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITEL'
      KeyFields = 'BUCH_ID'
      Origin = 'KLARODB.LEHRBUECHER.GRUPPE'
      Size = 252
      Lookup = True
    end
    object kursbuecherQueryKURS_TITEL: TStringField
      DisplayLabel = 'Kurstitel'
      DisplayWidth = 64
      FieldName = 'KURS_TITEL'
      Origin = 'KLARODB."LEHRBUECHER.DB".GRUPPE'
      Size = 255
    end
  end
  object buecherQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select ID, GRUPPE || '#39': '#39' || TITEL as TITEL'
      'from lehrbuecher'
      'order by 2'
      ' ')
    Left = 176
    Top = 56
  end
  object kursbuecherDataSource: TDataSource
    DataSet = kursbuecherQuery
    Left = 40
    Top = 120
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update kursbuecher'
      'set'
      '  BUCH_ID = :BUCH_ID,'
      '  KURS_TITEL = :KURS_TITEL'
      'where'
      '  KURS_ID = :OLD_KURS_ID and'
      '  BUCH_ID = :OLD_BUCH_ID'
      ' ')
    InsertSQL.Strings = (
      'insert into kursbuecher'
      '  (KURS_ID, BUCH_ID, KURS_TITEL)'
      'values'
      '  (:KURS_ID, :BUCH_ID, :KURS_TITEL)'
      ' ')
    DeleteSQL.Strings = (
      'delete from kursbuecher'
      'where'
      '  KURS_ID = :OLD_KURS_ID and'
      '  BUCH_ID = :OLD_BUCH_ID')
    Left = 240
    Top = 120
  end
end
