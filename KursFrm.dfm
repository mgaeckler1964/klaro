object KursForm: TKursForm
  Tag = 3
  Left = 626
  Top = 160
  Width = 900
  Height = 600
  Caption = 'Kurse'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
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
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 241
    Top = 40
    Width = 3
    Height = 533
    Cursor = crHSplit
    Beveled = True
  end
  object Panel1: TPanel
    Left = 244
    Top = 40
    Width = 648
    Height = 533
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Sheet: TPageControl
      Left = 0
      Top = 0
      Width = 648
      Height = 495
      ActivePage = TabSheetKurs
      Align = alClient
      TabOrder = 0
      object TabSheetKurs: TTabSheet
        Caption = 'Kurs'
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 39
          Height = 13
          Caption = 'Nummer'
          FocusControl = DBEditNUMMER
        end
        object Label2: TLabel
          Left = 320
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Kursbeginn'
          FocusControl = DBEditANFANGS_DATUM
        end
        object Label3: TLabel
          Left = 408
          Top = 8
          Width = 45
          Height = 13
          Caption = 'Kursende'
          FocusControl = DBEditENDE_DATUM
        end
        object Label13: TLabel
          Left = 8
          Top = 128
          Width = 45
          Height = 13
          Caption = 'Lehrbuch'
        end
        object Label4: TLabel
          Left = 320
          Top = 128
          Width = 34
          Height = 13
          Caption = 'Niveau'
          FocusControl = DBEditNIVEAU
        end
        object Label15: TLabel
          Left = 8
          Top = 168
          Width = 67
          Height = 13
          Caption = 'Folgekurs von'
        end
        object Label14: TLabel
          Left = 320
          Top = 168
          Width = 28
          Height = 13
          Caption = 'Raum'
          FocusControl = DBEditRAUM
        end
        object LabelStaatlFoerderung: TLabel
          Left = 232
          Top = 216
          Width = 81
          Height = 13
          Caption = 'Staatl. Förderung'
          FocusControl = DBEditFOERDERUNG
        end
        object Label5: TLabel
          Left = 8
          Top = 216
          Width = 54
          Height = 13
          Caption = 'Kursgebühr'
          FocusControl = DBEditKURSGEBUEHR
        end
        object Label17: TLabel
          Left = 8
          Top = 88
          Width = 35
          Height = 13
          Caption = 'Kurstyp'
        end
        object Label18: TLabel
          Left = 320
          Top = 88
          Width = 64
          Height = 13
          Caption = 'Kursabschnitt'
        end
        object Label19: TLabel
          Left = 8
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Kursart'
        end
        object Label31: TLabel
          Left = 96
          Top = 216
          Width = 64
          Height = 13
          Caption = 'Umsatzsteuer'
        end
        object LabelBAMFNummer: TLabel
          Left = 320
          Top = 48
          Width = 71
          Height = 13
          Caption = 'BAMF Nummer'
        end
        object DBEditNUMMER: TDBEdit
          Left = 8
          Top = 20
          Width = 305
          Height = 21
          DataField = 'NUMMER'
          DataSource = DataSourceCourse
          TabOrder = 0
        end
        object DBEditANFANGS_DATUM: TDBEdit
          Left = 320
          Top = 20
          Width = 80
          Height = 21
          DataField = 'ANFANGS_DATUM'
          DataSource = DataSourceCourse
          TabOrder = 1
          OnChange = DBEditANFANGS_DATUMChange
        end
        object DBEditENDE_DATUM: TDBEdit
          Left = 408
          Top = 20
          Width = 80
          Height = 21
          DataField = 'ENDE_DATUM'
          DataSource = DataSourceCourse
          TabOrder = 2
        end
        object DBEditLEHRBUCH: TDBEdit
          Left = 8
          Top = 140
          Width = 305
          Height = 21
          DataField = 'LEHRBUCH'
          DataSource = DataSourceCourse
          TabOrder = 7
        end
        object DBEditNIVEAU: TDBEdit
          Left = 320
          Top = 140
          Width = 169
          Height = 21
          DataField = 'NIVEAU'
          DataSource = DataSourceCourse
          TabOrder = 8
        end
        object DBEditVORKURS: TDBEdit
          Left = 8
          Top = 180
          Width = 305
          Height = 21
          DataField = 'VORKURS'
          DataSource = DataSourceCourse
          TabOrder = 9
        end
        object DBEditRAUM: TDBEdit
          Left = 320
          Top = 180
          Width = 169
          Height = 21
          DataField = 'RAUM'
          DataSource = DataSourceCourse
          TabOrder = 10
        end
        object DBEditFOERDERUNG: TDBEdit
          Left = 232
          Top = 232
          Width = 81
          Height = 21
          DataField = 'FOERDERUNG'
          DataSource = DataSourceCourse
          TabOrder = 11
        end
        object DBEditKURSGEBUEHR: TDBEdit
          Left = 8
          Top = 232
          Width = 81
          Height = 21
          DataField = 'KURSGEBUEHR'
          DataSource = DataSourceCourse
          TabOrder = 12
        end
        object DBComboBoxKURSTYP: TDBComboBox
          Left = 8
          Top = 104
          Width = 305
          Height = 21
          DataField = 'KURSTYP'
          DataSource = DataSourceCourse
          ItemHeight = 13
          Items.Strings = (
            ''
            'Basiskurs'
            'Aufbaukurs'
            'Orientierungskurs'
            'Spezialkurs')
          TabOrder = 5
        end
        object DBComboBoxKURSABSCHNITT: TDBComboBox
          Left = 320
          Top = 104
          Width = 169
          Height = 21
          DataField = 'KURSABSCHNITT'
          DataSource = DataSourceCourse
          ItemHeight = 13
          Items.Strings = (
            ''
            'Kursabschnitt 1'
            'Kursabschnitt 2'
            'Kursabschnitt 3'
            'Kursabschnitt 4'
            'Kursabschnitt 5'
            'Kursabschnitt 6'
            'Kursabschnitt 7'
            'Kursabschnitt 8'
            'Kursabschnitt 9')
          TabOrder = 6
        end
        object DBComboBoxKURSART: TDBComboBox
          Left = 8
          Top = 64
          Width = 305
          Height = 21
          DataField = 'KURSART'
          DataSource = DataSourceCourse
          ItemHeight = 13
          Items.Strings = (
            ''
            'Integrationskurs allgemein'
            'Wiederholerkurs allgemein'
            'Jugendkurs'
            'Elternkurs'
            'Frauenkurs'
            'Alphakurs'
            'Förderkurs'
            'Intensivkurs'
            'Gehörlosenkurs'
            'Sonst. spez. Integrationskurs'
            'Wiederholerkurs Jugendliche'
            'Wiederholerkurs Jugendkurs'
            'Wiederholerkurs Elternkurs'
            'Wiederholerkurs Frauenkurs'
            'Wiederholerkurs Alpha'
            'Wiederholerkurs Alphakurs'
            'Wiederholerkurs Förderkurs'
            'Wiederholerkurs Gehörlosenkurs'
            'Wiederholerkurs Sonst. spez. Integrationskurs')
          TabOrder = 3
        end
        object DBComboBoxUMSATZSTEUER: TDBComboBox
          Left = 96
          Top = 232
          Width = 129
          Height = 21
          DataField = 'UMSATZSTEUER'
          DataSource = DataSourceCourse
          ItemHeight = 13
          Items.Strings = (
            ''
            '0'
            '7'
            '19')
          TabOrder = 13
        end
        object DBEditBAMF_NUMMER: TDBEdit
          Left = 320
          Top = 64
          Width = 169
          Height = 21
          DataField = 'BAMF_NUMMER'
          DataSource = DataSourceCourse
          TabOrder = 4
        end
      end
      object TabSheetUnterrichtszeiten: TTabSheet
        Caption = 'Unterrichtszeiten'
        ImageIndex = 1
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 640
          Height = 467
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object Label21: TLabel
            Left = 8
            Top = 216
            Width = 46
            Height = 13
            Caption = 'Unterricht'
          end
          object Label22: TLabel
            Left = 64
            Top = 192
            Width = 36
            Height = 13
            Caption = 'Montag'
          end
          object Label23: TLabel
            Left = 144
            Top = 192
            Width = 42
            Height = 13
            Caption = 'Dienstag'
          end
          object Label24: TLabel
            Left = 224
            Top = 192
            Width = 43
            Height = 13
            Caption = 'Mittwoch'
          end
          object Label25: TLabel
            Left = 304
            Top = 192
            Width = 55
            Height = 13
            Caption = 'Donnerstag'
          end
          object Label26: TLabel
            Left = 384
            Top = 192
            Width = 32
            Height = 13
            Caption = 'Freitag'
          end
          object Label27: TLabel
            Left = 464
            Top = 192
            Width = 41
            Height = 13
            Caption = 'Samstag'
          end
          object Label28: TLabel
            Left = 544
            Top = 192
            Width = 40
            Height = 13
            Caption = 'Sonntag'
          end
          object Label29: TLabel
            Left = 8
            Top = 272
            Width = 30
            Height = 13
            Caption = 'Pause'
          end
          object Label11: TLabel
            Left = 8
            Top = 8
            Width = 42
            Height = 13
            Caption = 'Kurstage'
          end
          object Label12: TLabel
            Left = 8
            Top = 48
            Width = 182
            Height = 13
            Caption = 'Kursunterbrechungen (Von/bis/Grund)'
          end
          object Label7: TLabel
            Left = 8
            Top = 128
            Width = 62
            Height = 13
            Caption = 'Unterrichtsst.'
          end
          object Label8: TLabel
            Left = 96
            Top = 128
            Width = 52
            Height = 13
            Caption = 'Wochenst.'
          end
          object LabelTeamteacherst: TLabel
            Left = 184
            Top = 128
            Width = 74
            Height = 13
            Caption = 'Teamteacherst.'
          end
          object LabelSozpaedSt: TLabel
            Left = 272
            Top = 128
            Width = 58
            Height = 13
            Caption = 'Soz.päd. St.'
          end
          object Bevel1: TBevel
            Left = 0
            Top = 176
            Width = 608
            Height = 1
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label30: TLabel
            Left = 8
            Top = 336
            Width = 18
            Height = 13
            Caption = 'Info'
          end
          object DateTimePickerMO_ANF: TDateTimePicker
            Left = 64
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 6
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDI_ANF: TDateTimePicker
            Left = 144
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 10
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMI_ANF: TDateTimePicker
            Left = 224
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 14
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDO_ANF: TDateTimePicker
            Left = 304
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 18
            OnChange = DateTimePickerChange
          end
          object DateTimePickerFR_ANF: TDateTimePicker
            Left = 384
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 22
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSA_ANF: TDateTimePicker
            Left = 464
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 26
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSO_ANF: TDateTimePicker
            Left = 544
            Top = 216
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 30
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMO_END: TDateTimePicker
            Left = 64
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 7
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDI_END: TDateTimePicker
            Left = 144
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 11
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMI_END: TDateTimePicker
            Left = 224
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 15
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDO_END: TDateTimePicker
            Left = 304
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 19
            OnChange = DateTimePickerChange
          end
          object DateTimePickerFR_END: TDateTimePicker
            Left = 384
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 23
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSA_END: TDateTimePicker
            Left = 464
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 27
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSO_END: TDateTimePicker
            Left = 544
            Top = 240
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 31
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMO_PAUS_ANF: TDateTimePicker
            Left = 64
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 8
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDI_PAUS_ANF: TDateTimePicker
            Left = 144
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 12
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMI_PAUS_ANF: TDateTimePicker
            Left = 224
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 16
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDO_PAUS_ANF: TDateTimePicker
            Left = 304
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 20
            OnChange = DateTimePickerChange
          end
          object DateTimePickerFR_PAUS_ANF: TDateTimePicker
            Left = 384
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 24
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSA_PAUS_ANF: TDateTimePicker
            Left = 464
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 28
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSO_PAUS_ANF: TDateTimePicker
            Left = 544
            Top = 272
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 32
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMO_PAUS_END: TDateTimePicker
            Left = 64
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 9
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDI_PAUS_END: TDateTimePicker
            Left = 144
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            OnChange = DateTimePickerChange
          end
          object DateTimePickerMI_PAUS_END: TDateTimePicker
            Left = 224
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 17
            OnChange = DateTimePickerChange
          end
          object DateTimePickerDO_PAUS_END: TDateTimePicker
            Left = 304
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 21
            OnChange = DateTimePickerChange
          end
          object DateTimePickerFR_PAUS_END: TDateTimePicker
            Left = 384
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 25
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSA_PAUS_END: TDateTimePicker
            Left = 464
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 29
            OnChange = DateTimePickerChange
          end
          object DateTimePickerSO_PAUS_END: TDateTimePicker
            Left = 544
            Top = 296
            Width = 73
            Height = 21
            CalAlignment = dtaLeft
            Date = 36526
            Time = 36526
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 33
            OnChange = DateTimePickerChange
          end
          object DBEditKURSTAGE: TDBEdit
            Left = 8
            Top = 20
            Width = 345
            Height = 21
            DataField = 'KURSTAGE'
            DataSource = DataSourceCourse
            TabOrder = 0
          end
          object DBMemoFEIERTAGE: TDBMemo
            Left = 8
            Top = 64
            Width = 345
            Height = 57
            DataField = 'FEIERTAGE'
            DataSource = DataSourceCourse
            TabOrder = 1
          end
          object DBEditUNTERRICHTSSTUNDEN: TDBEdit
            Left = 8
            Top = 140
            Width = 81
            Height = 21
            DataField = 'UNTERRICHTSSTUNDEN'
            DataSource = DataSourceCourse
            TabOrder = 2
          end
          object DBEditWOCHENSTUNDEN: TDBEdit
            Left = 96
            Top = 140
            Width = 81
            Height = 21
            DataField = 'WOCHENSTUNDEN'
            DataSource = DataSourceCourse
            TabOrder = 3
          end
          object DBEditTT_STUNDEN: TDBEdit
            Left = 184
            Top = 140
            Width = 81
            Height = 21
            DataField = 'TT_STUNDEN'
            DataSource = DataSourceCourse
            TabOrder = 4
          end
          object DBEditSOZ_PAED_STUNDEN: TDBEdit
            Left = 272
            Top = 140
            Width = 81
            Height = 21
            DataField = 'SOZ_PAED_STUNDEN'
            DataSource = DataSourceCourse
            TabOrder = 5
          end
          object DBMemoZEIT_BEMERKUNG: TDBMemo
            Left = 64
            Top = 328
            Width = 553
            Height = 213
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'ZEIT_BEMERKUNG'
            DataSource = DataSourceCourse
            TabOrder = 34
          end
        end
      end
      object TabSheetBemerkung: TTabSheet
        Caption = 'Bemerkung'
        ImageIndex = 1
        object DBMemoBEMERKUNG: TDBMemo
          Left = 0
          Top = 0
          Width = 640
          Height = 467
          Align = alClient
          DataField = 'BEMERKUNG'
          DataSource = DataSourceCourse
          TabOrder = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 495
      Width = 648
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonCourseInfo: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Zeigt Lehrer und Schüler'
        Caption = 'Kursinfo...'
        TabOrder = 1
        OnClick = ButtonCourseInfoClick
      end
      object ButtonAttendance: TButton
        Left = 168
        Top = 8
        Width = 113
        Height = 25
        Caption = 'Anwesenheitsliste...'
        TabOrder = 2
        OnClick = ButtonAttendanceClick
      end
      object ButtonBuecher: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Bücher...'
        TabOrder = 0
        OnClick = ButtonBuecherClick
      end
      object ButtonLehrzeiten: TButton
        Left = 288
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Lehrzeiten...'
        TabOrder = 3
        OnClick = ButtonLehrzeitenClick
      end
      object ButtonInvitations: TButton
        Left = 568
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Einladen...'
        TabOrder = 4
        OnClick = ButtonInvitationsClick
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 241
    Height = 533
    Align = alLeft
    DataSource = DataSourceCourse
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KURSNUMMER'
        Title.Caption = 'Kursnummer'
        Width = 210
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object LabelYear: TLabel
      Left = 486
      Top = 16
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelYear'
    end
    object Label16: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Suche:'
    end
    object SpeedButtonRefresh: TSpeedButton
      Left = 473
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
      Left = 664
      Top = 23
      Width = 65
      Height = 17
      DataField = 'AENDERUNG_VON'
      DataSource = DataSourceCourse
    end
    object DBTextAENDERUNGSDATUM: TDBText
      Left = 664
      Top = 8
      Width = 73
      Height = 17
      DataField = 'AENDERUNGSDATUM'
      DataSource = DataSourceCourse
    end
    object DBNavigator: TDBNavigator
      Left = 248
      Top = 8
      Width = 225
      Height = 25
      DataSource = DataSourceCourse
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object YearSelectUpDown: TUpDown
      Left = 536
      Top = 8
      Width = 50
      Height = 25
      Min = -32768
      Max = 32767
      Orientation = udHorizontal
      Position = 0
      TabOrder = 2
      Wrap = False
      OnChangingEx = YearSelectUpDownChangingEx
    end
    object SearchEdit: TEdit
      Left = 48
      Top = 8
      Width = 185
      Height = 21
      TabOrder = 0
      OnChange = SearchEditChange
    end
    object ComboBoxSemester: TComboBox
      Left = 592
      Top = 8
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBoxSemesterChange
      Items.Strings = (
        'Jahr'
        'Sommer'
        'Winter')
    end
  end
  object DataSourceCourse: TDataSource
    DataSet = TableCourse
    Left = 71
    Top = 56
  end
  object TableCourse: TTable
    AfterInsert = TableCourseAfterInsert
    BeforePost = TableCourseBeforePost
    AfterCancel = TableCourseRefreshTimes
    AfterScroll = TableCourseRefreshTimes
    OnCalcFields = TableCourseCalcFields
    DatabaseName = 'KlaroDB'
    Filter = 'JAHR=2000'
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
        Name = 'JAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'HALBJAHR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMMER'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'BAMF_NUMMER'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'ANFANGS_DATUM'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'ENDE_DATUM'
        DataType = ftDateTime
      end
      item
        Name = 'UNTERRICHTSSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'WOCHENSTUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'TT_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'SOZ_PAED_STUNDEN'
        DataType = ftFloat
      end
      item
        Name = 'KURSTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FEIERTAGE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KURSART'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'KURSTYP'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'KURSABSCHNITT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'VORKURS'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'NIVEAU'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'LEHRBUCH'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RAUM'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'UMSATZSTEUER'
        DataType = ftFloat
      end
      item
        Name = 'KURSGEBUEHR'
        DataType = ftFloat
      end
      item
        Name = 'FOERDERUNG'
        DataType = ftFloat
      end
      item
        Name = 'BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end
      item
        Name = 'MO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MO_END'
        DataType = ftDateTime
      end
      item
        Name = 'MO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MO_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'DI_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DI_END'
        DataType = ftDateTime
      end
      item
        Name = 'DI_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DI_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'MI_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MI_END'
        DataType = ftDateTime
      end
      item
        Name = 'MI_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'MI_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'DO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DO_END'
        DataType = ftDateTime
      end
      item
        Name = 'DO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'DO_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'FR_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'FR_END'
        DataType = ftDateTime
      end
      item
        Name = 'FR_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'FR_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'SA_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SA_END'
        DataType = ftDateTime
      end
      item
        Name = 'SA_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SA_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'SO_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SO_END'
        DataType = ftDateTime
      end
      item
        Name = 'SO_PAUS_ANF'
        DataType = ftDateTime
      end
      item
        Name = 'SO_PAUS_END'
        DataType = ftDateTime
      end
      item
        Name = 'ZEIT_BEMERKUNG'
        DataType = ftMemo
        Size = 64
      end>
    IndexDefs = <
      item
        Name = 'TableCourseIndex1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'ANFANG_IDX'
        Fields = 'ANFANGS_DATUM'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'JAHR_NUMMER_IDX'
        Fields = 'NUMMER;HALBJAHR;JAHR'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'JAHR_NUMMER_IDX'
    StoreDefs = True
    TableName = 'KURSE'
    Left = 72
    Top = 112
    object TableCourseID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TableCourseNUMMER: TStringField
      FieldName = 'NUMMER'
      Required = True
      Size = 32
    end
    object TableCourseBAMF_NUMMER: TStringField
      FieldName = 'BAMF_NUMMER'
      Size = 32
    end
    object TableCourseANFANGS_DATUM: TDateTimeField
      FieldName = 'ANFANGS_DATUM'
      Required = True
    end
    object TableCourseENDE_DATUM: TDateTimeField
      FieldName = 'ENDE_DATUM'
    end
    object TableCourseUNTERRICHTSSTUNDEN: TFloatField
      FieldName = 'UNTERRICHTSSTUNDEN'
    end
    object TableCourseKURSNUMMER: TStringField
      FieldKind = fkCalculated
      FieldName = 'KURSNUMMER'
      Size = 64
      Calculated = True
    end
    object TableCourseJAHR: TStringField
      FieldName = 'JAHR'
      Required = True
      Size = 4
    end
    object TableCourseHALBJAHR: TStringField
      FieldName = 'HALBJAHR'
      Required = True
      Size = 1
    end
    object TableCourseWOCHENSTUNDEN: TFloatField
      FieldName = 'WOCHENSTUNDEN'
    end
    object TableCourseTT_STUNDEN: TFloatField
      FieldName = 'TT_STUNDEN'
    end
    object TableCourseSOZ_PAED_STUNDEN: TFloatField
      FieldName = 'SOZ_PAED_STUNDEN'
    end
    object TableCourseKURSTAGE: TStringField
      FieldName = 'KURSTAGE'
      Size = 255
    end
    object TableCourseFEIERTAGE: TStringField
      FieldName = 'FEIERTAGE'
      Size = 255
    end
    object TableCourseVORKURS: TStringField
      FieldName = 'VORKURS'
      Size = 32
    end
    object TableCourseNIVEAU: TStringField
      FieldName = 'NIVEAU'
      Size = 32
    end
    object TableCourseLEHRBUCH: TStringField
      FieldName = 'LEHRBUCH'
      Size = 64
    end
    object TableCourseRAUM: TStringField
      FieldName = 'RAUM'
      Size = 32
    end
    object TableCourseUMSATZSTEUER: TFloatField
      FieldName = 'UMSATZSTEUER'
    end
    object TableCourseKURSGEBUEHR: TFloatField
      FieldName = 'KURSGEBUEHR'
      currency = True
    end
    object TableCourseFOERDERUNG: TFloatField
      FieldName = 'FOERDERUNG'
      currency = True
    end
    object TableCourseBEMERKUNG: TMemoField
      FieldName = 'BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object TableCourseKURSART: TStringField
      FieldName = 'KURSART'
      Size = 64
    end
    object TableCourseKURSTYP: TStringField
      FieldName = 'KURSTYP'
      Size = 32
    end
    object TableCourseKURSABSCHNITT: TStringField
      FieldName = 'KURSABSCHNITT'
      Size = 32
    end
    object TableCourseMO_ANF: TDateTimeField
      FieldName = 'MO_ANF'
    end
    object TableCourseMO_END: TDateTimeField
      FieldName = 'MO_END'
    end
    object TableCourseMO_PAUS_ANF: TDateTimeField
      FieldName = 'MO_PAUS_ANF'
    end
    object TableCourseMO_PAUS_END: TDateTimeField
      FieldName = 'MO_PAUS_END'
    end
    object TableCourseDI_ANF: TDateTimeField
      FieldName = 'DI_ANF'
    end
    object TableCourseDI_END: TDateTimeField
      FieldName = 'DI_END'
    end
    object TableCourseDI_PAUS_ANF: TDateTimeField
      FieldName = 'DI_PAUS_ANF'
    end
    object TableCourseDI_PAUS_END: TDateTimeField
      FieldName = 'DI_PAUS_END'
    end
    object TableCourseMI_ANF: TDateTimeField
      FieldName = 'MI_ANF'
    end
    object TableCourseMI_END: TDateTimeField
      FieldName = 'MI_END'
    end
    object TableCourseMI_PAUS_ANF: TDateTimeField
      FieldName = 'MI_PAUS_ANF'
    end
    object TableCourseMI_PAUS_END: TDateTimeField
      FieldName = 'MI_PAUS_END'
    end
    object TableCourseDO_ANF: TDateTimeField
      FieldName = 'DO_ANF'
    end
    object TableCourseDO_END: TDateTimeField
      FieldName = 'DO_END'
    end
    object TableCourseDO_PAUS_ANF: TDateTimeField
      FieldName = 'DO_PAUS_ANF'
    end
    object TableCourseDO_PAUS_END: TDateTimeField
      FieldName = 'DO_PAUS_END'
    end
    object TableCourseFR_ANF: TDateTimeField
      FieldName = 'FR_ANF'
    end
    object TableCourseFR_END: TDateTimeField
      FieldName = 'FR_END'
    end
    object TableCourseFR_PAUS_ANF: TDateTimeField
      FieldName = 'FR_PAUS_ANF'
    end
    object TableCourseFR_PAUS_END: TDateTimeField
      FieldName = 'FR_PAUS_END'
    end
    object TableCourseSA_ANF: TDateTimeField
      FieldName = 'SA_ANF'
    end
    object TableCourseSA_END: TDateTimeField
      FieldName = 'SA_END'
    end
    object TableCourseSA_PAUS_ANF: TDateTimeField
      FieldName = 'SA_PAUS_ANF'
    end
    object TableCourseSA_PAUS_END: TDateTimeField
      FieldName = 'SA_PAUS_END'
    end
    object TableCourseSO_ANF: TDateTimeField
      FieldName = 'SO_ANF'
    end
    object TableCourseSO_END: TDateTimeField
      FieldName = 'SO_END'
    end
    object TableCourseSO_PAUS_ANF: TDateTimeField
      FieldName = 'SO_PAUS_ANF'
    end
    object TableCourseSO_PAUS_END: TDateTimeField
      FieldName = 'SO_PAUS_END'
    end
    object TableCourseZEIT_BEMERKUNG: TMemoField
      FieldName = 'ZEIT_BEMERKUNG'
      BlobType = ftMemo
      Size = 64
    end
    object TableCourseAENDERUNGSDATUM: TDateTimeField
      FieldName = 'AENDERUNGSDATUM'
    end
    object TableCourseAENDERUNG_VON: TStringField
      FieldName = 'AENDERUNG_VON'
      Size = 255
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
  object QueryKurstyp: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select distinct KURSTYP from kurse order by KURSTYP'
      ' ')
    Left = 72
    Top = 240
    object QueryKurstypKURSTYP: TStringField
      FieldName = 'KURSTYP'
      Origin = 'KLARODB."kurse.DB".KURSTYP'
      Size = 32
    end
  end
end
