object EinladungenForm: TEinladungenForm
  Left = 312
  Top = 451
  Width = 943
  Height = 408
  Caption = 'Einladungen'
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
  object DBGridInvitations: TDBGrid
    Left = 0
    Top = 0
    Width = 935
    Height = 340
    Align = alClient
    DataSource = DataSourceInvitations
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridInvitationsCellClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 340
    Width = 935
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtnSelectAll: TBitBtn
      Left = 8
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Alle'
      TabOrder = 0
      OnClick = BitBtnSelectAllClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BitBtnSwap: TBitBtn
      Left = 96
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Umkehren'
      TabOrder = 1
      OnClick = BitBtnSwapClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
    end
    object BitBtnNone: TBitBtn
      Left = 184
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Keine'
      TabOrder = 2
      OnClick = BitBtnNoneClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object ButtonExport: TButton
      Left = 853
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Export'
      TabOrder = 3
      OnClick = ButtonExportClick
    end
  end
  object DataSourceInvitations: TDataSource
    DataSet = QueryInvitations
    Left = 16
    Top = 16
  end
  object QueryInvitations: TQuery
    AfterOpen = QueryInvitationsAfterOpen
    OnCalcFields = QueryInvitationsCalcFields
    DatabaseName = 'KlaroDB'
    OnFilterRecord = QueryInvitationsFilterRecord
    SQL.Strings = (
      'select s.*'
      'from schueler s'
      'where not exists'
      '('
      #9'select *'
      #9'from kursschueler ks, kurse k'
      #9'where ks.schueler_id = s.id'
      #9'and ks.kurs_id = k.id'
      #9'and k.kursart = :kart'
      #9'and k.kurstyp = :ktyp'
      #9'and k.kursabschnitt = :kabschnit'
      ')'
      'and s.abgeschlossen = '#39'N'#39
      'order by s.nachname, s.vorname')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'kart'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ktyp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'kabschnit'
        ParamType = ptInput
      end>
    object QueryInvitationsID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object QueryInvitationsANREDE: TStringField
      DisplayLabel = 'Anrede'
      DisplayWidth = 8
      FieldName = 'ANREDE'
      Size = 32
    end
    object QueryInvitationsNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 16
      FieldName = 'NACHNAME'
      Size = 64
    end
    object QueryInvitationsVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 16
      FieldName = 'VORNAME'
      Size = 64
    end
    object QueryInvitationsWOHNUNG: TStringField
      DisplayLabel = 'c/o'
      DisplayWidth = 16
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object QueryInvitationsSTRASSE: TStringField
      DisplayLabel = 'Straﬂe'
      DisplayWidth = 20
      FieldName = 'STRASSE'
      Size = 128
    end
    object QueryInvitationsLAND: TStringField
      DisplayLabel = 'Land'
      FieldName = 'LAND'
      Size = 3
    end
    object QueryInvitationsPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object QueryInvitationsORT: TStringField
      DisplayLabel = 'Ort'
      DisplayWidth = 16
      FieldName = 'ORT'
      Size = 64
    end
    object QueryInvitationsE_MAIL: TStringField
      DisplayLabel = 'E-Mail'
      DisplayWidth = 20
      FieldName = 'E_MAIL'
      Size = 64
    end
    object QueryInvitationsSELECTED: TBooleanField
      DisplayLabel = 'Einladen'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      OnGetText = QueryInvitationsSELECTEDGetText
      Calculated = True
    end
  end
end
