object SchuelerKursForm: TSchuelerKursForm
  Left = 289
  Top = 249
  Width = 887
  Height = 409
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Schülerkurse und -prüfungen'
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 879
    Height = 382
    ActivePage = TabSheetCourse
    Align = alClient
    TabOrder = 0
    object TabSheetCourse: TTabSheet
      Caption = 'Kurse'
      object DBMemoCourse: TDBMemo
        Left = 0
        Top = 249
        Width = 871
        Height = 105
        Align = alBottom
        DataField = 'BEMERKUNG'
        DataSource = pupilCourseSource
        TabOrder = 0
      end
      object DBGridCourse: TDBGrid
        Left = 0
        Top = 57
        Width = 871
        Height = 192
        Align = alClient
        DataSource = pupilCourseSource
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
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAMF_NUMMER'
            Width = 105
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
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHUELER_MODUL'
            Title.Caption = 'Schülermodul'
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
            FieldName = 'ANMELDE_DATUM'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STORNO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDNUNGSGEMAESS'
            PickList.Strings = (
              'J'
              'N'
              'X')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOSTENBETEILIGUNG'
            PickList.Strings = (
              'Selbstzahler'
              'Standard'
              'Befreit')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANTRAG_KOSTENBEFREIUNG'
            PickList.Strings = (
              'J'
              'N')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOSTENBEFREIUNG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAHRTKOSTENBEWILLIGUNG'
            PickList.Strings = (
              'J'
              'N')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KURS_WECHSEL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BEHOERDE'
            PickList.Strings = (
              'BAMF'
              'ABH'
              'BVA'
              'Grundsicherung')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BERECHTIGUNGS_NR'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 871
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object DBTextNameCourse: TDBText
          Left = 16
          Top = 8
          Width = 313
          Height = 17
          DataField = 'name'
          DataSource = pupilSource
        end
        object yearLabelCourse: TLabel
          Left = 303
          Top = 32
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'yearLabelCourse'
        end
        object SpeedButtonRefreshCourse: TSpeedButton
          Left = 232
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
          OnClick = SpeedButtonRefreshCourseClick
        end
        object DBNavigatorCourse: TDBNavigator
          Left = 16
          Top = 24
          Width = 216
          Height = 25
          DataSource = pupilCourseSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 0
        end
        object ButtonPayment: TButton
          Left = 257
          Top = 24
          Width = 75
          Height = 25
          Hint = 'Zeigt die Zahlungseingänge des Schülers'
          Caption = 'Zahlungen...'
          TabOrder = 1
          OnClick = ButtonPaymentClick
        end
        object YearSelectUpDownCourse: TUpDown
          Left = 384
          Top = 24
          Width = 50
          Height = 25
          Min = -32768
          Max = 32767
          Orientation = udHorizontal
          Position = 0
          TabOrder = 2
          Wrap = False
          OnChangingEx = YearSelectUpDownCourseChangingEx
        end
        object CheckBoxFilterCourse: TCheckBox
          Left = 440
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Alle anzeigen'
          TabOrder = 3
          OnClick = CheckBoxFilterCourseClick
        end
      end
    end
    object TabSheetTests: TTabSheet
      Caption = 'Prüfungen'
      ImageIndex = 1
      object DBMemoTest: TDBMemo
        Left = 0
        Top = 239
        Width = 867
        Height = 111
        Align = alBottom
        DataField = 'BEMERKUNG'
        DataSource = pupilTestSource
        TabOrder = 0
      end
      object DBGridTest: TDBGrid
        Left = 0
        Top = 57
        Width = 867
        Height = 182
        Align = alClient
        DataSource = pupilTestSource
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
            FieldName = 'PRUEFUNG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATUM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOSTENBETEILIGUNG'
            PickList.Strings = (
              'Selbstzahler'
              'geförderter Selbstzahler'
              'befreit')
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
          end
          item
            Expanded = False
            FieldName = 'BEHOERDE'
            PickList.Strings = (
              'BAMF'
              'ABH'
              'BVA'
              'Grundsicherung')
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BERECHTIGUNGS_NR'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 867
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object DBTextNameTest: TDBText
          Left = 16
          Top = 8
          Width = 313
          Height = 17
          DataField = 'name'
          DataSource = pupilSource
        end
        object yearLabelTest: TLabel
          Left = 315
          Top = 32
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'yearLabelTest'
        end
        object SpeedButtonRefreshTests: TSpeedButton
          Left = 232
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
          OnClick = SpeedButtonRefreshTestsClick
        end
        object DBNavigatorTest: TDBNavigator
          Left = 16
          Top = 24
          Width = 216
          Height = 25
          DataSource = pupilTestSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 0
          OnClick = DBNavigatorTestClick
        end
        object YearSelectUpDownTest: TUpDown
          Left = 384
          Top = 24
          Width = 50
          Height = 25
          Min = -32768
          Max = 32767
          Orientation = udHorizontal
          Position = 0
          TabOrder = 1
          Wrap = False
          OnChangingEx = YearSelectUpDownTestChangingEx
        end
        object CheckBoxFilterTest: TCheckBox
          Left = 440
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Alle anzeigen'
          TabOrder = 2
          OnClick = CheckBoxFilterTestClick
        end
      end
    end
  end
  object pupilQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select id, vorname || '#39' '#39' || nachname as name'
      'from schueler'
      'where id = :thePupil'
      ' ')
    UniDirectional = True
    Left = 192
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePupil'
        ParamType = ptInput
      end>
  end
  object pupilSource: TDataSource
    DataSet = pupilQuery
    Left = 104
    Top = 80
  end
  object pupilCourseQuery: TQuery
    CachedUpdates = True
    BeforeClose = pupilCourseQueryBeforeClose
    AfterInsert = pupilCourseQueryAfterInsert
    BeforePost = pupilCourseQueryBeforePost
    AfterPost = pupilCourseQueryAfterPost
    AfterDelete = pupilCourseQueryAfterDelete
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    RequestLive = True
    SQL.Strings = (
      'select'#9'ks.*,'
      #9#9'k.NUMMER || '#39'-'#39' || k.HALBJAHR || '#39'-'#39' || k.JAHR as NUMMER,'
      #9#9'k.BAMF_NUMMER,'
      #9#9'k.ANFANGS_DATUM,'
      #9#9'k.ENDE_DATUM,'
      #9#9'k.NIVEAU,'
      #9#9'k.JAHR'
      'from'#9'KURSSCHUELER ks, KURSE k'
      'where'#9'ks.SCHUELER_ID= :thePupil and'
      #9#9'ks.KURS_ID = k.ID'
      'order by k.ANFANGS_DATUM, k.ENDE_DATUM'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = UpdateSQLCourse
    Left = 192
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePupil'
        ParamType = ptInput
      end>
    object pupilCourseQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'kursschueler.ID'
      Required = True
      Visible = False
    end
    object pupilCourseQueryNUMMER: TStringField
      DisplayLabel = 'Kursnummer'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'NUMMER'
      LookupDataSet = courseQuery
      LookupKeyFields = 'id'
      LookupResultField = 'NUMMER'
      KeyFields = 'KURS_ID'
      Size = 64
      Lookup = True
    end
    object pupilCourseQueryBAMF_NUMMER: TStringField
      DisplayLabel = 'BAMF Nummer'
      DisplayWidth = 25
      FieldName = 'BAMF_NUMMER'
      Origin = 'KLARODB."KURSE.DB".BAMF_NUMMER'
      Size = 32
    end
    object pupilCourseQueryANFANGS_DATUM: TDateTimeField
      DisplayLabel = 'Kursbeginn'
      DisplayWidth = 10
      FieldName = 'ANFANGS_DATUM'
      Origin = '"KURSE.DB".ANFANGS_DATUM'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object pupilCourseQueryENDE_DATUM: TDateTimeField
      DisplayLabel = 'Kursende'
      DisplayWidth = 10
      FieldName = 'ENDE_DATUM'
      Origin = '"KURSE.DB".ENDE_DATUM'
      ReadOnly = True
    end
    object pupilCourseQueryNIVEAU: TStringField
      DisplayLabel = 'Niveau'
      FieldName = 'NIVEAU'
      Origin = '"KURSE.DB".NIVEAU'
      ReadOnly = True
      Size = 32
    end
    object pupilCourseQueryANFANG: TDateTimeField
      DisplayLabel = 'Einstieg'
      DisplayWidth = 10
      FieldName = 'ANFANG'
      Origin = 'kursschueler.ANFANG'
    end
    object pupilCourseQueryENDE: TDateTimeField
      DisplayLabel = 'Ende'
      DisplayWidth = 10
      FieldName = 'ENDE'
      Origin = 'kursschueler..ENDE'
    end
    object pupilCourseQueryKURS_ID: TIntegerField
      FieldName = 'KURS_ID'
      Origin = 'kursschueler..KURS_ID'
      Visible = False
    end
    object pupilCourseQuerySCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Origin = 'kursschueler.SCHUELER_ID'
      Visible = False
    end
    object pupilCourseQueryBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      Origin = 'KLARO."kursschueler.DB".BEMERKUNG'
      Visible = False
      BlobType = ftMemo
      Size = 32
    end
    object pupilCourseQueryJAHR: TStringField
      DisplayLabel = 'Jahr'
      FieldName = 'JAHR'
      Origin = 'KLARODB."KURSE.DB".JAHR'
      Size = 4
    end
    object pupilCourseQueryORDNUNGSGEMAESS: TStringField
      DisplayLabel = 'Ordnungsgemäß'
      FieldName = 'ORDNUNGSGEMAESS'
      Origin = 'KLARODB."kursschueler.DB".ORDNUNGSGEMAESS'
      Size = 1
    end
    object pupilCourseQueryKOSTENBETEILIGUNG: TStringField
      DisplayLabel = 'Kostenbeteiligung'
      DisplayWidth = 16
      FieldName = 'KOSTENBETEILIGUNG'
      Origin = 'KLARODB."kursschueler.DB".KOSTENBETEILIGUNG'
      Size = 32
    end
    object pupilCourseQueryANTRAG_KOSTENBEFREIUNG: TStringField
      DisplayLabel = 'Antrag auf Kostenbefreiung'
      FieldName = 'ANTRAG_KOSTENBEFREIUNG'
      Origin = 'KLARODB."kursschueler.DB".ANTRAG_KOSTENBEFREIUNG'
      Size = 1
    end
    object pupilCourseQueryFAHRTKOSTENBEWILLIGUNG: TStringField
      DisplayLabel = 'Fahrtkostenbewilligung'
      FieldName = 'FAHRTKOSTENBEWILLIGUNG'
      Size = 1
    end
    object pupilCourseQuerySCHUELER_MODUL: TStringField
      FieldName = 'SCHUELER_MODUL'
      Origin = 'KLARODB."KURSSCHUELER.DB".SCHUELER_MODUL'
      Size = 32
    end
    object pupilCourseQueryANMELDE_DATUM: TDateTimeField
      DisplayLabel = 'Anmeldedatum'
      FieldName = 'ANMELDE_DATUM'
      Origin = 'KLARODB."KURSSCHUELER.DB".ANMELDE_DATUM'
    end
    object pupilCourseQuerySTORNO: TDateTimeField
      DisplayLabel = 'Stornodatum'
      FieldName = 'STORNO'
      Origin = 'KLARODB."KURSSCHUELER.DB".STORNO'
    end
    object pupilCourseQueryKOSTENBEFREIUNG: TDateTimeField
      DisplayLabel = 'Kostenbefreiung ab'
      FieldName = 'KOSTENBEFREIUNG'
      Origin = 'KLARODB."KURSSCHUELER.DB".KOSTENBEFREIUNG'
    end
    object pupilCourseQueryKURS_WECHSEL: TStringField
      DisplayLabel = 'Kurswechsel'
      DisplayWidth = 40
      FieldName = 'KURS_WECHSEL'
      Origin = 'KLARODB."KURSSCHUELER.DB".KURS_WECHSEL'
      Size = 255
    end
    object pupilCourseQueryBEHOERDE: TStringField
      DisplayLabel = 'Behörde'
      DisplayWidth = 16
      FieldName = 'BEHOERDE'
      Origin = 'KLARODB."KURSSCHUELER.DB".BEHOERDE'
      Size = 32
    end
    object pupilCourseQueryBERECHTIGUNGS_NR: TStringField
      DisplayLabel = 'Berechtigungsschein'
      DisplayWidth = 32
      FieldName = 'BERECHTIGUNGS_NR'
      Origin = 'KLARODB."KURSSCHUELER.DB".BERECHTIGUNGS_NR'
      Size = 255
    end
  end
  object pupilCourseSource: TDataSource
    DataSet = pupilCourseQuery
    Left = 104
    Top = 128
  end
  object UpdateSQLCourse: TUpdateSQL
    ModifySQL.Strings = (
      'update KURSSCHUELER'
      'set'
      '  KURS_ID = :KURS_ID,'
      '  SCHUELER_ID = :SCHUELER_ID,'
      '  ANFANG = :ANFANG,'
      '  ENDE = :ENDE,'
      '  ANMELDE_DATUM = :ANMELDE_DATUM,'
      '  STORNO = :STORNO,'
      '  BEMERKUNG = :BEMERKUNG,'
      '  SCHUELER_MODUL = :SCHUELER_MODUL,'
      '  KOSTENBETEILIGUNG = :KOSTENBETEILIGUNG,'
      '  ANTRAG_KOSTENBEFREIUNG = :ANTRAG_KOSTENBEFREIUNG,'
      '  ORDNUNGSGEMAESS = :ORDNUNGSGEMAESS,'
      '  FAHRTKOSTENBEWILLIGUNG = :FAHRTKOSTENBEWILLIGUNG,'
      '  KOSTENBEFREIUNG = :KOSTENBEFREIUNG,'
      '  KURS_WECHSEL = :KURS_WECHSEL,'
      '  BEHOERDE = :BEHOERDE,'
      '  BERECHTIGUNGS_NR = :BERECHTIGUNGS_NR'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into KURSSCHUELER'
      
        '  (ID, KURS_ID, SCHUELER_ID, ANFANG, ENDE, ANMELDE_DATUM, STORNO' +
        ', '
      'BEMERKUNG, '
      '   SCHUELER_MODUL, KOSTENBETEILIGUNG, ANTRAG_KOSTENBEFREIUNG, '
      'ORDNUNGSGEMAESS, '
      '   FAHRTKOSTENBEWILLIGUNG, KOSTENBEFREIUNG, KURS_WECHSEL, '
      'BEHOERDE, BERECHTIGUNGS_NR)'
      'values'
      '  (:ID, :KURS_ID, :SCHUELER_ID, :ANFANG, :ENDE, :ANMELDE_DATUM, '
      ':STORNO, '
      '   :BEMERKUNG, :SCHUELER_MODUL, :KOSTENBETEILIGUNG, '
      ':ANTRAG_KOSTENBEFREIUNG, '
      '   :ORDNUNGSGEMAESS, :FAHRTKOSTENBEWILLIGUNG, :KOSTENBEFREIUNG, '
      ':KURS_WECHSEL, '
      '   :BEHOERDE, :BERECHTIGUNGS_NR)')
    DeleteSQL.Strings = (
      'delete from KURSSCHUELER'
      'where'
      '  ID = :OLD_ID')
    Left = 272
    Top = 128
  end
  object courseQuery: TQuery
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    SQL.Strings = (
      
        'select id, nummer || '#39'-'#39' || halbjahr || '#39'-'#39' || jahr as NUMMER, j' +
        'ahr'
      'from kurse'
      'order by 2'
      ' '
      ' '
      ' ')
    Left = 192
    Top = 176
  end
  object courseSource: TDataSource
    DataSet = courseQuery
    Left = 104
    Top = 176
  end
  object testQuery: TQuery
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    SQL.Strings = (
      'select'#9'ID,'
      #9#9'DATUM,'
      
        #9#9'PRUEFUNG || '#39' '#39' || PRUEFUNGS_NUMMER || '#39' ('#39' || DATUM_STRING ||' +
        ' '#39')'#39' as PRUEFUNG,'
      #9#9'JAHR'
      'from'#9'pruefungen'
      'order by datum, pruefung'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 456
    Top = 184
  end
  object testSource: TDataSource
    DataSet = testQuery
    Left = 368
    Top = 184
  end
  object pupilTestSource: TDataSource
    DataSet = pupilTestQuery
    Left = 368
    Top = 128
  end
  object pupilTestQuery: TQuery
    CachedUpdates = True
    BeforeClose = pupilTestQueryBeforeClose
    AfterInsert = pupilTestQueryAfterInsert
    BeforePost = pupilTestQueryBeforePost
    AfterPost = pupilTestQueryAfterPost
    AfterDelete = pupilTestQueryAfterPost
    AutoRefresh = True
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
    Filtered = True
    RequestLive = True
    SQL.Strings = (
      'select'#9'ps.*,'
      
        #9#9'p.PRUEFUNG || '#39' '#39' || p.PRUEFUNGS_NUMMER || '#39' ('#39' || DATUM_STRIN' +
        'G || '#39')'#39' as PRUEFUNG,'
      #9#9'p.DATUM,'
      #9#9'p.JAHR'
      'from'#9'pruefschueler ps, pruefungen p'
      'where'#9'ps.schueler_id = :thePupil and'
      #9#9'ps.pruef_id = p.id'
      'order by datum, pruefung'
      ' ')
    UpdateObject = UpdateSQLTest
    Left = 456
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'thePupil'
        ParamType = ptInput
      end>
    object pupilTestQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'KLARODB."pruefschueler.DB".ID'
    end
    object pupilTestQueryPRUEF_ID: TIntegerField
      FieldName = 'PRUEF_ID'
      Origin = 'KLARODB."pruefschueler.DB".PRUEF_ID'
    end
    object pupilTestQuerySCHUELER_ID: TIntegerField
      FieldName = 'SCHUELER_ID'
      Origin = 'KLARODB."pruefschueler.DB".SCHUELER_ID'
    end
    object pupilTestQueryBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      Origin = 'KLARODB."pruefschueler.DB".BEMERKUNG'
      BlobType = ftMemo
      Size = 32
    end
    object pupilTestQueryBESTANDEN: TStringField
      DisplayLabel = 'Bestanden'
      FieldName = 'BESTANDEN'
      Origin = 'KLARODB."pruefschueler.DB".BESTANDEN'
      Size = 64
    end
    object pupilTestQueryPRUEFUNG: TStringField
      DisplayLabel = 'Prüfung'
      DisplayWidth = 64
      FieldKind = fkLookup
      FieldName = 'PRUEFUNG'
      LookupDataSet = testQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'PRUEFUNG'
      KeyFields = 'PRUEF_ID'
      Size = 128
      Lookup = True
    end
    object pupilTestQueryDATUM: TDateTimeField
      DisplayLabel = 'Datum/Zeit'
      DisplayWidth = 18
      FieldName = 'DATUM'
      Origin = 'KLARODB."PRUEFUNGEN.DB".DATUM'
    end
    object pupilTestQueryJAHR: TStringField
      FieldName = 'JAHR'
      Origin = 'KLARODB."PRUEFUNGEN.DB".JAHR'
      Size = 4
    end
    object pupilTestQueryKOSTENBETEILIGUNG: TStringField
      DisplayLabel = 'Kostenbeteiligung'
      FieldName = 'KOSTENBETEILIGUNG'
      Origin = 'KLARODB."pruefschueler.DB".KOSTENBETEILIGUNG'
      Size = 32
    end
    object pupilTestQueryBEHOERDE: TStringField
      DisplayLabel = 'Behörde'
      DisplayWidth = 16
      FieldName = 'BEHOERDE'
      Origin = 'KLARODB."pruefschueler.DB".BEHOERDE'
      Size = 32
    end
    object pupilTestQueryBERECHTIGUNGS_NR: TStringField
      DisplayLabel = 'Berechtigungsschein'
      DisplayWidth = 32
      FieldName = 'BERECHTIGUNGS_NR'
      Origin = 'KLARODB."pruefschueler.DB".BERECHTIGUNGS_NR'
      Size = 255
    end
  end
  object UpdateSQLTest: TUpdateSQL
    ModifySQL.Strings = (
      'update pruefschueler'
      'set'
      '  PRUEF_ID = :PRUEF_ID,'
      '  SCHUELER_ID = :SCHUELER_ID,'
      '  BEMERKUNG = :BEMERKUNG,'
      '  BESTANDEN = :BESTANDEN,'
      '  KOSTENBETEILIGUNG = :KOSTENBETEILIGUNG,'
      '  BEHOERDE = :BEHOERDE,'
      '  BERECHTIGUNGS_NR = :BERECHTIGUNGS_NR'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into pruefschueler'
      '  (ID, PRUEF_ID, SCHUELER_ID, BEMERKUNG, BESTANDEN, '
      'KOSTENBETEILIGUNG, '
      '   BEHOERDE, BERECHTIGUNGS_NR)'
      'values'
      '  (:ID, :PRUEF_ID, :SCHUELER_ID, :BEMERKUNG, :BESTANDEN, '
      ':KOSTENBETEILIGUNG, '
      '   :BEHOERDE, :BERECHTIGUNGS_NR)')
    DeleteSQL.Strings = (
      'delete from pruefschueler'
      'where'
      '  ID = :OLD_ID')
    Left = 536
    Top = 128
  end
end
