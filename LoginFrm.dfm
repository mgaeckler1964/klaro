object LoginForm: TLoginForm
  Left = 1659
  Top = 305
  BorderStyle = bsDialog
  Caption = 'Klaro - Datenbankanmeldung'
  ClientHeight = 140
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Benutzername'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 45
    Height = 13
    Caption = 'Kennwort'
  end
  object EditUsername: TEdit
    Left = 88
    Top = 8
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 88
    Top = 40
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object ButtonOK: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Anmelden'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object ButtonCancel: TButton
    Left = 88
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abbrechen'
    ModalResult = 2
    TabOrder = 3
  end
  object CheckBoxSavePassword: TCheckBox
    Left = 8
    Top = 72
    Width = 241
    Height = 17
    Caption = 'Kennwort speichern'
    TabOrder = 4
  end
end
