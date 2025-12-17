object FormFelvitel: TFormFelvitel
  Left = 76
  Top = 76
  Width = 770
  Height = 500
  BorderIcons = []
  Caption = 'Új album felvitele'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 377
    Height = 57
    Caption = 'Könyvtár'
    TabOrder = 0
    object BtnOpen: TSpeedButton
      Left = 332
      Top = 19
      Width = 33
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
      OnClick = BtnOpenClick
    end
    object EditOpen: TEdit
      Left = 16
      Top = 19
      Width = 313
      Height = 25
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 72
    Width = 377
    Height = 129
    Caption = 'Album elõadója és címe'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 26
      Width = 40
      Height = 17
      Caption = 'Elõadó'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 24
      Height = 17
      Caption = 'Cím'
    end
    object eEloado: TEdit
      Left = 56
      Top = 24
      Width = 313
      Height = 25
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 64
      Top = 92
      Width = 249
      Height = 25
      Caption = 'Elõadó hozzáadása az összes számhoz'
      TabOrder = 1
      OnClick = BitBtn4Click
    end
  end
  object eCim: TEdit
    Left = 64
    Top = 128
    Width = 313
    Height = 25
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 208
    Width = 377
    Height = 217
    Caption = 'Borító'
    TabOrder = 3
    object Label3: TLabel
      Left = 144
      Top = 117
      Width = 86
      Height = 24
      Caption = 'Nincs kép'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 104
      Top = 51
      Width = 161
      Height = 160
    end
    object iBorito: TImage
      Left = 107
      Top = 53
      Width = 155
      Height = 155
      Stretch = True
    end
    object BtnBorito: TSpeedButton
      Left = 332
      Top = 19
      Width = 33
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
    object SpeedButton1: TSpeedButton
      Left = 280
      Top = 176
      Width = 81
      Height = 33
      Hint = 'Kép törlése'
      Caption = 'Törlés'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF78
        8777FFFFFFFFF7808077FFFFFFFF78011117FFFFFFF708111198FFFFFF700011
        1918FFFFF70880019187FFFF70887F0018FFFFF70887FFF00FFFFF70007FFF80
        7FFFF703300FF807FFFF70337F00807FFFFF0337FB3007FFFFFF3B7FB3307FFF
        FFFFB7FB3307FFFFFFFF7FB3307FFFFFFFFFF73307FFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object EditBorito: TEdit
      Left = 16
      Top = 19
      Width = 313
      Height = 25
      TabStop = False
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 392
    Top = 8
    Width = 361
    Height = 417
    Caption = 'Számok'
    TabOrder = 4
    object btnSzamTorles: TBitBtn
      Left = 8
      Top = 352
      Width = 113
      Height = 25
      Caption = 'Törlés'
      TabOrder = 0
      OnClick = btnSzamTorlesClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF78
        8777FFFFFFFFF7808077FFFFFFFF78011117FFFFFFF708111198FFFFFF700011
        1918FFFFF70880019187FFFF70887F0018FFFFF70887FFF00FFFFF70007FFF80
        7FFFF703300FF807FFFF70337F00807FFFFF0337FB3007FFFFFF3B7FB3307FFF
        FFFFB7FB3307FFFFFFFF7FB3307FFFFFFFFFF73307FFFFFFFFFF}
    end
    object sgSzamok: TStringGrid
      Left = 8
      Top = 16
      Width = 345
      Height = 329
      ColCount = 4
      DefaultColWidth = 120
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 384
      Width = 113
      Height = 25
      Caption = 'Módosítás'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF222222F
        FFFFFFF22FFFFFFFFFFFFF2FFFFFFFFFFFFFF2F0022FFFFFFFFF2FF00BB2FFFF
        FFFFFFF2BB212FFFFFFFFFF2B21112FFFFFFFFFF2111112FFFFFFFFFF2111112
        FFFFFFFFFF2111112FFFFFFFFFF2111112FFFFFFFFFF2111112FFFFFFFFFF211
        1112FFFFFFFFFF211112FFFFFFFFFFF2112FFFFFFFFFFFFF22FF}
    end
    object btnSzamUjra: TBitBtn
      Left = 134
      Top = 384
      Width = 219
      Height = 25
      Caption = 'Számcím úljraolvasása fájlnévbõl'
      Enabled = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSzamUjraClick
    end
    object btnEloadoUjra: TBitBtn
      Left = 134
      Top = 352
      Width = 219
      Height = 25
      Caption = 'Elõadó újraolvasása fájlnévbõl'
      Enabled = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnEloadoUjraClick
    end
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 432
    Width = 209
    Height = 33
    Caption = '&Hozzáadás az adatbázishoz'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555205555555555555222055555555555522205555
      5555555222220555555555222222055555555822052220555555820555522055
      5555555555522205555555555555220555555555555552205555555555555582
      0555555555555558205555555555555552205555555555555555}
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 432
    Width = 169
    Height = 33
    Caption = '&Bezárás'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn2Click
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
  object flbSzamok: TFileListBox
    Left = 352
    Top = 432
    Width = 89
    Height = 41
    Enabled = False
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp'
    Left = 320
    Top = 272
  end
end
