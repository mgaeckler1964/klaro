object MainForm: TMainForm
  Left = 451
  Top = 304
  Width = 489
  Height = 405
  Caption = 'Klaro'
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0BB1111111BBBBBBBBBBBB00000000000BB1111111BBBBBBBBBBBB0000000000
    0BB1111111BBBBBBBBBBBB00000000000BB1111111BBBBBBBBBBBB0000000000
    0BB1111111BBBBBBBBBBBB00000000000BB1111111BBBBBBBBBBBB0000000000
    0BB1111111BBBBBBBBBBBB00000000000BB1111111BBBBBBBBBBBB0000000000
    0BB1111111BBCCCCCCCBBB00000000000BB1111111BBCCCCCCCBBB0000000000
    0BB1111111BBCCCCCCCBBB00000000000BBBBBBBBBBBCCCCCCCBBB0000000000
    0BBBBBBBBBBBCCCCCCCBBB00000000000BBBBBBBBBBBCCCCCCCBBB0000000000
    0BBBBBBBBBBBCCCCCCCBBB00000000000BBBBBBBBBBBCCCCCCCBBB0000000000
    0BBBBBBBBBBBCCCCCCCBBB00000000000BBBBBBBBBBBBBBBBBBBBB0000000000
    0BBBBBBBBBBBBBBBBBBBBB00000000000BBBBBBBBBBBBBBBBBBBBB0000000000
    0999999999999999999999000000000000999999999999999999900000000000
    0009999999999999999900000000000000009999999999999990000000000000
    0000099999999999999000000000000000000099999999990990000000000000
    0000000999999990099000000000000000000000999999000990000000000000
    0000000009990000000000000000000000000000009000000000000000000000
    000000000000000000000000000000000000000000000000000000000000F800
    003FF800003FF800003FF800003FF800003FF800003FF800003FF800003FF800
    003FF800003FF800003FF800003FF800003FF800003FF800003FF800003FF800
    003FF800003FF800003FF800003FF800003FFC00007FFE0000FFFF0001FFFF80
    01FFFFC009FFFFE019FFFFF039FFFFF8FFFFFFFDFFFFFFFFFFFFFFFFFFFF}
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  WindowMenu = Fenster1
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 481
    Height = 29
    Caption = 'ToolBar1'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object SpeedButtonExit: TSpeedButton
      Left = 0
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Ende'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = Ende1Click
    end
    object SpeedButtonKurse: TSpeedButton
      Left = 23
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Kurse'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000B1111BBBBB
        B00000B1111BBBBBB00000B1111BBBBBB00000B1111BBBBBB00000B1111BCCCB
        B00000B1111BCCCBB00000BBBBBBCCCBB00000BBBBBBCCCBB00000BBBBBBCCCB
        B00000BBBBBBBBBBB00000999999999990000009999999990000000099999990
        0000000009999090000000000099000000000000000000000000}
      OnClick = SpeedButtonKurseClick
    end
    object SpeedButtonPruefungen: TSpeedButton
      Left = 46
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Prüfungen'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        0000000000000000000000FFFFFFFF00000000FFFF777F00000000FFFFFFFF00
        000000FFFFFFFF00000000F777FFFF00000000FFFFFFFF00000000F777777F00
        000000FFFFFFFF00000000F7777FFF00000000FFFFFFFF00000000F777777F00
        000000FFFFFFFF00000000000000000000000000000000000000}
      OnClick = SpeedButtonPruefungenClick
    end
    object SpeedButtonSchueler: TSpeedButton
      Left = 69
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Schüler'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00001000000000
        0000000100113110001000111133333101000001133111331100000133333313
        3100001133311133311000113331113331100001333313331110001133331333
        1100000133C333C3110000001333333311000001113131311000000011111111
        1100000000111110000000000011000000000000000000000000}
      OnClick = SpeedButtonSchuelerClick
    end
    object SpeedButtonLehrer: TSpeedButton
      Left = 92
      Top = 2
      Width = 23
      Height = 22
      Hint = 'Lehrer'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000033331
        1000000000033311110000000013311111100000013311111111001333311131
        1111000133311111111000133331111111110013333111113111001333333111
        111000013331131111110000C331111111100000031311111110000003111111
        1110000003113311110000000011111011000000000011110000}
      OnClick = SpeedButtonLehrerClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 340
    Width = 481
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = False
  end
  object MainMenu: TMainMenu
    Left = 48
    Top = 48
    object Datei1: TMenuItem
      Caption = '&Datei'
      object Lizenz1: TMenuItem
        Caption = 'Li&zenz...'
        OnClick = Lizenz1Click
      end
      object Stammdaten1: TMenuItem
        Caption = 'Stammdaten...'
        OnClick = Stammdaten1Click
      end
      object Lehrbcher1: TMenuItem
        Caption = 'Lehrbücher...'
        OnClick = Lehrbcher1Click
      end
      object Ferien: TMenuItem
        Caption = 'Ferien...'
        OnClick = FerienClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Einstellungen1: TMenuItem
        Caption = 'Einstellungen...'
        OnClick = Einstellungen1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ExImport1: TMenuItem
        Caption = 'Ex-/Import...'
        OnClick = ExImport1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Ende1: TMenuItem
        Caption = '&Ende'
        Hint = 'Beendet das Programm'
        OnClick = Ende1Click
      end
    end
    object Auswertung2: TMenuItem
      Caption = 'Auswertung'
      object Kursplan: TMenuItem
        Caption = 'Kurs&plan...'
        OnClick = KursplanClick
      end
      object Kurswechsler: TMenuItem
        Caption = 'Kurs&wechsler'
        OnClick = KurswechslerClick
      end
      object Zahlungen: TMenuItem
        Caption = '&Zahlungen'
        OnClick = ZahlungenClick
      end
      object OffeneZahlungen: TMenuItem
        Caption = '&Offene Zahlungen'
        OnClick = OffeneZahlungenClick
      end
      object Ueberlappungen: TMenuItem
        Caption = 'Ü&berlappungen'
        OnClick = UeberlappungenClick
      end
      object Lehrzeiten: TMenuItem
        Caption = '&Lehrzeiten'
        OnClick = LehrzeitenClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SRXReports1: TMenuItem
        AutoHotkeys = maManual
        Caption = 'SRX Reports'
      end
    end
    object Fenster1: TMenuItem
      Caption = '&Fenster'
      object Anordnen1: TMenuItem
        Caption = 'Ü&berlappend'
        Hint = 'Zeigt überlappende Fenster'
        OnClick = Anordnen1Click
      end
      object Nebeneinander1: TMenuItem
        Caption = '&Nebeneinander'
        Hint = 'Zeigt alle Fenster nebeneinander'
        OnClick = Nebeneinander1Click
      end
      object bereinander1: TMenuItem
        Caption = 'Üb&ereinander'
        Hint = 'Zeigt alle Fenster übereinander'
        OnClick = bereinander1Click
      end
      object Symboleanordnen1: TMenuItem
        Caption = '&Symbole anordnen'
        Hint = 'Ordnet alle Symbole'
        OnClick = Symboleanordnen1Click
      end
    end
    object berKlaro1: TMenuItem
      Caption = 'Über &Klaro!'
      OnClick = berKlaro1Click
    end
  end
  object theDatabase: TDatabase
    AliasName = 'KLARO'
    DatabaseName = 'KlaroDB'
    SessionName = 'Default'
    AfterConnect = theDatabaseAfterConnect
    OnLogin = theDatabaseLogin
    Left = 112
    Top = 48
  end
  object theTimer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = theTimerTimer
    Left = 176
    Top = 48
  end
  object StoredProcUpdateData: TStoredProc
    DatabaseName = 'KlaroDB'
    StoredProcName = 'UPDATEDATA'
    Left = 112
    Top = 96
  end
end
