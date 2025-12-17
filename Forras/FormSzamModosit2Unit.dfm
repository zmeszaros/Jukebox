object FormSzamModosit2: TFormSzamModosit2
  Left = 588
  Top = 107
  AutoScroll = False
  BorderIcons = []
  Caption = 'Szám módosítása'
  ClientHeight = 226
  ClientWidth = 409
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 393
    Height = 161
    Caption = 'Adatok'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 51
      Height = 19
      Caption = 'Elõadó:'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 73
      Width = 32
      Height = 19
      Caption = 'Cím:'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 113
      Width = 57
      Height = 19
      Caption = 'Útvonal:'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnBorito: TSpeedButton
      Left = 355
      Top = 113
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
    object eEloado: TEdit
      Left = 80
      Top = 32
      Width = 305
      Height = 27
      TabOrder = 0
    end
    object eCim: TEdit
      Left = 80
      Top = 72
      Width = 305
      Height = 27
      TabOrder = 1
    end
    object eUtvonal: TEdit
      Left = 80
      Top = 112
      Width = 273
      Height = 27
      TabOrder = 2
    end
  end
  object btnModosit: TBitBtn
    Left = 8
    Top = 184
    Width = 121
    Height = 33
    Caption = 'Módosít'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
    Left = 280
    Top = 184
    Width = 121
    Height = 33
    Caption = 'Mégsem'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
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
  object OpenDialog: TOpenDialog
    Filter = 'Mpeg(*.mp3)|*.mp3'
    Left = 192
    Top = 176
  end
end
