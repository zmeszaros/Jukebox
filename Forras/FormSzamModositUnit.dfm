object FormSzamModosit: TFormSzamModosit
  Left = 219
  Top = 107
  Width = 433
  Height = 187
  BorderIcons = []
  Caption = 'Szám módosítása'
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 409
    Height = 105
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 19
    Caption = 'Elõadó:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 63
    Height = 19
    Caption = 'Számcím:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 8
    Top = 66
    Width = 409
    Height = 6
    Shape = bsBottomLine
  end
  object btnModosit: TBitBtn
    Left = 8
    Top = 120
    Width = 121
    Height = 33
    Caption = 'Módosít'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnModositClick
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
  object btnMegse: TBitBtn
    Left = 296
    Top = 120
    Width = 121
    Height = 33
    Caption = 'Mégsem'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
  object eEloado: TEdit
    Left = 88
    Top = 16
    Width = 321
    Height = 23
    TabOrder = 2
  end
  object eCim: TEdit
    Left = 88
    Top = 80
    Width = 321
    Height = 23
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 45
    Width = 137
    Height = 21
    Caption = 'Album elõadója'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
      555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
      05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
      FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
      FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
      FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
      05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
      555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
      9055575757575757775505050505055505557575757575557555}
    NumGlyphs = 2
  end
end
