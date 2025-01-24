object LehrbuecherForm: TLehrbuecherForm
  Left = 1381
  Top = 416
  Width = 827
  Height = 318
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Lehrbücher'
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
    Width = 815
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = LEHRBUECHERDataSource
      TabOrder = 0
    end
  end
  object DBGridBooks: TDBGrid
    Left = 0
    Top = 41
    Width = 815
    Height = 246
    Align = alClient
    DataSource = LEHRBUECHERDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPPE'
        PickList.Strings = (
          'Sprachkurs'
          'Orientierungskurs'
          'Sprachkurs des Alphabetisierungskurses'
          'Orientierungskurs des Alphabetisierungskurses'
          'Zusatzmaterialien Alphabetisierungskurs'
          'Zusatzmaterialien')
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNTERTITEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERLAG'
        Visible = True
      end>
  end
  object LEHRBUECHERDataSource: TDataSource
    DataSet = LEHRBUECHERTable
    Left = 72
    Top = 48
  end
  object LEHRBUECHERTable: TTable
    AfterInsert = LEHRBUECHERTableAfterInsert
    BeforePost = LEHRBUECHERTableBeforePost
    DatabaseName = 'KlaroDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GRUPPE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TITEL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UNTERTITEL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VERLAG'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'LEHRBUECHERTableIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BUCH_GRUPPE_TITEL_IDX'
        Fields = 'GRUPPE;TITEL'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'BUCH_GRUPPE_TITEL_IDX'
    StoreDefs = True
    TableName = 'LEHRBUECHER'
    Left = 72
    Top = 104
    object LEHRBUECHERTableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object LEHRBUECHERTableGRUPPE: TStringField
      DisplayLabel = 'Gruppe'
      DisplayWidth = 32
      FieldName = 'GRUPPE'
      Required = True
      Size = 64
    end
    object LEHRBUECHERTableTITEL: TStringField
      DisplayLabel = 'Titlel'
      DisplayWidth = 32
      FieldName = 'TITEL'
      Required = True
      Size = 255
    end
    object LEHRBUECHERTableUNTERTITEL: TStringField
      DisplayLabel = 'Untertitel'
      DisplayWidth = 32
      FieldName = 'UNTERTITEL'
      Size = 255
    end
    object LEHRBUECHERTableVERLAG: TStringField
      DisplayLabel = 'Verlag'
      DisplayWidth = 32
      FieldName = 'VERLAG'
      Size = 255
    end
  end
end
