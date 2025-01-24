object OverlappedForm: TOverlappedForm
  Left = 1382
  Top = 401
  Width = 704
  Height = 307
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Überlappungen'
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
  object StringGridResult: TStringGrid
    Left = 0
    Top = 41
    Width = 692
    Height = 235
    Align = alClient
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 41
    Align = alTop
    TabOrder = 1
    object ButtonReload: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Neu laden'
      TabOrder = 0
      OnClick = FormShow
    end
  end
end
