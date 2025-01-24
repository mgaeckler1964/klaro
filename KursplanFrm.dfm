object KursplanForm: TKursplanForm
  Left = 1543
  Top = 328
  BorderStyle = bsDialog
  Caption = 'Kursplan'
  ClientHeight = 151
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 34
    Height = 13
    Caption = 'Datum:'
  end
  object Label2: TLabel
    Left = 296
    Top = 17
    Width = 16
    Height = 13
    Caption = 'bis:'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Raum:'
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 45
    Height = 13
    Caption = 'Lehrkraft:'
  end
  object DateTimePickerStart: TDateTimePicker
    Left = 80
    Top = 16
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 39963.4924320023
    Time = 39963.4924320023
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object DateTimePickerEnd: TDateTimePicker
    Left = 320
    Top = 16
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 39963.4925603935
    Time = 39963.4925603935
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object ButtonOK: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abbruch'
    TabOrder = 5
    OnClick = ButtonCancelClick
  end
  object EditRaum: TEdit
    Left = 80
    Top = 48
    Width = 425
    Height = 21
    TabOrder = 2
  end
  object EditTeacher: TEdit
    Left = 80
    Top = 80
    Width = 425
    Height = 21
    TabOrder = 3
  end
end
