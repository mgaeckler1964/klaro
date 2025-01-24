object SearchForm: TSearchForm
  Left = 1465
  Top = 501
  BorderStyle = bsDialog
  Caption = 'Suche Schüler'
  ClientHeight = 73
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Text:'
  end
  object EditSearch: TEdit
    Left = 40
    Top = 8
    Width = 425
    Height = 21
    TabOrder = 0
  end
  object ButtonSearch: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Suche'
    Default = True
    TabOrder = 1
    OnClick = ButtonSearchClick
  end
  object ButtonCancel: TButton
    Left = 168
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'S&chließen'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object ButtonSearchNext: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Weiter suchen'
    TabOrder = 2
    OnClick = ButtonSearchClick
  end
end
