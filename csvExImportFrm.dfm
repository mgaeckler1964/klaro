object csvExImportForm: TcsvExImportForm
  Left = 1637
  Top = 495
  BorderStyle = bsDialog
  Caption = 'CSV Ex-/Import'
  ClientHeight = 129
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Tabelle'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 25
    Height = 13
    Caption = 'Datei'
  end
  object ComboBoxTable: TComboBox
    Left = 56
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ExImportChange
    Items.Strings = (
      'Lehrer'
      'Schüler'
      'Kurse'
      'Lehrbücher'
      'Ferien'
      'Prüfungen')
  end
  object RadioButtonExport: TRadioButton
    Left = 56
    Top = 40
    Width = 65
    Height = 17
    Caption = 'Export'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RadioButtonImport: TRadioButton
    Left = 112
    Top = 40
    Width = 57
    Height = 17
    Caption = 'Import'
    TabOrder = 2
  end
  object EditFile: TEdit
    Left = 56
    Top = 64
    Width = 313
    Height = 21
    TabOrder = 3
    OnChange = ExImportChange
  end
  object ButtonBrowse: TButton
    Left = 376
    Top = 64
    Width = 89
    Height = 21
    Caption = 'Durchsuchen...'
    TabOrder = 4
    OnClick = ButtonBrowseClick
  end
  object ButtonOK: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 5
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 88
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abbruch'
    ModalResult = 2
    TabOrder = 6
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'CSV-Datei (*.csv)|*.csv'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Ex-/Import Dateiauswahl'
    Left = 296
    Top = 16
  end
end
