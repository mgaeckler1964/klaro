object SchuelerForm: TSchuelerForm
  Tag = 2
  Left = 848
  Top = 147
  Width = 742
  Height = 606
  HorzScrollBar.ButtonSize = 16
  HorzScrollBar.Range = 630
  HorzScrollBar.Size = 16
  VertScrollBar.ButtonSize = 16
  VertScrollBar.Increment = 38
  VertScrollBar.Range = 420
  VertScrollBar.Size = 16
  AutoScroll = False
  Caption = 'Schüler'
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000011100000000000000000
    0000000001113331110000000000000000000000133333333310000000000000
    0000000133333333333100000000000000000013333311333333100000000000
    0000013333111111333331000000000000000133313333331333310000000000
    0000133313333333313333100000000000001333333311133333331000000000
    0000133333310001333333100000000000003333333100013333330000000000
    0000333333310001333333000000000000003333333310133333330000000000
    0000333333331013333330000000000000003333333331333333300000000000
    0000333333333133333330000000000000003333CC3331333CC3300000000000
    00001333CC3333333CC330000000000000000333333333333333300000000000
    0000033333333333030300000000000000000033303303333333000000000000
    0000000033303330030000000000000000000000303003003300000000000000
    0000000000003030300000000000000000000000000000000000000000000000
    0000000000010000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFF1FFFFFF803F7EFF001E7E7E000E5E3C00061E1800021F1800021F100
    0001F200000BF200E001F000E00BF000E00BF0004003F0004003F2000003F000
    0003F0000003F0000003F0000007F0000007F0000007F800000FFC00000FFE00
    000FFF00001FFF80017FFFA000FFFF8000FFFFE97FFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 292
    Top = 41
    Width = 3
    Height = 538
    Cursor = crHSplit
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 292
    Height = 538
    Align = alLeft
    DataSource = DataSourcePupil
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
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VORNAME'
        Width = 130
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
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
    object DBTextAENDERUNGSDATUM: TDBText
      Left = 560
      Top = 8
      Width = 73
      Height = 17
      DataField = 'AENDERUNGSDATUM'
      DataSource = DataSourcePupil
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
    object DBTextAENDERUNG_VON: TDBText
      Left = 560
      Top = 24
      Width = 65
      Height = 17
      DataField = 'AENDERUNG_VON'
      DataSource = DataSourcePupil
    end
    object DBNavigator: TDBNavigator
      Left = 304
      Top = 8
      Width = 225
      Height = 25
      DataSource = DataSourcePupil
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
    object ButtonFilter: TButton
      Left = 632
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alle anzeigen'
      TabOrder = 2
      OnClick = ButtonFilterClick
    end
  end
  object Panel2: TPanel
    Left = 295
    Top = 41
    Width = 439
    Height = 538
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 439
      Height = 504
      ActivePage = TabSheetAnschrift
      Align = alClient
      TabOrder = 0
      object TabSheetAnschrift: TTabSheet
        Caption = 'Anschrift'
        object Label1: TLabel
          Left = 8
          Top = 88
          Width = 52
          Height = 13
          Caption = 'Nachname'
          FocusControl = DBEditNACHNAME
        end
        object Label2: TLabel
          Left = 268
          Top = 88
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Vorname'
          FocusControl = DBEditVORNAME
        end
        object Label3: TLabel
          Left = 8
          Top = 128
          Width = 17
          Height = 13
          Caption = 'c/o'
          FocusControl = DBEditWOHNUNG
        end
        object Label4: TLabel
          Left = 8
          Top = 168
          Width = 31
          Height = 13
          Caption = 'Straße'
          FocusControl = DBEditSTRASSE
        end
        object Label5: TLabel
          Left = 8
          Top = 208
          Width = 24
          Height = 13
          Caption = 'Land'
          FocusControl = DBEditLAND
        end
        object Label6: TLabel
          Left = 40
          Top = 208
          Width = 20
          Height = 13
          Caption = 'PLZ'
          FocusControl = DBEditPLZ
        end
        object Label7: TLabel
          Left = 166
          Top = 208
          Width = 14
          Height = 13
          Caption = 'Ort'
          FocusControl = DBEditORT
        end
        object Label8: TLabel
          Left = 8
          Top = 248
          Width = 48
          Height = 13
          Caption = 'Tel. Privat'
          FocusControl = DBEditTEL_PRIV
        end
        object Label9: TLabel
          Left = 166
          Top = 248
          Width = 43
          Height = 13
          Caption = 'Tel. Büro'
          FocusControl = DBEditTEL_BUERO
        end
        object Label11: TLabel
          Left = 8
          Top = 288
          Width = 54
          Height = 13
          Caption = 'Faxnummer'
          FocusControl = DBEditTEL_FAX
        end
        object Label10: TLabel
          Left = 166
          Top = 288
          Width = 46
          Height = 13
          Caption = 'Tel. Mobil'
          FocusControl = DBEditTEL_MOBIL
        end
        object Label15: TLabel
          Left = 8
          Top = 48
          Width = 34
          Height = 13
          Caption = 'Anrede'
        end
        object SpeedButtonEmail: TSpeedButton
          Left = 390
          Top = 340
          Width = 23
          Height = 22
          Hint = 'Schickt eine E-Mail an den Schüler'
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
        object Label22: TLabel
          Left = 8
          Top = 328
          Width = 66
          Height = 13
          Caption = 'E-Mailadresse'
        end
        object Label36: TLabel
          Left = 8
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Anmeldedatum'
        end
        object Label49: TLabel
          Left = 136
          Top = 8
          Width = 79
          Height = 13
          Caption = 'Rückgabedatum'
        end
        object DBEditNACHNAME: TDBEdit
          Left = 8
          Top = 100
          Width = 252
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NACHNAME'
          DataSource = DataSourcePupil
          TabOrder = 5
        end
        object DBEditVORNAME: TDBEdit
          Left = 268
          Top = 100
          Width = 150
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'VORNAME'
          DataSource = DataSourcePupil
          TabOrder = 6
        end
        object DBEditWOHNUNG: TDBEdit
          Left = 8
          Top = 140
          Width = 408
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'WOHNUNG'
          DataSource = DataSourcePupil
          TabOrder = 7
        end
        object DBEditSTRASSE: TDBEdit
          Left = 8
          Top = 180
          Width = 408
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'STRASSE'
          DataSource = DataSourcePupil
          TabOrder = 8
        end
        object DBEditLAND: TDBEdit
          Left = 8
          Top = 220
          Width = 30
          Height = 21
          DataField = 'LAND'
          DataSource = DataSourcePupil
          TabOrder = 9
        end
        object DBEditPLZ: TDBEdit
          Left = 40
          Top = 220
          Width = 117
          Height = 21
          DataField = 'PLZ'
          DataSource = DataSourcePupil
          TabOrder = 10
        end
        object DBEditORT: TDBEdit
          Left = 166
          Top = 220
          Width = 252
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ORT'
          DataSource = DataSourcePupil
          TabOrder = 11
        end
        object DBEditTEL_PRIV: TDBEdit
          Left = 8
          Top = 260
          Width = 150
          Height = 21
          DataField = 'TEL_PRIV'
          DataSource = DataSourcePupil
          TabOrder = 12
        end
        object DBEditTEL_BUERO: TDBEdit
          Left = 166
          Top = 260
          Width = 150
          Height = 21
          DataField = 'TEL_BUERO'
          DataSource = DataSourcePupil
          TabOrder = 13
        end
        object DBEditTEL_FAX: TDBEdit
          Left = 8
          Top = 300
          Width = 150
          Height = 21
          DataField = 'TEL_FAX'
          DataSource = DataSourcePupil
          TabOrder = 14
        end
        object DBEditTEL_MOBIL: TDBEdit
          Left = 166
          Top = 300
          Width = 150
          Height = 21
          DataField = 'TEL_MOBIL'
          DataSource = DataSourcePupil
          TabOrder = 15
        end
        object DBEditE_MAIL: TDBEdit
          Left = 8
          Top = 340
          Width = 383
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'E_MAIL'
          DataSource = DataSourcePupil
          TabOrder = 16
        end
        object DBRadioGroupSex: TDBRadioGroup
          Left = 168
          Top = 48
          Width = 145
          Height = 33
          Columns = 2
          Ctl3D = True
          DataField = 'GESCHLECHT'
          DataSource = DataSourcePupil
          Items.Strings = (
            'männlich'
            'weiblich')
          ParentCtl3D = False
          TabOrder = 4
          TabStop = True
          Values.Strings = (
            'm'
            'w')
          OnExit = DBRadioGroupSexExit
        end
        object DBComboBoxAnrede: TDBComboBox
          Left = 8
          Top = 60
          Width = 150
          Height = 21
          DataField = 'ANREDE'
          DataSource = DataSourcePupil
          ItemHeight = 13
          Items.Strings = (
            'Herr'
            'Frau')
          TabOrder = 3
        end
        object DBEditANMELDE_DATUM: TDBEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 21
          DataField = 'ANMELDE_DATUM'
          DataSource = DataSourcePupil
          TabOrder = 0
        end
        object DBCheckBoxABGESCHLOSSEN: TDBCheckBox
          Left = 320
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Abgeschlossen'
          DataField = 'ABGESCHLOSSEN'
          DataSource = DataSourcePupil
          DragCursor = crHandPoint
          TabOrder = 2
          ValueChecked = 'J'
          ValueUnchecked = 'N'
        end
        object DBEditRUECKGABE_DATUM: TDBEdit
          Left = 136
          Top = 24
          Width = 121
          Height = 21
          DataField = 'RUECKGABE_DATUM'
          DataSource = DataSourcePupil
          TabOrder = 1
        end
      end
      object TabSheetInfo: TTabSheet
        Caption = 'Info'
        ImageIndex = 1
        object Label20: TLabel
          Left = 8
          Top = 208
          Width = 66
          Height = 13
          Caption = 'Geburtsdatum'
        end
        object Label21: TLabel
          Left = 168
          Top = 208
          Width = 49
          Height = 13
          Caption = 'Geburtsort'
        end
        object Label19: TLabel
          Left = 8
          Top = 248
          Width = 53
          Height = 13
          Caption = 'Nationalität'
        end
        object Label14: TLabel
          Left = 8
          Top = 332
          Width = 54
          Height = 13
          Caption = 'Bemerkung'
        end
        object Label12: TLabel
          Left = 8
          Top = 168
          Width = 25
          Height = 13
          Caption = 'Beruf'
        end
        object Label13: TLabel
          Left = 265
          Top = 168
          Width = 76
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Tätigkeit/Status'
        end
        object Label16: TLabel
          Left = 8
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Prüfungen'
        end
        object Label17: TLabel
          Left = 8
          Top = 48
          Width = 50
          Height = 13
          Caption = 'Einstufung'
        end
        object Label18: TLabel
          Left = 8
          Top = 288
          Width = 151
          Height = 13
          Caption = 'Woher kennt er/sie die Schule?'
        end
        object LabelAuslaenderstatus: TLabel
          Left = 168
          Top = 248
          Width = 75
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Ausländerstatus'
        end
        object LabelISCEDLevel: TLabel
          Left = 299
          Top = 8
          Width = 61
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'ISCED Level'
        end
        object LabelSchuljahre: TLabel
          Left = 370
          Top = 8
          Width = 50
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Schuljahre'
        end
        object Label28: TLabel
          Left = 8
          Top = 88
          Width = 73
          Height = 13
          Caption = 'Kursmodul (1-9)'
        end
        object Label29: TLabel
          Left = 136
          Top = 88
          Width = 92
          Height = 13
          Caption = 'Empfohlene Kursart'
        end
        object LabelSchreibfaehigkeit: TLabel
          Left = 8
          Top = 128
          Width = 76
          Height = 13
          Caption = 'Schreibfähigkeit'
        end
        object DBEditGEBURTSDATUM: TDBEdit
          Left = 8
          Top = 220
          Width = 150
          Height = 21
          DataField = 'GEBURTSDATUM'
          DataSource = DataSourcePupil
          TabOrder = 9
        end
        object DBEditGEBURTSORT: TDBEdit
          Left = 168
          Top = 220
          Width = 249
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'GEBURTSORT'
          DataSource = DataSourcePupil
          TabOrder = 10
        end
        object DBEditNATIONALITAET: TDBEdit
          Left = 8
          Top = 260
          Width = 150
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NATIONALITAET'
          DataSource = DataSourcePupil
          TabOrder = 11
        end
        object DBMemoBEMERKUNG: TDBMemo
          Left = 8
          Top = 344
          Width = 410
          Height = 125
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataField = 'BEMERKUNG'
          DataSource = DataSourcePupil
          TabOrder = 14
        end
        object DBEditBERUF: TDBEdit
          Left = 8
          Top = 180
          Width = 249
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BERUF'
          DataSource = DataSourcePupil
          TabOrder = 7
        end
        object DBEditPRUEFUNGEN: TDBEdit
          Left = 8
          Top = 20
          Width = 284
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'PRUEFUNGEN'
          DataSource = DataSourcePupil
          TabOrder = 0
        end
        object DBEditEINSTUFUNG: TDBEdit
          Left = 8
          Top = 60
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'EINSTUFUNG'
          DataSource = DataSourcePupil
          TabOrder = 3
        end
        object DBEditWOHER: TDBEdit
          Left = 8
          Top = 300
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'WOHER'
          DataSource = DataSourcePupil
          TabOrder = 13
        end
        object DBComboBoxTAETIGKEIT: TDBComboBox
          Left = 265
          Top = 180
          Width = 153
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'TAETIGKEIT'
          DataSource = DataSourcePupil
          ItemHeight = 13
          Items.Strings = (
            'Schüler(in)'
            'Auszubildende(r)'
            'Student(in)'
            'Wehrdienstleistender'
            'Zivildienstleistender'
            'Arbeiter(in)'
            'Angestellte(r)'
            'selbstständig'
            'arbeitslos'
            'Rentner(in)'
            'Pensionist(in)'
            'Hausmann/-frau')
          TabOrder = 8
        end
        object DBComboBoxAUSLAENDER_STATUS: TDBComboBox
          Left = 168
          Top = 260
          Width = 249
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'AUSLAENDER_STATUS'
          DataSource = DataSourcePupil
          ItemHeight = 13
          Items.Strings = (
            'Neuzuwandernde Ausländer'
            'Neuzuwandernde Ausländer Verpflichtet (ABH)'
            'Neuzuwandernde Ausländer Berechtigt (ABH)'
            'Bestandsausländer (Verpflichtung durch ABH)'
            'Bestandsausländer/EU-Bürger/Deutscher'
            'Spätaussiedler'
            'ALG II-Bezieher (Verpflichtung durch TGS)'
            'ALG II-Bezieher (Eingliederung)'
            'Kurswiederholer'
            '---'
            'Asylbewerber(in)'
            'Asylberechtigte(r)'
            'Kontingentflüchtling'
            'Bürgerkriegsflüchtling'
            '---'
            'Gastarbeiter'
            'EU Bürger'
            ' '
            ' ')
          TabOrder = 12
        end
        object DBComboBoxISCED: TDBComboBox
          Left = 299
          Top = 20
          Width = 65
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'ISCED_LEVEL'
          DataSource = DataSourcePupil
          ItemHeight = 13
          Items.Strings = (
            '1'
            '2'
            '3 A'
            '3 B'
            '4 A'
            '5 A'
            '5 B'
            '6'
            '9')
          TabOrder = 1
        end
        object DBEditSCHULJAHRE: TDBEdit
          Left = 370
          Top = 20
          Width = 48
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'SCHULJAHRE'
          DataSource = DataSourcePupil
          TabOrder = 2
        end
        object DBEditKURS_MODUL: TDBEdit
          Left = 8
          Top = 104
          Width = 121
          Height = 21
          DataField = 'KURS_MODUL'
          DataSource = DataSourcePupil
          TabOrder = 4
        end
        object DBComboBoxKURSART: TDBComboBox
          Left = 136
          Top = 104
          Width = 281
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'KURSART'
          DataSource = DataSourcePupil
          ItemHeight = 13
          Items.Strings = (
            'Allgemeiner Integrationskurs'
            'Frauenkurs'
            'Elternkurs'
            'Jugendkurs'
            'Alphabetisierungskurs'
            'Förderkurs'
            'Intensivkurs'
            'Sonst. spez. Integrationskurs')
          TabOrder = 5
        end
        object ComboBoxSCHREIBFAEHIGKEIT: TComboBox
          Left = 8
          Top = 144
          Width = 249
          Height = 21
          ItemHeight = 13
          TabOrder = 6
          OnChange = ComboBoxSCHREIBFAEHIGKEITChange
          Items.Strings = (
            'Nicht alphabetisiert'
            'Nicht lateinisch alphabetisiert'
            'Lateinisch alphabetisiert')
        end
      end
      object TabSheetNummern: TTabSheet
        Caption = 'Nummern'
        ImageIndex = 2
        object Label31: TLabel
          Left = 8
          Top = 48
          Width = 107
          Height = 13
          Caption = 'Ausweis-/Passnummer'
        end
        object LabelPersonenkennzifferdesBAMF: TLabel
          Left = 8
          Top = 312
          Width = 143
          Height = 13
          Caption = 'Personenkennziffer des BAMF'
        end
        object LabelABHKennziffer: TLabel
          Left = 8
          Top = 352
          Width = 72
          Height = 13
          Caption = 'ABH-Kennziffer'
        end
        object LabelBVAKennziffer: TLabel
          Left = 8
          Top = 393
          Width = 71
          Height = 13
          Caption = 'BVA-Kennziffer'
        end
        object LabelAZ_GRUNDSICHERUNG: TLabel
          Left = 8
          Top = 432
          Width = 297
          Height = 13
          Caption = 'Aktenzeichen d. Trägers d. Grundsicherung f. Arbeitssuchende'
        end
        object Label27: TLabel
          Left = 8
          Top = 112
          Width = 63
          Height = 13
          Caption = 'Kontoinhaber'
        end
        object Label37: TLabel
          Left = 8
          Top = 152
          Width = 65
          Height = 13
          Caption = 'Kontonummer'
        end
        object Label38: TLabel
          Left = 8
          Top = 192
          Width = 20
          Height = 13
          Caption = 'BLZ'
        end
        object Label39: TLabel
          Left = 8
          Top = 232
          Width = 51
          Height = 13
          Caption = 'Bankname'
        end
        object Label40: TLabel
          Left = 8
          Top = 8
          Width = 89
          Height = 13
          Caption = 'Teilnehmernummer'
        end
        object DBEditAUSWEIS_NUMMER: TDBEdit
          Left = 8
          Top = 64
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AUSWEIS_NUMMER'
          DataSource = DataSourcePupil
          TabOrder = 1
        end
        object DBEditBAMF_NUMMER: TDBEdit
          Left = 8
          Top = 328
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BAMF_NUMMER'
          DataSource = DataSourcePupil
          TabOrder = 6
        end
        object DBEditABH_NUMMER: TDBEdit
          Left = 8
          Top = 368
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ABH_NUMMER'
          DataSource = DataSourcePupil
          TabOrder = 7
        end
        object DBEditBVA_NUMMER: TDBEdit
          Left = 8
          Top = 408
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BVA_NUMMER'
          DataSource = DataSourcePupil
          TabOrder = 8
        end
        object DBEditAZ_GRUNDSICHERUNG: TDBEdit
          Left = 8
          Top = 448
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AZ_GRUNDSICHERUNG'
          DataSource = DataSourcePupil
          TabOrder = 9
        end
        object DBEditBANK_INHABER: TDBEdit
          Left = 8
          Top = 128
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BANK_INHABER'
          DataSource = DataSourcePupil
          TabOrder = 2
        end
        object DBEditBANK_KONTO: TDBEdit
          Left = 8
          Top = 168
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BANK_KONTO'
          DataSource = DataSourcePupil
          TabOrder = 3
        end
        object DBEditBANK_BLZ: TDBEdit
          Left = 8
          Top = 208
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BANK_BLZ'
          DataSource = DataSourcePupil
          TabOrder = 4
        end
        object DBEditBANK_NAME: TDBEdit
          Left = 8
          Top = 248
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BANK_NAME'
          DataSource = DataSourcePupil
          TabOrder = 5
        end
        object DBEditTEILNEHMER_NUMMER: TDBEdit
          Left = 8
          Top = 24
          Width = 410
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'TEILNEHMER_NUMMER'
          DataSource = DataSourcePupil
          TabOrder = 0
        end
      end
      object TabSheetAnsprechpartner: TTabSheet
        Caption = 'Ansprechpartner'
        ImageIndex = 3
        object Label42: TLabel
          Left = 8
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Vorname/Name:'
        end
        object Label43: TLabel
          Left = 8
          Top = 56
          Width = 137
          Height = 13
          Caption = 'Organisation/Behörde/Firma:'
        end
        object Label44: TLabel
          Left = 8
          Top = 104
          Width = 38
          Height = 13
          Caption = 'Strasse:'
        end
        object Label45: TLabel
          Left = 8
          Top = 152
          Width = 42
          Height = 13
          Caption = 'PLZ/Ort:'
        end
        object Label46: TLabel
          Left = 8
          Top = 200
          Width = 61
          Height = 13
          Caption = 'Telefon/Fax:'
        end
        object Label47: TLabel
          Left = 8
          Top = 248
          Width = 32
          Height = 13
          Caption = 'E-Mail:'
        end
        object Label48: TLabel
          Left = 8
          Top = 296
          Width = 57
          Height = 13
          Caption = 'Bemerkung:'
        end
        object SpeedButtonApEmail: TSpeedButton
          Left = 390
          Top = 260
          Width = 23
          Height = 22
          Hint = 'Schickt eine E-Mail an den Schüler'
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
        object DBEditAP_VORNAME: TDBEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 21
          DataField = 'AP_VORNAME'
          DataSource = DataSourcePupil
          TabOrder = 0
        end
        object DBEditAP_NAME: TDBEdit
          Left = 136
          Top = 24
          Width = 281
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_NAME'
          DataSource = DataSourcePupil
          TabOrder = 1
        end
        object DBEditAP_ORGANISATION: TDBEdit
          Left = 8
          Top = 72
          Width = 409
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_ORGANISATION'
          DataSource = DataSourcePupil
          TabOrder = 2
        end
        object DBEditAP_STRASSE: TDBEdit
          Left = 8
          Top = 120
          Width = 409
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_STRASSE'
          DataSource = DataSourcePupil
          TabOrder = 3
        end
        object DBEditAP_PLZ: TDBEdit
          Left = 8
          Top = 168
          Width = 49
          Height = 21
          DataField = 'AP_PLZ'
          DataSource = DataSourcePupil
          TabOrder = 4
        end
        object DBEditAP_ORT: TDBEdit
          Left = 64
          Top = 168
          Width = 353
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_ORT'
          DataSource = DataSourcePupil
          TabOrder = 5
        end
        object DBEditAP_TELEFON: TDBEdit
          Left = 8
          Top = 216
          Width = 161
          Height = 21
          DataField = 'AP_TELEFON'
          DataSource = DataSourcePupil
          TabOrder = 6
        end
        object DBEditAP_FAX: TDBEdit
          Left = 176
          Top = 216
          Width = 161
          Height = 21
          DataField = 'AP_FAX'
          DataSource = DataSourcePupil
          TabOrder = 7
        end
        object DBEditAP_EMAIL: TDBEdit
          Left = 8
          Top = 264
          Width = 377
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_EMAIL'
          DataSource = DataSourcePupil
          TabOrder = 8
        end
        object DBEditAP_INFO: TDBEdit
          Left = 8
          Top = 312
          Width = 409
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AP_INFO'
          DataSource = DataSourcePupil
          TabOrder = 9
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 504
      Width = 439
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonCourse: TButton
        Left = 6
        Top = 8
        Width = 115
        Height = 25
        Hint = 'Zeigt Kurse des Schülers'
        Caption = 'Kurse/Prüfungen...'
        TabOrder = 0
        OnClick = ButtonCourseClick
      end
      object ButtonSearch: TButton
        Left = 352
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Suchen...'
        TabOrder = 2
        OnClick = ButtonSearchClick
      end
      object BitBtnXmlExport: TBitBtn
        Left = 128
        Top = 8
        Width = 217
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'XML Export'
        PopupMenu = xmlPopupMenu
        TabOrder = 1
        OnClick = BitBtnXmlExportClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00001000000000
          0000000100113110001000111133333101000001133111331100000133333313
          3100001133311133311000113331113331100001333313331110001133331333
          1100000133C333C3110000001333333311000001113131311000000011111111
          1100000000111110000000000011000000000000000000000000}
      end
    end
  end
  object DataSourcePupil: TDataSource
    DataSet = TablePupil
    Left = 143
    Top = 93
  end
  object TablePupil: TTable
    AfterInsert = TablePupilAfterInsert
    BeforePost = TablePupilBeforePost
    AfterPost = TablePupilAfterPost
    AfterScroll = TablePupilAfterScroll
    DatabaseName = 'KlaroDB'
    Filter = 'ABGESCHLOSSEN <> '#39'J'#39
    Filtered = True
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'AENDERUNGSDATUM'
        DataType = ftDateTime
      end
      item
        Name = 'AENDERUNG_VON'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ANMELDE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'RUECKGABE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'TEILNEHMER_NUMMER'
        DataType = ftString
        Size = 255
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
        Size = 64
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
        Name = 'AUSLAENDER_STATUS'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'BERUF'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TAETIGKEIT'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'WOHER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PRUEFUNGEN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EINSTUFUNG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end
      item
        Name = 'ISCED_LEVEL'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'SCHULJAHRE'
        DataType = ftSmallint
      end
      item
        Name = 'KURS_MODUL'
        DataType = ftSmallint
      end
      item
        Name = 'KURSART'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SCHREIBFAEHIGKEIT'
        DataType = ftSmallint
      end
      item
        Name = 'AUSWEIS_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'WDH_BAMF_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ABH_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BVA_NUMMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AZ_GRUNDSICHERUNG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ABGESCHLOSSEN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BANK_INHABER'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'BANK_KONTO'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'BANK_BLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'BANK_NAME'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'AP_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AP_VORNAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AP_ORGANISATION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AP_STRASSE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AP_PLZ'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'AP_ORT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AP_TELEFON'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'AP_FAX'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'AP_EMAIL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'AP_INFO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KURS_WECHSEL'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'TablePupilIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'SCHUELER_NAME_IDX'
        Fields = 'NACHNAME;VORNAME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'SCHUELER_NAME_IDX'
    StoreDefs = True
    TableName = 'SCHUELER'
    Left = 64
    Top = 88
    object TablePupilID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TablePupilTEILNEHMER_NUMMER: TStringField
      FieldName = 'TEILNEHMER_NUMMER'
      Size = 255
    end
    object TablePupilANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 32
    end
    object TablePupilGESCHLECHT: TStringField
      FieldName = 'GESCHLECHT'
      Size = 1
    end
    object TablePupilNACHNAME: TStringField
      DisplayLabel = 'Nachname'
      DisplayWidth = 20
      FieldName = 'NACHNAME'
      Required = True
      Size = 64
    end
    object TablePupilVORNAME: TStringField
      DisplayLabel = 'Vorname'
      DisplayWidth = 20
      FieldName = 'VORNAME'
      Size = 64
    end
    object TablePupilWOHNUNG: TStringField
      FieldName = 'WOHNUNG'
      Size = 64
    end
    object TablePupilSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 128
    end
    object TablePupilLAND: TStringField
      FieldName = 'LAND'
      Size = 3
    end
    object TablePupilPLZ: TStringField
      FieldName = 'PLZ'
      Size = 16
    end
    object TablePupilORT: TStringField
      FieldName = 'ORT'
      Size = 64
    end
    object TablePupilTEL_BUERO: TStringField
      FieldName = 'TEL_BUERO'
      Size = 64
    end
    object TablePupilTEL_FAX: TStringField
      FieldName = 'TEL_FAX'
      Size = 64
    end
    object TablePupilTEL_MOBIL: TStringField
      FieldName = 'TEL_MOBIL'
      Size = 64
    end
    object TablePupilE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 64
    end
    object TablePupilPRUEFUNGEN: TStringField
      FieldName = 'PRUEFUNGEN'
      Size = 255
    end
    object TablePupilEINSTUFUNG: TStringField
      DisplayWidth = 64
      FieldName = 'EINSTUFUNG'
      Size = 255
    end
    object TablePupilBERUF: TStringField
      FieldName = 'BERUF'
      Size = 64
    end
    object TablePupilTAETIGKEIT: TStringField
      FieldName = 'TAETIGKEIT'
      Size = 64
    end
    object TablePupilGEBURTSDATUM: TDateTimeField
      FieldName = 'GEBURTSDATUM'
    end
    object TablePupilGEBURTSORT: TStringField
      FieldName = 'GEBURTSORT'
      Size = 64
    end
    object TablePupilNATIONALITAET: TStringField
      FieldName = 'NATIONALITAET'
      Size = 64
    end
    object TablePupilAUSLAENDER_STATUS: TStringField
      FieldName = 'AUSLAENDER_STATUS'
      Size = 64
    end
    object TablePupilWOHER: TStringField
      FieldName = 'WOHER'
      Size = 255
    end
    object TablePupilBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object TablePupilAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
    end
    object TablePupilTEL_PRIV: TStringField
      FieldName = 'TEL_PRIV'
      Size = 64
    end
    object TablePupilISCED_LEVEL: TStringField
      FieldName = 'ISCED_LEVEL'
      Size = 3
    end
    object TablePupilSCHULJAHRE: TSmallintField
      FieldName = 'SCHULJAHRE'
    end
    object TablePupilKURS_MODUL: TSmallintField
      FieldName = 'KURS_MODUL'
    end
    object TablePupilKURSART: TStringField
      FieldName = 'KURSART'
      Size = 64
    end
    object TablePupilSCHREIBFAEHIGKEIT: TSmallintField
      FieldName = 'SCHREIBFAEHIGKEIT'
    end
    object TablePupilAUSWEIS_NUMMER: TStringField
      FieldName = 'AUSWEIS_NUMMER'
      Size = 255
    end
    object TablePupilBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 255
    end
    object TablePupilABH_NUMMER: TStringField
      FieldName = 'ABH_NUMMER'
      Size = 255
    end
    object TablePupilBVA_NUMMER: TStringField
      FieldName = 'BVA_NUMMER'
      Size = 255
    end
    object TablePupilANMELDE_DATUM: TDateTimeField
      FieldName = 'ANMELDE_DATUM'
    end
    object TablePupilAZ_GRUNDSICHERUNG: TStringField
      FieldName = 'AZ_GRUNDSICHERUNG'
      Size = 255
    end
    object TablePupilABGESCHLOSSEN: TStringField
      FieldName = 'ABGESCHLOSSEN'
      Size = 1
    end
    object TablePupilBANK_INHABER: TStringField
      FieldName = 'BANK_INHABER'
      Size = 128
    end
    object TablePupilBANK_KONTO: TStringField
      FieldName = 'BANK_KONTO'
      Size = 32
    end
    object TablePupilBANK_BLZ: TStringField
      FieldName = 'BANK_BLZ'
      Size = 16
    end
    object TablePupilBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 128
    end
    object TablePupilAENDERUNG_VON: TStringField
      FieldName = 'AENDERUNG_VON'
      Size = 255
    end
    object TablePupilAP_NAME: TStringField
      FieldName = 'AP_NAME'
      Size = 64
    end
    object TablePupilAP_VORNAME: TStringField
      FieldName = 'AP_VORNAME'
      Size = 64
    end
    object TablePupilAP_ORGANISATION: TStringField
      FieldName = 'AP_ORGANISATION'
      Size = 255
    end
    object TablePupilAP_STRASSE: TStringField
      FieldName = 'AP_STRASSE'
      Size = 255
    end
    object TablePupilAP_PLZ: TStringField
      FieldName = 'AP_PLZ'
      Size = 16
    end
    object TablePupilAP_ORT: TStringField
      FieldName = 'AP_ORT'
      Size = 255
    end
    object TablePupilAP_TELEFON: TStringField
      FieldName = 'AP_TELEFON'
      Size = 64
    end
    object TablePupilAP_FAX: TStringField
      FieldName = 'AP_FAX'
      Size = 64
    end
    object TablePupilAP_EMAIL: TStringField
      FieldName = 'AP_EMAIL'
      Size = 255
    end
    object TablePupilAP_INFO: TStringField
      FieldName = 'AP_INFO'
      Size = 255
    end
    object TablePupilRUECKGABE_DATUM: TDateTimeField
      FieldName = 'RUECKGABE_DATUM'
    end
  end
  object xmlPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 152
    Top = 160
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
  object QueryKursart: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select distinct KURSART from kurse order by KURSART'
      ' ')
    Left = 72
    Top = 176
    object QueryKursartKURSART: TStringField
      FieldName = 'KURSART'
      Origin = 'KLARODB."kurse.DB".KURSART'
      Size = 64
    end
  end
end
