object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
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
    Width = 63
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1085#1080#1075#1080
    Color = clAqua
    ParentColor = False
  end
  object Label2: TLabel
    Left = 32
    Top = 86
    Width = 70
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086#1088#1072
  end
  object Label3: TLabel
    Left = 32
    Top = 116
    Width = 63
    Height = 13
    Caption = #1064#1080#1092#1088' '#1087#1086#1083#1082#1080
  end
  object Label4: TLabel
    Left = 32
    Top = 146
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Edit1: TEdit
    Left = 128
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 60
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 210
    Top = 336
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 57
    Width = 145
    Height = 21
    KeyField = #1053#1086#1084#1077#1088
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077
    ListSource = DataSource1
    TabOrder = 3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 128
    Top = 84
    Width = 145
    Height = 21
    KeyField = #1053#1086#1084#1077#1088
    ListField = #1060#1048#1054
    ListSource = DataSource2
    TabOrder = 4
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 128
    Top = 114
    Width = 145
    Height = 21
    KeyField = #1064#1080#1092#1088
    ListField = #1053#1072#1079#1074#1072#1085#1080#1077
    ListSource = DataSource3
    TabOrder = 5
  end
  object Button3: TButton
    Left = 72
    Top = 336
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button3Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from book ')
    Left = 48
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from author')
    Left = 48
    Top = 280
  end
  object ADOQuery3: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from bookshelf')
    Left = 128
    Top = 224
  end
  object ADOQuery4: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 128
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 208
    Top = 224
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 208
    Top = 280
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 280
    Top = 224
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 280
    Top = 280
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery5
    Left = 296
    Top = 40
  end
  object ADOQuery5: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ranking')
    Left = 296
    Top = 104
  end
end
