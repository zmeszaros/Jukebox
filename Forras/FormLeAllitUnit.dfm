object FormLeAllit: TFormLeAllit
  Left = 259
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cyber-X Jukebox'
  ClientHeight = 152
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 5
    Top = 16
    Width = 252
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'A számítógép automatikus kikapcsolása.'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 6
    Top = 80
    Width = 249
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = '10'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object ProgressBar1: TProgressBar
    Left = 18
    Top = 48
    Width = 225
    Height = 17
    Min = 0
    Max = 10
    Smooth = True
    TabOrder = 0
  end
  object Button1: TBitBtn
    Left = 87
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Mégsem'
    TabOrder = 1
    OnClick = Button1Click
    Kind = bkCancel
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 216
    Top = 104
  end
end
