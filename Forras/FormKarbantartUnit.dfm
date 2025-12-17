object FormKarbantart: TFormKarbantart
  Left = 10
  Top = 51
  AutoScroll = False
  BorderIcons = []
  Caption = 'Karbantartás'
  ClientHeight = 473
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 745
    Height = 225
    TabOrder = 0
    object Bevel1: TBevel
      Left = 565
      Top = 32
      Width = 140
      Height = 140
    end
    object iBorito: TImage
      Left = 567
      Top = 34
      Width = 136
      Height = 136
      Stretch = True
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 79
      Height = 22
      Caption = 'Albumok:'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 608
      Top = 8
      Width = 52
      Height = 22
      Caption = 'Borító'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAlbumTorles: TBitBtn
      Left = 632
      Top = 184
      Width = 97
      Height = 25
      Caption = 'Törlés'
      TabOrder = 2
      OnClick = btnAlbumTorlesClick
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
    object BtnAlbumModosit: TBitBtn
      Left = 528
      Top = 184
      Width = 97
      Height = 25
      Caption = 'Módosítás'
      TabOrder = 1
      OnClick = BtnAlbumModositClick
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
    object DBGridAlbum: TDBGrid
      Left = 16
      Top = 32
      Width = 497
      Height = 177
      DataSource = DM.AlbumokDataSource
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = EASTEUROPE_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      OnCellClick = DBGridAlbumCellClick
      OnKeyDown = DBGridAlbumKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ELOADO'
          Title.Alignment = taCenter
          Title.Caption = 'Elõadó'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIM'
          Title.Alignment = taCenter
          Title.Caption = 'Cím'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BORITO'
          Title.Alignment = taCenter
          Title.Caption = 'Borító'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 160
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 240
    Width = 641
    Height = 225
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 70
      Height = 22
      Caption = 'Számok:'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSzamTorles: TBitBtn
      Left = 528
      Top = 128
      Width = 97
      Height = 25
      Caption = 'Törlés'
      TabOrder = 2
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
    object btnSzamModosit: TBitBtn
      Left = 528
      Top = 88
      Width = 97
      Height = 25
      Caption = 'Módosítás'
      TabOrder = 1
      OnClick = btnSzamModositClick
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
    object DBGridSzamok: TDBGrid
      Left = 16
      Top = 32
      Width = 497
      Height = 177
      DataSource = DM.SzamokDataSource
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = EASTEUROPE_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ELOADO'
          Title.Alignment = taCenter
          Title.Caption = 'Elõadó'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SZAMCIM'
          Title.Alignment = taCenter
          Title.Caption = 'Számcím'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERC'
          Title.Alignment = taCenter
          Title.Caption = 'Perc'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UTVONAL'
          Title.Alignment = taCenter
          Title.Caption = 'Útvonal'
          Title.Font.Charset = EASTEUROPE_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end>
    end
  end
  object BtnBezar: TBitBtn
    Left = 656
    Top = 440
    Width = 99
    Height = 25
    Caption = 'Bezárás'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnBezarClick
    Kind = bkCancel
  end
end
