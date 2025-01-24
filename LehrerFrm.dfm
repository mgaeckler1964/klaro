object LehrerForm: TLehrerForm
  Tag = 1
  Left = 370
  Top = 194
  Width = 796
  Height = 463
  HorzScrollBar.ButtonSize = 16
  HorzScrollBar.Range = 625
  HorzScrollBar.Size = 16
  VertScrollBar.ButtonSize = 16
  VertScrollBar.Range = 425
  VertScrollBar.Size = 16
  AutoScroll = False
  Caption = 'Lehrer'
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000133333331101000000000000000000001333333111011110000000
    0000000000133333311111110000000000000000011333331111111111000000
    0000000011333331311111111100000000000001133333311111111101010000
    0000001133333111111111310101000000111113333313311111111101110000
    0113333333311111131111111111000001133333333113113131111111100000
    0011133333311111313111111110000001111133333131113111111111100000
    0133333333313111111131111111000011333333333131131111111111100000
    1133333333111111111113111111000001333333331111111111331111110000
    0133333333131311111131111110000000133333331111111131311111110000
    0001133333111113111111111111000000001333331131131331111111100000
    00001CC3331111311111111111100000000000C3311311311311111111100000
    000000C331131111111111111100000000000013311111113111111111000000
    0000001331111111111111111100000000000011313131311111111101000000
    0000001311311313111111111000000000000001113131311111111110000000
    0000000011111111111001010000000000000000101101000001111000000000
    000000000000010101010000000000000000000000000000000000000000FFFC
    00BFFFFC0087FFFC000FFFF80003FFF00003FFE0000AFFC0000AFC000008F800
    0000F8000001FC000001F8000001F8000000F0000001F0000000F8000000F800
    0001FC000000FE000000FF000001FF000001FF800001FFC00003FFC00003FFC0
    0003FFC0000BFFC00007FFE00007FFF001AFFFF4BE1FFFFFAAFFFFFFFFFF}
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 289
    Top = 41
    Width = 3
    Height = 395
    Cursor = crHSplit
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 289
    Height = 395
    Align = alLeft
    DataSource = DataSourceTeacher
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label23: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Suche:'
    end
    object SpeedButtonRefresh: TSpeedButton
      Left = 529
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
      Left = 304
      Top = 8
      Width = 225
      Height = 25
      DataSource = DataSourceTeacher
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object SearchEdit: TEdit
      Left = 48
      Top = 8
      Width = 241
      Height = 21
      TabOrder = 1
      OnChange = SearchEditChange
    end
  end
  object Panel2: TPanel
    Left = 292
    Top = 41
    Width = 496
    Height = 395
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 496
      Height = 372
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Anschrift'
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'Nachname'
          FocusControl = DBEditNACHNAME
        end
        object Label2: TLabel
          Left = 322
          Top = 48
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Vorname'
          FocusControl = DBEditVORNAME
        end
        object Label12: TLabel
          Left = 166
          Top = 8
          Width = 51
          Height = 13
          Caption = 'Akad. Titel'
          FocusControl = DBEditAKAD_TITEL
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 17
          Height = 13
          Caption = 'c/o'
          FocusControl = DBEditWOHNUNG
        end
        object Label4: TLabel
          Left = 8
          Top = 128
          Width = 31
          Height = 13
          Caption = 'Straße'
          FocusControl = DBEditSTRASSE
        end
        object Label5: TLabel
          Left = 8
          Top = 168
          Width = 24
          Height = 13
          Caption = 'Land'
          FocusControl = DBEditLAND
        end
        object Label6: TLabel
          Left = 40
          Top = 168
          Width = 20
          Height = 13
          Caption = 'PLZ'
          FocusControl = DBEditPLZ
        end
        object Label7: TLabel
          Left = 166
          Top = 168
          Width = 14
          Height = 13
          Caption = 'Ort'
          FocusControl = DBEditORT
        end
        object Label8: TLabel
          Left = 8
          Top = 208
          Width = 48
          Height = 13
          Caption = 'Tel. Privat'
          FocusControl = DBEditTEL_PRIV
        end
        object Label9: TLabel
          Left = 166
          Top = 208
          Width = 43
          Height = 13
          Caption = 'Tel. Büro'
          FocusControl = DBEditTEL_BUERO
        end
        object Label11: TLabel
          Left = 8
          Top = 248
          Width = 54
          Height = 13
          Caption = 'Faxnummer'
          FocusControl = DBEditTEL_FAX
        end
        object Label10: TLabel
          Left = 166
          Top = 248
          Width = 46
          Height = 13
          Caption = 'Tel. Mobil'
          FocusControl = DBEditTEL_MOBIL
        end
        object Label15: TLabel
          Left = 8
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Anrede'
        end
        object Label22: TLabel
          Left = 8
          Top = 288
          Width = 66
          Height = 13
          Caption = 'E-Mailadresse'
        end
        object SpeedButtonEmail: TSpeedButton
          Left = 444
          Top = 300
          Width = 23
          Height = 22
          Hint = 'Schickt eine E-Mail an den Lehrer'
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
            000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
            FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
            FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
            9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
            0000777777777777777733333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = SpeedButtonEmailClick
        end
        object DBEditNACHNAME: TDBEdit
          Left = 8
          Top = 60
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NACHNAME'
          DataSource = DataSourceTeacher
          TabOrder = 3
        end
        object DBEditVORNAME: TDBEdit
          Left = 322
          Top = 60
          Width = 150
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'VORNAME'
          DataSource = DataSourceTeacher
          TabOrder = 4
        end
        object DBEditAKAD_TITEL: TDBEdit
          Left = 166
          Top = 20
          Width = 150
          Height = 21
          DataField = 'AKAD_TITEL'
          DataSource = DataSourceTeacher
          TabOrder = 1
        end
        object DBEditWOHNUNG: TDBEdit
          Left = 8
          Top = 100
          Width = 464
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'WOHNUNG'
          DataSource = DataSourceTeacher
          TabOrder = 5
        end
        object DBEditSTRASSE: TDBEdit
          Left = 8
          Top = 140
          Width = 464
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'STRASSE'
          DataSource = DataSourceTeacher
          TabOrder = 6
        end
        object DBEditLAND: TDBEdit
          Left = 8
          Top = 180
          Width = 30
          Height = 21
          DataField = 'LAND'
          DataSource = DataSourceTeacher
          TabOrder = 7
        end
        object DBEditPLZ: TDBEdit
          Left = 40
          Top = 180
          Width = 117
          Height = 21
          DataField = 'PLZ'
          DataSource = DataSourceTeacher
          TabOrder = 8
        end
        object DBEditORT: TDBEdit
          Left = 166
          Top = 180
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ORT'
          DataSource = DataSourceTeacher
          TabOrder = 9
        end
        object DBEditTEL_PRIV: TDBEdit
          Left = 8
          Top = 220
          Width = 150
          Height = 21
          DataField = 'TEL_PRIV'
          DataSource = DataSourceTeacher
          TabOrder = 10
        end
        object DBEditTEL_BUERO: TDBEdit
          Left = 166
          Top = 220
          Width = 150
          Height = 21
          DataField = 'TEL_BUERO'
          DataSource = DataSourceTeacher
          TabOrder = 11
        end
        object DBEditTEL_FAX: TDBEdit
          Left = 8
          Top = 260
          Width = 150
          Height = 21
          DataField = 'TEL_FAX'
          DataSource = DataSourceTeacher
          TabOrder = 12
        end
        object DBEditTEL_MOBIL: TDBEdit
          Left = 166
          Top = 260
          Width = 150
          Height = 21
          DataField = 'TEL_MOBIL'
          DataSource = DataSourceTeacher
          TabOrder = 13
        end
        object DBEditE_MAIL: TDBEdit
          Left = 8
          Top = 300
          Width = 437
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'E_MAIL'
          DataSource = DataSourceTeacher
          TabOrder = 14
        end
        object DBComboBoxAnrede: TDBComboBox
          Left = 8
          Top = 20
          Width = 150
          Height = 21
          DataField = 'ANREDE'
          DataSource = DataSourceTeacher
          ItemHeight = 13
          Items.Strings = (
            'Herr'
            'Frau')
          TabOrder = 0
        end
        object DBRadioGroupSex: TDBRadioGroup
          Left = 328
          Top = 12
          Width = 145
          Height = 33
          Columns = 2
          Ctl3D = True
          DataField = 'GESCHLECHT'
          DataSource = DataSourceTeacher
          Items.Strings = (
            'männlich'
            'weiblich')
          ParentCtl3D = False
          TabOrder = 2
          TabStop = True
          Values.Strings = (
            'm'
            'w')
          OnExit = DBRadioGroupSexExit
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Info'
        ImageIndex = 1
        object Label14: TLabel
          Left = 8
          Top = 168
          Width = 54
          Height = 13
          Caption = 'Bemerkung'
        end
        object LabelSprachverbandsabschluss: TLabel
          Left = 168
          Top = 48
          Width = 121
          Height = 13
          Caption = 'Sprachverbandsabschluß'
          FocusControl = DBEditSV_ABSCHLUSS
        end
        object Label16: TLabel
          Left = 8
          Top = 8
          Width = 68
          Height = 13
          Caption = 'Vertragsdatum'
        end
        object Label17: TLabel
          Left = 6
          Top = 48
          Width = 71
          Height = 13
          Caption = 'Einstiegsdatum'
        end
        object LabelDAFErfahrungseit: TLabel
          Left = 166
          Top = 8
          Width = 89
          Height = 13
          Caption = 'DAF Erfahrung seit'
        end
        object Label19: TLabel
          Left = 166
          Top = 128
          Width = 53
          Height = 13
          Caption = 'Nationalität'
        end
        object Label20: TLabel
          Left = 8
          Top = 88
          Width = 66
          Height = 13
          Caption = 'Geburtsdatum'
        end
        object Label21: TLabel
          Left = 8
          Top = 128
          Width = 49
          Height = 13
          Caption = 'Geburtsort'
        end
        object LabelBAMFZulassungsnummer: TLabel
          Left = 168
          Top = 88
          Width = 123
          Height = 13
          Caption = 'BAMF Zulassungsnummer'
        end
        object DBMemoBEMERKUNG: TDBMemo
          Left = 8
          Top = 184
          Width = 470
          Height = 158
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'BEMERKUNG'
          DataSource = DataSourceTeacher
          TabOrder = 8
        end
        object DBEditSV_ABSCHLUSS: TDBEdit
          Left = 168
          Top = 60
          Width = 150
          Height = 21
          DataField = 'SV_ABSCHLUSS'
          DataSource = DataSourceTeacher
          TabOrder = 3
        end
        object DBEditGEBURTSDATUM: TDBEdit
          Left = 8
          Top = 100
          Width = 150
          Height = 21
          DataField = 'GEBURTSDATUM'
          DataSource = DataSourceTeacher
          TabOrder = 4
        end
        object DBEditNATIONALITAET: TDBEdit
          Left = 166
          Top = 140
          Width = 150
          Height = 21
          DataField = 'NATIONALITAET'
          DataSource = DataSourceTeacher
          TabOrder = 7
        end
        object DBEditVERTRAG: TDBEdit
          Left = 8
          Top = 20
          Width = 150
          Height = 21
          DataField = 'VERTRAG'
          DataSource = DataSourceTeacher
          TabOrder = 0
        end
        object DBEditGEBURTSORT: TDBEdit
          Left = 8
          Top = 140
          Width = 150
          Height = 21
          DataField = 'GEBURTSORT'
          DataSource = DataSourceTeacher
          TabOrder = 6
        end
        object DBEditEINSTIEG: TDBEdit
          Left = 6
          Top = 60
          Width = 150
          Height = 21
          DataField = 'EINSTIEG'
          DataSource = DataSourceTeacher
          TabOrder = 2
        end
        object DBEditDAF_ERFAHRUNG: TDBEdit
          Left = 166
          Top = 20
          Width = 150
          Height = 21
          DataField = 'DAF_ERFAHRUNG'
          DataSource = DataSourceTeacher
          TabOrder = 1
        end
        object DBEditBAMF_NUMMER: TDBEdit
          Left = 168
          Top = 100
          Width = 153
          Height = 21
          DataField = 'BAMF_NUMMER'
          DataSource = DataSourceTeacher
          TabOrder = 5
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 372
      Width = 496
      Height = 23
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonCourses: TButton
        Left = -4
        Top = 0
        Width = 75
        Height = 24
        Hint = 'Öffnet die Kurse des Lehrers'
        Caption = 'Kurse...'
        TabOrder = 0
        OnClick = ButtonCoursesClick
      end
    end
  end
  object DataSourceTeacher: TDataSource
    DataSet = TableTeacher
    Left = 199
    Top = 109
  end
  object TableTeacher: TTable
    AfterInsert = TableTeacherAfterInsert
    BeforePost = TableTeacherBeforePost
    DatabaseName = 'KlaroDB'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ANREDE'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'GESCHLECHT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NACHNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHNUNG'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'STRASSE'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LAND'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_PRIV'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_BUERO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_MOBIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TEL_FAX'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'GEBURTSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'GEBURTSORT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NATIONALITAET'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AKAD_TITEL'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SV_ABSCHLUSS'
        DataType = ftDateTime
      end
      item
        Name = 'DAF_ERFAHRUNG'
        DataType = ftDateTime
      end
      item
        Name = 'EINSTIEG'
        DataType = ftDateTime
      end
      item
        Name = 'VERTRAG'
        DataType = ftDateTime
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'teacherQueryIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'LEHRER_NAME_IDX'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'LEHRER_NAME_IDX'
    StoreDefs = True
    TableName = 'LEHRER'
    Left = 104
    Top = 112
    object TableTeacherID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TableTeacherNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 20
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object TableTeacherVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 20
      FieldName = 'VORNAME'
      Size = 64
    end
    object TableTeacherWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object TableTeacherSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object TableTeacherLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object TableTeacherPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object TableTeacherORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object TableTeacherANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object TableTeacherTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object TableTeacherTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object TableTeacherTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object TableTeacherTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object TableTeacherE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 128
    end
    object TableTeacherGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object TableTeacherGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object TableTeacherNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object TableTeacherAKAD_TITEL: TStringField
      FieldName = 'AKAD_TITEL'
      Size = 32
    end
    object TableTeacherSV_ABSCHLUSS: TDateTimeField
      FieldName = 'SV_ABSCHLUSS'
    end
    object TableTeacherDAF_ERFAHRUNG: TDateTimeField
      FieldName = 'DAF_ERFAHRUNG'
    end
    object TableTeacherEINSTIEG: TDateTimeField
      FieldName = 'EINSTIEG'
    end
    object TableTeacherVERTRAG: TDateTimeField
      FieldName = 'VERTRAG'
    end
    object TableTeacherBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object TableTeacherGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object TableTeacherBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 64
    end
  end
end
