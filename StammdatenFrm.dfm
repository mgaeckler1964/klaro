object StammdatenForm: TStammdatenForm
  Left = 1424
  Top = 266
  BorderStyle = bsDialog
  Caption = 'Tr‰ger Stammdaten'
  ClientHeight = 407
  ClientWidth = 481
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
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label9: TLabel
    Left = 8
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Straﬂe'
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 20
    Height = 13
    Caption = 'PLZ'
  end
  object Label3: TLabel
    Left = 8
    Top = 208
    Width = 79
    Height = 13
    Caption = 'BAMF-Kennziffer'
  end
  object Label4: TLabel
    Left = 8
    Top = 288
    Width = 65
    Height = 13
    Caption = 'Kontonummer'
  end
  object Label5: TLabel
    Left = 8
    Top = 328
    Width = 52
    Height = 13
    Caption = 'Geldinstitut'
  end
  object Label6: TLabel
    Left = 64
    Top = 88
    Width = 14
    Height = 13
    Caption = 'Ort'
  end
  object Label7: TLabel
    Left = 136
    Top = 288
    Width = 20
    Height = 13
    Caption = 'BLZ'
  end
  object Label8: TLabel
    Left = 8
    Top = 248
    Width = 98
    Height = 13
    Caption = 'BAMF Regionalstelle'
  end
  object Label10: TLabel
    Left = 8
    Top = 168
    Width = 56
    Height = 13
    Caption = 'Bundesland'
  end
  object Label11: TLabel
    Left = 8
    Top = 128
    Width = 36
    Height = 13
    Caption = 'Telefon'
  end
  object EditTraegerName: TEdit
    Left = 8
    Top = 24
    Width = 465
    Height = 21
    TabOrder = 0
    Text = 'EditTraegerName'
  end
  object EditTraegerStrasse: TEdit
    Left = 8
    Top = 64
    Width = 465
    Height = 21
    TabOrder = 1
    Text = 'EditTraegerStrasse'
  end
  object EditTraegerPlz: TEdit
    Left = 8
    Top = 104
    Width = 49
    Height = 21
    TabOrder = 2
    Text = 'EditTraegerPlz'
  end
  object EditTraegerOrt: TEdit
    Left = 64
    Top = 104
    Width = 409
    Height = 21
    TabOrder = 3
    Text = 'EditTraegerOrt'
  end
  object EditTraegerBamfNr: TEdit
    Left = 8
    Top = 224
    Width = 465
    Height = 21
    TabOrder = 6
    Text = 'EditTraegerBamfNr'
  end
  object EditTraegerKonto: TEdit
    Left = 8
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'EditTraegerKonto'
  end
  object EditTraegerBlz: TEdit
    Left = 136
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'EditTraegerBlz'
  end
  object EditTraegerBank: TEdit
    Left = 8
    Top = 344
    Width = 465
    Height = 21
    TabOrder = 10
    Text = 'EditTraegerBank'
  end
  object ButtonSave: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Speichern'
    Default = True
    TabOrder = 11
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TButton
    Left = 88
    Top = 376
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abbruch'
    TabOrder = 12
    OnClick = ButtonCancelClick
  end
  object EditBAMFregionalstelle: TEdit
    Left = 8
    Top = 264
    Width = 465
    Height = 21
    TabOrder = 7
    Text = 'EditBAMFregionalstelle'
  end
  object EditTraegerBundesland: TEdit
    Left = 8
    Top = 184
    Width = 465
    Height = 21
    TabOrder = 5
    Text = 'EditTraegerBundesland'
  end
  object EditTraegerTelefon: TEdit
    Left = 8
    Top = 144
    Width = 465
    Height = 21
    TabOrder = 4
    Text = 'EditTraegerTelefon'
  end
end
