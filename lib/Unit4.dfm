object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #1050#1085#1080#1075#1072
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
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
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
    Width = 72
    Height = 13
    Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 32
    Top = 146
    Width = 64
    Height = 13
    Caption = #1043#1086#1076' '#1080#1079#1076#1072#1085#1080#1103
  end
  object Label5: TLabel
    Left = 32
    Top = 176
    Width = 104
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1072#1085#1080#1094
  end
  object Edit1: TEdit
    Left = 160
    Top = 54
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 160
    Top = 84
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 160
    Top = 114
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 160
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 3
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 160
    Top = 174
    Width = 145
    Height = 21
    TabOrder = 4
    OnKeyPress = Edit5KeyPress
  end
  object Button1: TButton
    Left = 61
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 210
    Top = 336
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 72
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button3Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 64
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 248
  end
end
