object PruefungsTeilnehmerForm: TPruefungsTeilnehmerForm
  Left = 1471
  Top = 492
  Width = 406
  Height = 209
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Prüfungsteilnehmer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 41
    Align = alTop
    TabOrder = 0
    object SpeedButtonRefresh: TSpeedButton
      Left = 184
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
      Width = 175
      Height = 25
      DataSource = DataSourcePruefungsTeilnehmer
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
      ConfirmDelete = False
      TabOrder = 0
    end
  end
  object DBGridTeilnehmer: TDBGrid
    Left = 0
    Top = 41
    Width = 394
    Height = 137
    Align = alClient
    DataSource = DataSourcePruefungsTeilnehmer
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridTeilnehmerDblClick
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
        DropDownRows = 10
        Expanded = False
        FieldName = 'BESTANDEN'
        PickList.Strings = (
          'J'
          'Einstufungstest'
          'Orientierungstest'
          'A1-Test'
          'A2-Test'
          'B1-Test'
          'B2-Test'
          'B1-Gleichwertig'
          'N'
          'X')
        Width = 120
        Visible = True
      end>
  end
  object QueryPruefungsTeilnehmer: TQuery
    CachedUpdates = True
    BeforeClose = QueryPruefungsTeilnehmerBeforeClose
    BeforeInsert = QueryPruefungsTeilnehmerAbort
    AfterPost = QueryPruefungsTeilnehmerAfterPost
    BeforeDelete = QueryPruefungsTeilnehmerAbort
    DatabaseName = 'KlaroDB'
    RequestLive = True
    SQL.Strings = (
      'select'#9's.ID as SCHUELER_ID,'
      #9#9's.VORNAME, S.NACHNAME,'
      #9#9'ps.ID,'
      #9#9'ps.BESTANDEN'
      'from'#9'pruefschueler ps, schueler s'
      'where'#9'ps.schueler_id = s.id'
      'and     ps.pruef_id = :thePruefung'
      'order by s.NACHNAME, s.VORNAME'
      ' '
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = UpdateSQL
    Left = 200
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePruefung'
        ParamType = ptInput
      end>
    object QueryPruefungsTeilnehmerSCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Origin = 'KLARODB."SCHUELER.DB".ID'
      ReadOnly = True
      Visible = False
    end
    object QueryPruefungsTeilnehmerVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Origin = 'KLARODB."SCHUELER.DB".VORNAME'
      ReadOnly = True
      Size = 64
    end
    object QueryPruefungsTeilnehmerNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Origin = 'KLARODB."SCHUELER.DB".NACHNAME'
      ReadOnly = True
      Size = 64
    end
    object QueryPruefungsTeilnehmerBESTANDEN: TStringField
      DisplayLabel = 'Bestanden'
      FieldName = 'BESTANDEN'
      Origin = 'KLARODB."PRUEFSCHUELER.DB".BESTANDEN'
      Size = 64
    end
    object QueryPruefungsTeilnehmerID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."pruefschueler.DB".ID'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSourcePruefungsTeilnehmer: TDataSource
    DataSet = QueryPruefungsTeilnehmer
    Left = 88
    Top = 56
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update pruefschueler'
      'set'
      '  BESTANDEN = :BESTANDEN'
      'where'
      '  ID = :OLD_ID')
    Left = 280
    Top = 56
  end
end
