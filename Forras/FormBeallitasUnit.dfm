object FormBeallitas: TFormBeallitas
  Left = 185
  Top = 129
  AutoScroll = False
  BorderIcons = []
  Caption = 'Beállítások'
  ClientHeight = 329
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 121
    Caption = 'Bedobott érme -> Credit'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 59
      Height = 17
      Caption = '50 Ft   = '
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 76
      Width = 59
      Height = 17
      Caption = '100 Ft = '
      Transparent = True
    end
    object Label3: TLabel
      Left = 136
      Top = 36
      Width = 42
      Height = 17
      Caption = 'Credit'
      Transparent = True
    end
    object Label4: TLabel
      Left = 136
      Top = 76
      Width = 42
      Height = 17
      Caption = 'Credit'
      Transparent = True
    end
    object SpinEdit1: TSpinEdit
      Left = 77
      Top = 32
      Width = 50
      Height = 27
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxValue = 5
      MinValue = 1
      ParentFont = False
      TabOrder = 0
      Value = 1
    end
    object SpinEdit2: TSpinEdit
      Left = 77
      Top = 72
      Width = 50
      Height = 27
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxValue = 10
      MinValue = 1
      ParentFont = False
      TabOrder = 1
      Value = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 201
    Height = 73
    Caption = 'Kikapcsolás esetén'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 28
      Top = 32
      Width = 145
      Height = 17
      Caption = 'Windows leállítása'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 216
    Top = 8
    Width = 201
    Height = 121
    Caption = 'Feliratok színe'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 26
      Width = 185
      Height = 31
      Alignment = taCenter
      AutoSize = False
      Caption = 'Minta'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Button1: TButton
      Left = 56
      Top = 72
      Width = 89
      Height = 25
      Caption = 'Beállítás...'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object btnMegse: TBitBtn
    Left = 224
    Top = 290
    Width = 121
    Height = 33
    Caption = 'Mégsem'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 6
    OnClick = btnMegseClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777799977777777999779999777777999977999997777999997779999977999
      9977777999999999977777779999999977777777799999977777777779999997
      7777777799999999777777799999999997777799999779999977799999777799
      9997799997777779999779997777777799977777777777777777}
  end
  object GroupBox4: TGroupBox
    Left = 216
    Top = 136
    Width = 201
    Height = 73
    Caption = 'Gép bekapcsolása esetén'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object CheckBox2: TCheckBox
      Left = 20
      Top = 32
      Width = 161
      Height = 17
      Caption = 'A program elindítása'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnModosit: TBitBtn
    Left = 80
    Top = 290
    Width = 121
    Height = 33
    Caption = 'Rendben'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnModositClick
    Kind = bkOK
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 216
    Width = 409
    Height = 65
    Caption = 'Winamp elérési útvonala'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object BtnBorito: TSpeedButton
      Left = 368
      Top = 25
      Width = 30
      Height = 25
      Hint = 'Megnyitás'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnBoritoClick
    end
    object WinampPath: TEdit
      Left = 8
      Top = 25
      Width = 356
      Height = 25
      TabOrder = 0
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Options = [cdSolidColor]
    Left = 232
    Top = 32
  end
  object OpenDialog: TOpenDialog
    Filter = 'Winamp (Winamp.exe)|winamp.exe|All Exe (*.exe)|*.exe'
    Left = 368
    Top = 32
  end
end
