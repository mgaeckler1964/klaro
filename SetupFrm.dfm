object SetupForm: TSetupForm
  Left = 1549
  Top = 559
  Width = 369
  Height = 193
  Caption = 'Einstellungen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 62
    Height = 13
    Caption = 'Berichtspfad:'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 75
    Height = 13
    Caption = 'Kursinfofarbe#1'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 75
    Height = 13
    Caption = 'Kursinfofarbe#2'
  end
  object ButtonOK: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = ButtonOKClick
  end
  object CheckBoxMultiStart: TCheckBox
    Left = 8
    Top = 8
    Width = 169
    Height = 17
    Caption = '&Mehrfaches Starten erlauben'
    TabOrder = 1
  end
  object EditReportPath: TEdit
    Left = 112
    Top = 32
    Width = 233
    Height = 21
    TabOrder = 2
  end
  object ButtonCancel: TButton
    Left = 88
    Top = 128
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'A&bbruch'
    ModalResult = 2
    TabOrder = 3
  end
  object EditColor1: TEdit
    Left = 112
    Top = 64
    Width = 153
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object EditColor2: TEdit
    Left = 112
    Top = 96
    Width = 153
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object ButtonSelectColor1: TButton
    Left = 272
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Wählen...'
    TabOrder = 6
    OnClick = ButtonSelectColor1Click
  end
  object ButtonSelectColor2: TButton
    Left = 272
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Wählen...'
    TabOrder = 7
    OnClick = ButtonSelectColor2Click
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 184
  end
end
