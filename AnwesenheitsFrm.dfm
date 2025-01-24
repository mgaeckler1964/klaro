object AnwesenheitsForm: TAnwesenheitsForm
  Left = 1559
  Top = 500
  Width = 457
  Height = 290
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Anwesenheitsliste'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CourseTimeLabel: TLabel
    Left = 48
    Top = 8
    Width = 82
    Height = 13
    Caption = 'CourseTimeLabel'
  end
  object CurrentWeekLabel: TLabel
    Left = 48
    Top = 24
    Width = 89
    Height = 13
    Caption = 'CurrentWeekLabel'
  end
  object theScrollBox: TScrollBox
    Left = 8
    Top = 56
    Width = 433
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object CloseButton: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Schlieﬂen'
    TabOrder = 1
    OnClick = CloseButtonClick
  end
  object BackButton: TButton
    Left = 8
    Top = 8
    Width = 33
    Height = 33
    Caption = '<<'
    TabOrder = 2
    OnClick = BackButtonClick
  end
  object NextButton: TButton
    Left = 264
    Top = 8
    Width = 33
    Height = 33
    Caption = '>>'
    TabOrder = 3
    OnClick = NextButtonClick
  end
  object pupilQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'SELECT'#9'schueler.ID, schueler.NACHNAME, schueler.VORNAME'
      'FROM'#9'Kursschueler, schueler'
      'WHERE'#9'Kursschueler.KURS_ID = :theCourse and'
      #9#9'Kursschueler.schueler_ID = schueler.ID'
      'order by schueler.NACHNAME, schueler.VORNAME'
      ' '
      ' ')
    UniDirectional = True
    Left = 16
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'theCourse'
        ParamType = ptUnknown
      end>
  end
  object attendanceQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select datum, schueler_id, entschuldigt'
      'from anwesenheiten'
      'where datum >= :minDate and datum <= :maxDate'
      'order by schueler_id, datum')
    Left = 90
    Top = 66
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'minDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'maxDate'
        ParamType = ptInput
      end>
  end
  object deleteQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'delete from anwesenheiten'
      'where schueler_id = :thePupil'
      'and kurs_id = :theCourse'
      'and datum = :theDate')
    UniDirectional = True
    Left = 306
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theCourse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theDate'
        ParamType = ptUnknown
      end>
  end
  object insertQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'insert into anwesenheiten'
      '(entschuldigt, schueler_id, kurs_id, datum)'
      'values'
      '( :entschuldigt, :thePupil, :theCourse, :theDate)')
    UniDirectional = True
    Left = 170
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'entschuldigt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theCourse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theDate'
        ParamType = ptUnknown
      end>
  end
  object updateQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'update anwesenheiten'
      'set entschuldigt=:entschuldigt'
      'where schueler_id = :thePupil'
      'and kurs_id = :theCourse'
      'and datum = :theDate'
      ' ')
    UniDirectional = True
    Left = 234
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'entschuldigt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thePupil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theCourse'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'theDate'
        ParamType = ptUnknown
      end>
  end
  object ferienQuery: TQuery
    DatabaseName = 'KlaroDB'
    SQL.Strings = (
      'select ANFANG, ENDE'
      'from ferien'
      'where (anfang >= :start1 and anfang <= :ende1)'
      'or (ende >= :start2 and ende <= :ende2)'
      'order by anfang')
    Left = 34
    Top = 130
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'start1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ende1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'start2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ende2'
        ParamType = ptUnknown
      end>
  end
end
