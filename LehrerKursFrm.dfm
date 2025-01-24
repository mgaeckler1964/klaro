object LehrerKursForm: TLehrerKursForm
  Left = 633
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lehrerkurse'
  ClientHeight = 331
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object DBText1: TDBText
      Left = 16
      Top = 8
      Width = 417
      Height = 17
      DataField = 'name'
      DataSource = teacherSource
    end
    object yearLabel: TLabel
      Left = 264
      Top = 32
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'yearLabel'
    end
    object SpeedButtonRefresh: TSpeedButton
      Left = 241
      Top = 24
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
      Left = 16
      Top = 24
      Width = 225
      Height = 25
      DataSource = teacherCourseSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
    object YearSelectUpDown: TUpDown
      Left = 312
      Top = 24
      Width = 50
      Height = 25
      Min = -32768
      Max = 32767
      Orientation = udHorizontal
      Position = 0
      TabOrder = 1
      Wrap = False
      OnChangingEx = YearSelectUpDownChangingEx
    end
    object CheckBoxFilter: TCheckBox
      Left = 368
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Alle anzeigen'
      TabOrder = 2
      OnClick = CheckBoxFilterClick
    end
  end
  object DBGridTeacherCourse: TDBGrid
    Left = 0
    Top = 57
    Width = 688
    Height = 274
    Align = alClient
    DataSource = teacherCourseSource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMMER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANFANGS_DATUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDE_DATUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIVEAU'
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
        FieldName = 'TEAM_TEACHER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOZ_PAED'
        Visible = True
      end>
  end
  object teacherQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select ID, VORNAME || '#39' '#39' || NACHNAME as NAME'
      'from LEHRER'
      'where ID = :theTeacher')
    UniDirectional = True
    Left = 184
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theTeacher'
        ParamType = ptInput
      end>
  end
  object teacherSource: TDataSource
    DataSet = teacherQuery
    Left = 80
    Top = 64
  end
  object teacherCourseQuery: TQuery
    CachedUpdates = True
    BeforeClose = teacherCourseQueryBeforeClose
    AfterInsert = teacherCourseQueryAfterInsert
    BeforePost = teacherCourseQueryBeforePost
    AfterPost = teacherCourseQueryAfterPost
    BeforeDelete = teacherCourseQueryBeforeDelete
    AfterDelete = teacherCourseQueryAfterDelete
    AutoRefresh = True
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    RequestLive = True
    SQL.Strings = (
      'select'#9'kl.*,'
      #9#9'k.NUMMER || '#39'-'#39' || k.HALBJAHR || '#39'-'#39' || k.JAHR as NUMMER,'
      #9#9'k.ANFANGS_DATUM,'
      #9#9'k.ENDE_DATUM,'
      #9#9'k.NIVEAU,'
      #9#9'k.JAHR,'
      #9#9'k.MO_ANF, k.MO_END, k.MO_PAUS_ANF, k.MO_PAUS_END,'
      #9#9'k.DI_ANF, k.DI_END, k.DI_PAUS_ANF, k.DI_PAUS_END,'
      #9#9'k.MI_ANF, k.MI_END, k.MI_PAUS_ANF, k.MI_PAUS_END,'
      #9#9'k.DO_ANF, k.DO_END, k.DO_PAUS_ANF, k.DO_PAUS_END,'
      #9#9'k.FR_ANF, k.FR_END, k.FR_PAUS_ANF, k.FR_PAUS_END,'
      #9#9'k.SA_ANF, k.SA_END, k.SA_PAUS_ANF, k.SA_PAUS_END,'
      #9#9'k.SO_ANF, k.SO_END, k.SO_PAUS_ANF, k.SO_PAUS_END'
      'from'#9'KURSLEHRER kl, KURSE k'
      'where'#9'kl.LEHRER_ID = :theTeacher and'
      #9#9'kl.KURS_ID = k.ID'
      'order by k.ANFANGS_DATUM, k.ENDE_DATUM'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdateSQL
    Left = 192
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'theTeacher'
        ParamType = ptInput
      end>
    object teacherCourseQueryID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object teacherCourseQueryNUMMER: TStringField
      DisplayLabel = 'Kursnummer'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'NUMMER'
      LookupDataSet = QueryCourse
      LookupKeyFields = 'id'
      LookupResultField = 'NUMMER'
      KeyFields = 'KURS_ID'
      Size = 37
      Lookup = True
    end
    object teacherCourseQueryANFANGS_DATUM: TDateTimeField
      DisplayLabel = 'Kursbeginn'
      DisplayWidth = 10
      FieldName = 'ANFANGS_DATUM'
      ReadOnly = True
    end
    object teacherCourseQueryENDE_DATUM: TDateTimeField
      DisplayLabel = 'Kursende'
      DisplayWidth = 10
      FieldName = 'ENDE_DATUM'
      ReadOnly = True
    end
    object teacherCourseQueryNIVEAU: TStringField
      DisplayLabel = 'Niveau'
      FieldName = 'NIVEAU'
      ReadOnly = True
      Size = 32
    end
    object teacherCourseQueryANFANG: TDateTimeField
      DisplayLabel = 'Einstieg'
      DisplayWidth = 10
      FieldName = 'ANFANG'
    end
    object teacherCourseQueryENDE: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE'
    end
    object teacherCourseQueryTEAM_TEACHER: TStringField
      DisplayLabel = 'TT'
      FieldName = 'TEAM_TEACHER'
      Origin = '"kurslehrer.DB".TEAM_TEACHER'
      Size = 1
    end
    object teacherCourseQuerySOZ_PAED: TStringField
      DisplayLabel = 'SP'
      FieldName = 'SOZ_PAED'
      Origin = '"kurslehrer.DB".SOZ_PAED'
      Size = 1
    end
    object teacherCourseQueryKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Visible = False
    end
    object teacherCourseQueryLEHRER_ID: TIntegerField
      FieldName = 'LEHRER_ID'
      Visible = False
    end
    object teacherCourseQueryjahr: TStringField
      DisplayLabel = 'Jahr'
      FieldName = 'JAHR'
      Origin = 'KLARODB."KURSE.DB".JAHR'
      Visible = False
      Size = 4
    end
    object teacherCourseQueryMO_ANF: TDateTimeField
      FieldName = 'MO_ANF'
      Origin = 'KLARODB."KURSE.DB".MO_ANF'
      Visible = False
    end
    object teacherCourseQueryMO_END: TDateTimeField
      FieldName = 'MO_END'
      Origin = 'KLARODB."KURSE.DB".MO_END'
      Visible = False
    end
    object teacherCourseQueryMO_PAUS_ANF: TDateTimeField
      FieldName = 'MO_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".MO_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQueryMO_PAUS_END: TDateTimeField
      FieldName = 'MO_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".MO_PAUS_END'
      Visible = False
    end
    object teacherCourseQueryDI_ANF: TDateTimeField
      FieldName = 'DI_ANF'
      Origin = 'KLARODB."KURSE.DB".DI_ANF'
      Visible = False
    end
    object teacherCourseQueryDI_END: TDateTimeField
      FieldName = 'DI_END'
      Origin = 'KLARODB."KURSE.DB".DI_END'
      Visible = False
    end
    object teacherCourseQueryDI_PAUS_ANF: TDateTimeField
      FieldName = 'DI_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".DI_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQueryDI_PAUS_END: TDateTimeField
      FieldName = 'DI_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".DI_PAUS_END'
      Visible = False
    end
    object teacherCourseQueryMI_ANF: TDateTimeField
      FieldName = 'MI_ANF'
      Origin = 'KLARODB."KURSE.DB".MI_ANF'
      Visible = False
    end
    object teacherCourseQueryMI_END: TDateTimeField
      FieldName = 'MI_END'
      Origin = 'KLARODB."KURSE.DB".MI_END'
      Visible = False
    end
    object teacherCourseQueryMI_PAUS_ANF: TDateTimeField
      FieldName = 'MI_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".MI_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQueryMI_PAUS_END: TDateTimeField
      FieldName = 'MI_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".MI_PAUS_END'
      Visible = False
    end
    object teacherCourseQueryDO_ANF: TDateTimeField
      FieldName = 'DO_ANF'
      Origin = 'KLARODB."KURSE.DB".DO_ANF'
      Visible = False
    end
    object teacherCourseQueryDO_END: TDateTimeField
      FieldName = 'DO_END'
      Origin = 'KLARODB."KURSE.DB".DO_END'
      Visible = False
    end
    object teacherCourseQueryDO_PAUS_ANF: TDateTimeField
      FieldName = 'DO_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".DO_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQueryDO_PAUS_END: TDateTimeField
      FieldName = 'DO_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".DO_PAUS_END'
      Visible = False
    end
    object teacherCourseQueryFR_ANF: TDateTimeField
      FieldName = 'FR_ANF'
      Origin = 'KLARODB."KURSE.DB".FR_ANF'
      Visible = False
    end
    object teacherCourseQueryFR_END: TDateTimeField
      FieldName = 'FR_END'
      Origin = 'KLARODB."KURSE.DB".FR_END'
      Visible = False
    end
    object teacherCourseQueryFR_PAUS_ANF: TDateTimeField
      FieldName = 'FR_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".FR_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQueryFR_PAUS_END: TDateTimeField
      FieldName = 'FR_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".FR_PAUS_END'
      Visible = False
    end
    object teacherCourseQuerySA_ANF: TDateTimeField
      FieldName = 'SA_ANF'
      Origin = 'KLARODB."KURSE.DB".SA_ANF'
      Visible = False
    end
    object teacherCourseQuerySA_END: TDateTimeField
      FieldName = 'SA_END'
      Origin = 'KLARODB."KURSE.DB".SA_END'
      Visible = False
    end
    object teacherCourseQuerySA_PAUS_ANF: TDateTimeField
      FieldName = 'SA_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".SA_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQuerySA_PAUS_END: TDateTimeField
      FieldName = 'SA_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".SA_PAUS_END'
      Visible = False
    end
    object teacherCourseQuerySO_ANF: TDateTimeField
      FieldName = 'SO_ANF'
      Origin = 'KLARODB."KURSE.DB".SO_ANF'
      Visible = False
    end
    object teacherCourseQuerySO_END: TDateTimeField
      FieldName = 'SO_END'
      Origin = 'KLARODB."KURSE.DB".SO_END'
      Visible = False
    end
    object teacherCourseQuerySO_PAUS_ANF: TDateTimeField
      FieldName = 'SO_PAUS_ANF'
      Origin = 'KLARODB."KURSE.DB".SO_PAUS_ANF'
      Visible = False
    end
    object teacherCourseQuerySO_PAUS_END: TDateTimeField
      FieldName = 'SO_PAUS_END'
      Origin = 'KLARODB."KURSE.DB".SO_PAUS_END'
      Visible = False
    end
  end
  object teacherCourseSource: TDataSource
    DataSet = teacherCourseQuery
    Left = 80
    Top = 136
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update'#9'kurslehrer'
      'set'#9#9'LEHRER_ID = :LEHRER_ID,'
      #9#9'KURS_ID = :KURS_ID,'
      #9#9'ANFANG = :ANFANG,'
      #9#9'ENDE = :ENDE,'
      #9#9'TEAM_TEACHER = :TEAM_TEACHER,'
      #9#9'SOZ_PAED = :SOZ_PAED'
      'where'#9'ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'insert into kurslehrer'
      '('
      #9'ID, LEHRER_ID, KURS_ID, ANFANG, ENDE, TEAM_TEACHER, SOZ_PAED'
      ')'
      'values'
      '('
      
        #9':ID, :LEHRER_ID, :KURS_ID, :ANFANG, :ENDE, :TEAM_TEACHER, :SOZ_' +
        'PAED'
      ')'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from kurslehrer'
      'where'
      '  ID = :OLD_ID')
    Left = 312
    Top = 144
  end
  object QueryCourse: TQuery
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    SQL.Strings = (
      
        'select ID, NUMMER || '#39'-'#39' || HALBJAHR || '#39'-'#39' || JAHR as NUMMER, J' +
        'AHR'
      'from KURSE'
      'order by 2'
      ' '
      ' '
      ' '
      ' ')
    Left = 192
    Top = 208
  end
  object QueryFerien: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select'#9'ANFANG, ENDE'
      'from'#9'FERIEN'
      'where'#9'(ANFANG >= :start1 and ANFANG <= :ende1)'
      'or'#9#9'(ENDE >= :start2 and ENDE <= :ende2)'
      'or'#9#9'(ANFANG < :start3 and ENDE > :ende3)'
      'order by ANFANG'
      ' '
      ' ')
    Left = 64
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'start1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ende1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'start2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ende2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'start3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ende3'
        ParamType = ptUnknown
      end>
  end
end
