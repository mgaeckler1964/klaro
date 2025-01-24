object FerienForm: TFerienForm
  Left = 1443
  Top = 325
  Width = 642
  Height = 254
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Ferien'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButtonRefresh: TSpeedButton
      Left = 233
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
    object DBNavigator: TDBNavigator
      Left = 8
      Top = 8
      Width = 225
      Height = 25
      DataSource = FerienDataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object DBGridFerien: TDBGrid
    Left = 0
    Top = 41
    Width = 630
    Height = 182
    Align = alClient
    DataSource = FerienDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
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
        FieldName = 'BEZEICHNUNG'
        Visible = True
      end>
  end
  object FerienTable: TTable
    BeforePost = FerienTableBeforePost
    DatabaseName = 'KlaroDB'
    TableName = 'FERIEN'
    Left = 40
    Top = 64
    object FerienTableANFANG: TDateTimeField
      DisplayLabel = 'Anfang'
      FieldName = 'ANFANG'
    end
    object FerienTableENDE: TDateTimeField
      DisplayLabel = 'Ende'
      FieldName = 'ENDE'
    end
    object FerienTableBEZEICHNUNG: TStringField
      DisplayLabel = 'Bezeichnung'
      DisplayWidth = 60
      FieldName = 'BEZEICHNUNG'
      Size = 255
    end
  end
  object FerienDataSource: TDataSource
    DataSet = FerienTable
    Left = 136
    Top = 64
  end
end
