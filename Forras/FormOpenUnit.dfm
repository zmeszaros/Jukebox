object FormOpen: TFormOpen
  Left = 230
  Top = 107
  Width = 433
  Height = 342
  BorderIcons = []
  Caption = 'Megnyitás'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 48
    Top = 10
    Width = 37
    Height = 19
    Caption = 'Hely:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDir: TLabel
    Left = 8
    Top = 280
    Width = 108
    Height = 19
    Caption = 'C:\Programozas\a'
    Transparent = True
    Visible = False
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 40
    Width = 409
    Height = 225
    DirLabel = LabelDir
    ItemHeight = 19
    TabOrder = 0
  end
  object DriveComboBox1: TDriveComboBox
    Left = 104
    Top = 8
    Width = 265
    Height = 25
    DirList = DirectoryListBox1
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 280
    Width = 97
    Height = 25
    Caption = '&Rendben'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 280
    Width = 97
    Height = 25
    Caption = '&Mégsem'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Kind = bkCancel
  end
end
