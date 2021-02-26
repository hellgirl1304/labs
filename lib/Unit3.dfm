object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1082#1072
  ClientHeight = 381
  ClientWidth = 344
  Color = 16744576
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 30
    Height = 13
    Caption = #1064#1080#1092#1088
  end
  object Label2: TLabel
    Left = 32
    Top = 86
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 32
    Top = 116
    Width = 31
    Height = 13
    Caption = #1052#1077#1089#1090#1086
  end
  object Edit1: TEdit
    Left = 128
    Top = 54
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 128
    Top = 84
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 128
    Top = 114
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 60
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 210
    Top = 336
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 72
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 216
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 80
    Top = 216
  end
end
